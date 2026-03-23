---
@layout: .layout.html
@pageTitle: Alternator
@pageClass: bin
@pageID: alternator
---

# Alternator

A CLI tool for building static websites on your Mac.  
Layouts, includes, and variables in HTML, CSS, and JS.  
Markdown built-in. Localhost server optional.

```plaintext
/website % alternator --help
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

---

- [Installation](#installation)
- [Getting Started](#getting-started)
- [Layouts](#layouts)
- [Includes](#includes)
- [Variables](#variables)
- [Pro Tips](#pro-tips)

---

<h2 id="installation">
  Installation
</h2>

Download the latest version and add it to your path.

<aside class="right">
  Check out the source code on the
  <a href="https://github.com/weshipsoftware/alternator">
    GitHub repo</a>.
</aside>

```shell
curl -O https://weshipsoftware.com/.share/alternator
sudo mv alternator /usr/local/bin/alternator
```

<h2 id="getting-started">
  Getting Started
</h2>

Alternator reads the files in your `<source>` directory,
fills in the layouts, includes, and variables,
then saves the rendered files to your `<target>` directory for publishing.


```shell
/website % alternator path/to/source path/to/target
```
Layouts, includes, and variables are defined in `<source>` files
using comments and metadata. More on that later.

### Watching for Changes

Use the `--watch` flag to monitor `<source>` for changes
and automatically render after each save.

```shell
/website % alternator path/to/source path/to/target --watch
[watch] watching path/to/source for changes
^c to stop
```

### Localhost Server

Add a `--port` to serve `<target>` on a localhost server.

```shell
/website % alternator path/to/source path/to/target --port 8080
[serve] serving path/to/target at http://localhost:8080
^c to stop
```

### Putting It Together

Combine `--watch` and `--port` for a simple dev setup.

```shell
/website % alternator path/to/source path/to/target -wp 8080
[watch] watching path/to/source for changes
[serve] serving path/to/target at http://localhost:8080
^c to stop
```

<h2 id="layouts">
  Layouts
</h2>

Any file can be used as a _layout_ by adding a `@content` comment
to specify where its contents should be rendered.

<samp>path/to/source/.layouts/main.html</samp>
```html
<!doctype html>
<html>
  <head>
    <title>Alternator</title>
  </head>
  <body>
    <!-- @content -->
  </body>
</html>
```

The `@layout` metadata key defines which layout a file should use.
The layout file path is relative to `<source>`.

<samp>path/to/source/index.html</samp>
```html
---
@layout: .layouts/main.html
---
<h1>Welcome</h1>
<p>Hello, world!</p>
```

Alternator will render a file inside its layout.

<samp>path/to/target/index.html</samp>
```html
<!doctype html>
<html>
  <head>
    <title>Alternator</title>
  </head>
  <body>
    <h1>Welcome</h1>
    <p>Hello, world!</p>
  </body>
</html>
```

<h2 id="includes">
  Includes
</h2>

Files can include other files using an `@include` comment.
The included file path is relative to `<source>`.

<samp>path/to/source/app.js</samp>
```js
// @include .scripts/foo.js
// @include .scripts/bar.js
```

<samp>path/to/source/.scripts/foo.js</samp>
```js
function foo() {
  console.log("hello")
}
```

<samp>path/to/source/.scripts/bar.js</samp>
```js
function bar() {
  console.log("world")
}
```

Alternator will render included files in place.

<samp>path/to/target/app.js</samp>
```js
function foo() {
  console.log("hello")
}
function bar() {
  console.log("world")
}
```

<h2 id="variables">
  Variables
</h2>

Variables are defined with `@` arguments on includes.

<samp>path/to/source/design.css</samp>
```css
/* @include .styles/fontFace.css @fontName: Helvetica */
```

And referenced in comments.

<samp>path/to/source/.styles/fontFace.css</samp>
```css
@font-face {
  font-family: /* @fontName */;
  src: url("/fonts//* @fontName */.woff2");
}
```

Alternator will render variables in place.

<samp>path/to/target/design.css</samp>
```css
@font-face {
  font-family: Helvetica;
  src: url("/fonts/Helvetica.woff2");
}
```

<h2 id="pro-tips">
  Pro Tips
</h2>

### Structuring Your Site

Alternator has no directory structure requirements
so you can organize `<source>` however you like.

The structure of `<source>` will be copied to `<target>`.

The structure of `<target>` becomes published URLs.

### Keeping `<target>` Clean

Removing a `<source>` file also deletes its `<target>`.

### Ignoring Dotfiles

Use a `.` at the beginning of a file or directory name
to tell Alternator to ignore it, both in `<source>` and `<target>`.

`<source>` dotfiles won’t be moved to `<target>`.

`<target>` dotfiles won’t be cleaned and will be published.

This leaves config files such as `.env` and `.git/` untouched.

Use this feature to keep `<source>` layouts and includes
from being moved to `<target>`
and prevent assets in `<target>` from being cleaned up.

### Using Markdown

Markdown files (`.md`) are automatically converted to HTML
and copied to `<target>` as `.html` files.

### Multiple Include Arguments

`@include` statements can have multiple arguments,
formatted as `@key: value` and separated by spaces:

`// @include sample.js @foo: true @bar: false`

### Fallback Variable Values

Define fallback values for variables with the `??` operator:

`<!-- @foo ?? bar -->`

### Layout Your Includes

Included files can have their own layouts,
either defined in their metadata
or as an argument passed with the `@include` statement:

`<!-- @include .posts/post.md @layout: .postLayout.html -->`

Bypass an included file’s layout with `@layout: false`.

### Managing Static Assets

Files that can’t be rendered, such as images, are considered static assets
and copied as-is from `<source>` to `<target>`.

Put static assets directly in `<target>` under a `.` directory
like `.assets/` or `.images/` to avoid excess copies.

### Clean URLs

The localhost server supports clean urls.

For example, `<target>/foo.html` is available at `localhost:8080/foo`
so you don’t have to clutter your project with extra directories
and index files.

_Not all production servers support this._

### Displaying a 404 Not Found Page

If the localhost server cannot find a requested file,
it will return the _404 Not Found_ HTTP response status code.

If `<target>/404.html` exists,
it will be returned for any not found HTML requests.

No response body will be returned for non-HTML requests.

_Not all production servers support this._

### Publishing Your Site

Sites can be published to any host that serves static files.

This site is hosted on GitHub using `/docs` as the `<target>`.

Check your web host’s documentation for specifics.