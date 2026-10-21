defmodule Mix.Tasks.Build do
	use Mix.Task

	def run(args) do
	  case args do
      ["assets"]   -> Assets.build()
      ["markdown"] -> Markdown.build()
      ["sitemap"]  -> Sitemap.build()
      _            -> WSS.build()
		end
	end
end
