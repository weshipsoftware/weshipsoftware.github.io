We Ship Software (.com)
=======================

Builds `priv/live/` into `docs/`.

> Github Pages automatically deploys `docs/` from the latest `main` commit.

Builds
------

Run `mix build` to build the following:

### Assets

Run `mix build assets` builds and minifies `priv/live/@` into `docs/@`.

The esbuild config in `config/config.exs` defines which files get built.

- `async.js` is executed (by `_layout.md`) _as_ the page loads.
- `defer.js` is executed (by `_layout.md`) _after_ the page loads.
- Use `styles.css` as a manifest for all the other style sheets.

### Markdown

Run `mix build markdown` to build `priv/live/*.md` files into `docs/*.html`.

Markdown files with names starting with an underscore (`_`) are ignored so they
can be used as templates and includes.

### Sitemap

Run `mix build sitemap` to build `docs/sitemap.xml`.

The sitemap maps all the `docs/*.html` files.

Localhost
---------

Run `mix run --no-halt` to host `docs/` at http://localhost:4000.

The server follows the Github Pages default routes:

- `/404.html` is used for any not found HTML requests.
- `.html` can be removed from the route (`/foo.html` -> `/foo`).
- `/index.html` files are attempted on routes without file components
  (`/foo/index.html` at `/foo`).

While the server is running, changes to `priv/live/` will automatically trigger
rebuilds.

Embedded Elixir
---------------

Markdown files are eval’d as embedded Elixir before being parsed as Markdown.

### Frontmatter

YAML at the top of the file is converted to `@assigns` variables.

### Layouts

Defining a `layout` variable will render the file inside a layout.

```yaml
---
layout: _layout.md
---
```

The layout uses `<%= @inner_content %>` to place its content.

> The layout file path is relative to `priv/live/`.

Frontmatter assigns are passed up to the layout.
See `@pageClass` and `@pageId` as examples.

### Includes

Use `Markdown.include/2` to include files.

```elixir
<%= Markdown.include("path/to/_file.md", foo: "bar") %>
```

> The include file path is relative to `priv/live/`.

Drafts
------

`priv/drafts/` is for storing WIP files. Drafts starting with an underscore (`priv/drafts/_foo.md`) are gitignored.
