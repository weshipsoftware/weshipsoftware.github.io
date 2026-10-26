defmodule WSS.MixProject do
  use Mix.Project

  def project do
    [
      app: :wss,
      version: "0.0.0",
      elixir: "~> 1.20",
      build_per_environment: false,
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {WSS, []}
    ]
  end

  defp deps do
    [
      {:bandit, "~> 1.13"},
      {:esbuild, "~> 0.10"},
      {:file_system, "~> 1.1"},
      {:mdex, "~> 0.14"},
      {:yaml_elixir, "~> 2.12"}
    ]
  end
end
