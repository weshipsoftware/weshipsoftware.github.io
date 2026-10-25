import Config

config :esbuild,
  version: "0.28.2",
  default: [
    args:
      ~w(async.js defer.js styles.css
        --bundle
        --target=es2017
        --outdir=../../../docs/@
        --external:/@/*
        --log-level=warning),
    cd: Path.expand("../priv/live/@", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :wss,
  domain: "https://weshipsoftware.com",
  sitemap: "docs/sitemap.xml",
  source: "priv/live",
  target: "docs"
