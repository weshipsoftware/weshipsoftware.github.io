defmodule Markdown do
  require Logger

  @source Application.compile_env!(:wss, :source)
  @target Application.compile_env!(:wss, :target)

  def build(paths) do
    paths
    |> Stream.filter(&valid?/1)
    |> Stream.map(&target/1)
    |> Stream.map(&html/1)
    |> Stream.filter(&changed?/1)
    |> Stream.each(&save/1)
    |> Stream.run()
  end

  defp valid?(path),
    do: Path.extname(path) == ".md" && !(Path.basename(path) |> String.starts_with?("_"))

  defp target(source) do
    target =
      source
      |> String.replace_prefix(@source, @target)
      |> String.replace_suffix(".md", ".html")

    {source, target}
  end

  defp html({source, target}), do: {source, target, render(source)}

  defp render(source, context \\ []) do
    data = File.read!(source)

    {yaml, markdown} =
      if String.starts_with?(data, "---") do
        [_, yaml, markdown] = String.split(data, "---", parts: 3)
        yaml = YamlElixir.read_from_string!(yaml)
        {yaml, markdown}
      else
        {%{}, data}
      end

    {template, context} =
      yaml
      |> Map.new(fn {key, value} -> {String.to_atom(key), value} end)
      |> Map.to_list()
      |> Keyword.merge(context)
      |> Keyword.put(:include, &render("#{@source}/#{&1}", &2))
      |> Keyword.pop_lazy(:layout, fn -> false end)

    html =
      markdown
      |> EEx.eval_string(assigns: context)
      |> MDEx.to_html!(render: [unsafe: true])

    if template do
      context = Keyword.put(context, :inner_content, html)
      render("#{@source}/#{template}", context)
    else
      html
    end
  end

  defp changed?({_, target, html}),
    do: !File.exists?(target) || File.read!(target) != html

  defp save({source, target, html}) do
    Logger.info("Building #{source} -> #{target}")
    File.mkdir_p!(Path.dirname(target))
    File.write!(target, html)
  end
end
