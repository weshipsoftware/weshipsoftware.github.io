defmodule Markdown do
  require Logger

  @source Application.compile_env! :wss, :source
  @target Application.compile_env! :wss, :target

  def build(paths) do
    paths
    |> Enum.filter(&valid?/1)
    |> Enum.map(&target/1)
    |> Enum.map(&html/1)
    |> Enum.filter(&changed?/1)
    |> Enum.each(&save/1)
  end

  defp valid?(path),
    do: Path.extname(path) == ".md" && !(Path.basename(path) |> String.starts_with?("_"))

  defp target(source) do
    target = source
    |> String.replace_prefix(@source, @target)
    |> String.replace_suffix(".md", ".html")
    {source, target}
  end

  defp html({source, target}), do: {source, target, render(source)}

  defp render(source, context \\ []) do
    data = File.read!(source)

    {yaml, md} = if !String.starts_with?(data, "---"), do: {[], data},
    else: String.split(data, "---", parts: 3) |> then(fn [_, yaml, md] -> {yaml, md} end)

    {template, assigns} = yaml
    |> YamlElixir.read_from_string!(atoms: true)
    |> Map.to_list
    |> Keyword.merge(context)
    |> Keyword.put(:include, &render("#{@source}/#{&1}", &2))
    |> Keyword.pop_lazy(:layout, fn -> nil end)

    html = md
    |> EEx.eval_string(assigns: assigns)
    |> MDEx.to_html!(render: [unsafe: true])
    |> Floki.parse_fragment!
    |> Floki.raw_html(pretty: true)

    if template == nil, do: html,
    else: render("#{@source}/#{template}", Keyword.put(assigns, :inner_content, html))
  end

  defp changed?({_, target, html}), do: !File.exists?(target) || File.read!(target) != html

  defp save({source, target, html}) do
    Logger.info "Building #{source} -> #{target}"
    File.mkdir_p! Path.dirname target
    File.write! target, html
  end
end
