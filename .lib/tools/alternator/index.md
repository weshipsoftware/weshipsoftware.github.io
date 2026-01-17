---
@layout: .layout.html
---

# Alternator

<aside class="right">
	We build this site with Alternator.
</aside>

A CLI tool for building static websites on your Mac.  
Layouts, includes, and variables in HTML, CSS, and JS.
Markdown built-in. Localhost server optional.

---

- [Getting Started]()
- [Layouts]()
- [Includes]()
- [Variables]()
- [Pro Tips]()

---

```shell
/site $ alternator --help
USAGE: alternator <source> <target> [--watch] [--port <port>]

ARGUMENTS:
  <source>             Path to your source directory.
  <target>             Path to your target directory.

OPTIONS:
  -w, --watch          Rebiuld <source> as you save changes.
  -p, --port <port>    Serve <target> on localhost:<port>.
  --version            Show the version.
  -h, --help           Show help information.
```

## Getting Started

Alternator reads the files in your `<source>` directory, fills in the
layouts, includes, and variables, then saves the rendered files to
your `<target>` directory for publishing.

```shell
/site $ alternator path/to/source path/to/target
```

Layouts, includes, and variables are defined in `<source>` files using
comments and metadata. More on that later.

### Watching for Changes

Use the `--watch` flag to monitor `<source>` for changes and automatically
render after each save.

```shell
/site $ alternator path/to/source path/to/target --watch
[watch] watching path/to/source for changes
^c to stop
```

### Localhost Server

Add a `--port` to serve `<target>` on a localhost server.

```shell
/site $ alternator path/to/source path/to/target --port 8080
[serve] serving path/to/target at http://localhost:8080
^c to stop
```

### Putting It Together

Combine `--watch` and `--port` for a simple dev setup.

```shell
/site $ alternator path/to/source path/to/target -wp 8080
[watch] watching path/to/source for changes
[serve] serving path/to/target at http://localhost:8080
^c to stop
```

## Layouts

A CLI tool for building static websites on your Mac.
Layouts, includes, and variables in HTML, CSS, and JS.
Markdown built-in. Localhost server optional.

## Includes

A CLI tool for building static websites on your Mac.
Layouts, includes, and variables in HTML, CSS, and JS.
Markdown built-in. Localhost server optional.

## Variables

A CLI tool for building static websites on your Mac.
Layouts, includes, and variables in HTML, CSS, and JS.
Markdown built-in. Localhost server optional.

## Pro Tips

### Publishing Your Site

Sites can be published to any host that serves static files.

This site is hosted on GitHub using [/docs]() as the `<target>`.

Check your web host’s documentation for specifics.
