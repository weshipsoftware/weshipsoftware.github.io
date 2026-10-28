defmodule Sitemap do
  require Logger

  @domain Application.compile_env!(:wss, :domain)
  @sitemap Application.compile_env!(:wss, :sitemap)

  def build(paths) do
    paths
    |> Enum.filter(&valid?/1)
    |> Enum.map(&loc/1)
    |> render()
    |> then(&if changed?(&1), do: save(&1))
  end

  defp valid?(path) do
    Path.extname(path) == ".html" &&
      Path.basename(path) != "404.html"
  end

  defp loc(path) do
    loc =
      path
      |> String.replace_prefix("docs/", "")
      |> String.replace_suffix(".html", "")
      |> String.replace_suffix("index", "")

    "<url><loc>#{@domain}/#{loc}</loc></url>"
  end

  defp render(urls) do
    """
    <?xml version="1.0" encoding="UTF-8"?>
    <urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
      #{Enum.join(urls, "\n  ")}
    </urlset>
    """
  end

  defp changed?(sitemap) do
    !File.exists?(@sitemap) ||
      File.read!(@sitemap) != sitemap
  end

  defp save(sitemap) do
    Logger.info("Building sitemap.xml")
    File.write!(@sitemap, sitemap)
  end
end
