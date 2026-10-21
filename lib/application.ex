defmodule WSS do
	use Application

	def start(_type, _args) do
    Supervisor.start_link([{Bandit, plug: Server}],
      strategy: :one_for_one,
      name: Supervisor)
	end

	def build do
    Assets.build()
    Markdown.build()
    Sitemap.build()
	end

	def tree(directory) do
    directory
    |> File.ls!()
    |> Enum.map(& "#{directory}/#{&1}")
    |> Enum.map(& if File.dir?(&1), do: tree(&1), else: &1)
    |> List.flatten()
	end
end
