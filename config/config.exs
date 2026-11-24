import Config

source = "priv/live"
target = "docs"

config :esbuild,
  version: "0.28.2",
  default: [
    args: ~w(async.js defer.js styles.css
        --bundle
        --target=es2017
        --outdir=../../../#{target}/@
        --external:/@/*
        --log-level=warning),
    cd: Path.expand("../#{source}/@", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

config :wss,
  domain: "https://weshipsoftware.com",
  sitemap: "#{target}/sitemap.xml",
  source: source,
  target: target
