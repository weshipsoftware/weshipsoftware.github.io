defmodule Assets do
	require Logger

	def build do
    Logger.info "Building assets"
    Mix.Task.rerun "esbuild", ["default", "--minify"]
	end
end
