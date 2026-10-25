defmodule Markdown do
  require Logger

  @src Application.compile_env!(:wss, :src)
  @tgt Application.compile_env!(:wss, :tgt)

  def build(paths) do
    paths
    |> Enum.filter(&valid?/1)
    |> Enum.map(&target/1)
    |> Enum.map(&html/1)
    |> Enum.filter(&changed?/1)
    |> Enum.each(&save/1)
  end

  defp valid?(path) do
    Path.extname(path) == ".md" &&
      !(Path.basename(path) |> String.starts_with?("_"))
  end

  defp target(src) do
    tgt =
      src
      |> String.replace_prefix(@src, @tgt)
      |> String.replace_suffix(".md", ".html")

    {src, tgt}
  end

  defp html({src, tgt}), do: {src, tgt, render(src)}

  defp render(src, cxt \\ []) do
    data = File.read!(src)

    {yaml, md} =
      if String.starts_with?(data, "---") do
        [_, yaml, md] = String.split(data, "---", parts: 3)
        {yaml, md}
      else
        {[], data}
      end

    yaml
    |> YamlElixir.read_from_string!(atoms: true)
    |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
    |> IO.inspect()

    {template, cxt} =
      yaml
      |> YamlElixir.read_from_string!(atoms: true)
      |> Map.new(fn {k, v} -> {String.to_atom(k), v} end)
      |> Map.to_list()
      |> Keyword.merge(cxt)
      |> Keyword.put(:include, &render("#{@src}/#{&1}", &2))
      |> Keyword.pop_lazy(:layout, fn -> false end)

    html =
      md
      |> EEx.eval_string(assigns: cxt)
      |> MDEx.to_html!(render: [unsafe: true])
      |> Floki.parse_fragment!()
      |> Floki.raw_html(pretty: true)

    if template do
      cxt = Keyword.put(cxt, :inner_content, html)
      render("#{@src}/#{template}", cxt)
    else
      html
    end
  end

  defp changed?({_, tgt, html}) do
    !File.exists?(tgt) ||
      File.read!(tgt) != html
  end

  defp save({src, tgt, html}) do
    Logger.info("Building #{src} -> #{tgt}")
    File.mkdir_p!(Path.dirname(tgt))
    File.write!(tgt, html)
  end
end
