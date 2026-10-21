defmodule WSS do
	use Application

	def start(_type, _args) do
    Supervisor.start_link [],
      strategy: :one_for_one,
      name: Supervisor
	end
end
