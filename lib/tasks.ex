defmodule Mix.Tasks.Build do
  require Logger
  use Mix.Task

  @src Application.compile_env!(:wss, :src)
  @tgt Application.compile_env!(:wss, :tgt)

  def run(["assets"]) do
    Logger.info("Building assets")
    Mix.Task.run("esbuild", ["default"])
  end

  def run(["markdown"]) do
    @src
    |> tree()
    |> Markdown.build()
  end

  def run(["sitemap"]) do
    @tgt
    |> tree()
    |> Sitemap.build()
  end

  def run(_) do
    run(["assets"])
    run(["markdown"])
    run(["sitemap"])
  end

  defp tree(dir) do
    dir
    |> File.ls!()
    |> Enum.map(&"#{dir}/#{&1}")
    |> Enum.map(&if File.dir?(&1), do: tree(&1), else: &1)
    |> List.flatten()
  end
end
