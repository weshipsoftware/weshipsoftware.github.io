defmodule Mix.Tasks.Build do
  require Logger
	use Mix.Task

	def run(["assets"]) do
	  Logger.info("Building assets")
    Mix.Task.run("esbuild", ["default", "--minify"])
	end

	def run(["markdown"]), do: tree("priv/live") |> Markdown.build()
	def run(["sitemap"]),  do: tree("docs")      |> Sitemap.build()

	def run(_) do
    run(["assets"])
    run(["markdown"])
    run(["sitemap"])
	end

	defp tree(directory) do
    directory
    |> File.ls!()
    |> Enum.map(& "#{directory}/#{&1}")
    |> Enum.map(& if File.dir?(&1), do: tree(&1), else: &1)
    |> List.flatten()
	end
end
