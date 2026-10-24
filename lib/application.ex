defmodule WSS do
	use Application

	def start(_type, _args) do
	  children = [
			{Bandit, plug: Server},
      {Watcher, ["docs", "priv/live"]}
		]

		Supervisor.start_link(children, strategy: :one_for_one, name: Supervisor)
	end
end
