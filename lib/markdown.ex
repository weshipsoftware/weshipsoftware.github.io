defmodule Markdown do
	require Logger

	defstruct [:source, :target, :html, :changed?]

	def build(paths) do
    paths
    |> Enum.filter(&valid?/1)
    |> Enum.each(fn path ->
      path
      |> cast()
      |> then(& if &1.changed?, do: save(&1))
    end)
	end

	def include(source, context \\ []), do: render("priv/live/#{source}", context)

	defp valid?(path) do
	  Path.extname(path) == ".md"
		&& !(Path.basename(path) |> String.starts_with?("_"))
	end

	defp cast(path) when is_binary(path), do: cast(%__MODULE__{source: path})

	defp cast(%__MODULE__{target: target} = file) when is_nil(target) do
	  target = file.source
		|> String.replace_prefix("priv/live", "docs")
		|> String.replace_suffix(".md", ".html")
		cast(%__MODULE__{file | target: target})
	end

	defp cast(%__MODULE__{html: html} = file) when is_nil(html) do
	  html = render(file.source)
		cast(%__MODULE__{file | html: html})
	end

	defp cast(%__MODULE__{changed?: changed?} = file) when is_nil(changed?) do
	  changed? = !File.exists?(file.target)
		|| File.read!(file.target) != file.html
	  %__MODULE__{file | changed?: changed?}
	end

	defp render(source, context \\ []) do
	  source
		|> File.read!()
		|> parse(:markdown)
		|> parse(:yaml)
		|> merge(context)
		|> eval()
		|> layout()
	end

	defp parse(data, :markdown) do
	  if !String.starts_with?(data, "---"),
			do: {[], data},
		else: data
      |> String.split("---", parts: 3)
      |> then(fn [_, yaml, md] -> {yaml, md} end)
	end

	defp parse({yaml, markdown}, :yaml) do
    yaml
    |> YamlElixir.read_from_string!()
    |> Enum.map(fn({k, v}) -> {String.to_atom(k), v} end)
    |> then(fn yaml -> {yaml, markdown} end)
	end

	defp merge({assigns, content}, context) do
		assigns
		|> Keyword.merge(context)
		|> Keyword.pop_lazy(:layout, fn -> nil end)
		|> then(fn {layout, assigns} -> {assigns, content, layout} end)
	end

	defp eval({assigns, content, layout}) do
    content
    |> EEx.eval_string(assigns: assigns)
    |> MDEx.to_html!(render: [unsafe: true])
    |> then(fn content -> {assigns, content, layout} end)
	end

	defp layout({_, content, nil}), do: content
	defp layout({assigns, content, template}) do
	  render("priv/live/#{template}",
			Keyword.put(assigns, :inner_content, content))
	end

	defp save(%__MODULE__{} = file) do
    Logger.info("Building #{file.source} -> #{file.target}")
    file.target
    |> Path.dirname()
    |> File.mkdir_p!()
    File.write!(file.target, file.html)
	end
end
