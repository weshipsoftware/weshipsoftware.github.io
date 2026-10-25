defmodule WSS do
  use Application

  @src Application.compile_env!(:wss, :src)
  @tgt Application.compile_env!(:wss, :tgt)

  def start(_type, _args) do
    children = [
      {Bandit, plug: Server},
      {Watcher, [@src, @tgt]}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Supervisor)
  end
end
