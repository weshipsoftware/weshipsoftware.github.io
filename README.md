# We Ship Software (.com)

The weshipsoftware.com website is built with [Alternator]
and hosted on [Github Pages].

## Development

The `alternator` command will build from `sources/` into `docs/`.

`-w` watches `sources/` for changes.

`-p <port>` runs `docs/` on localhost at the given port.

```shell
weshipsoftware.github.io $ alternator sources docs -wp 8080
```

### Clean Builds

If you need to clean `docs/`, make sure not to delete any dotfiles.

```shell
weshipsoftware.github.io $ rm -r docs/*
```

> There are [Nova] tasks set up for building, running, and cleaning.

## Deploying to Github Pages

`docs/` on the `main` branch is automatically deployed whenever changes are
pushed to Github.

`docs/.nojekyll` tells Github Pages not to remove dotfiles when deploying.

The `CNAME` file in `sources/` and `docs/` tells Github Pages to accept requests
from the weshipsoftware.com domain.

## Dotfiles

Dotfiles in `sources/` and `docs/` are ignored when building.

Dotfiles in `docs/`, such as `docs/.fonts/` and `docs/.images`),
are static assets that do not require building
but do need to be publicly accessible.

Dotfiles in `sources/`, such as `sources/.layout.html` and `sources/.scripts`,
are used for building
but do not need to be publicly accessible.

[Alternator]: https://alternator.sh
[Github Pages]: https://docs.github.com/en/pages
[Nova]: https://nova.app
