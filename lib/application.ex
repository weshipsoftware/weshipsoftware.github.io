defmodule WSS do
  use Application

  @source Application.compile_env! :wss, :source
  @target Application.compile_env! :wss, :target

  def start(_type, _args) do
    children = [
      {Bandit, plug: Server},
      {Watcher, [@source, @target]}
    ]

    Supervisor.start_link children, strategy: :one_for_one, name: Supervisor
  end
end
