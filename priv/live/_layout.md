<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="description" content="We Ship Software">
    <meta name="keywords" content="We Ship Software">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="apple-touch-icon" href="/@/images/touch-icon.png">
    <link rel="icon" sizes="192x192" href="/@/images/touch-icon.png">
    <link rel="icon" type="image/x-icon" href="/@/images/favicon.ico">
    <link rel="preload" as="font" type="font/woff2" href="/@/fonts/400.woff2">
    <link rel="preload" as="font" type="font/woff2" href="/@/fonts/400i.woff2">
    <link rel="preload" as="font" type="font/woff2" href="/@/fonts/500.woff2">
    <link rel="preload" as="font" type="font/woff2" href="/@/fonts/700.woff2">
    <link rel="preload" as="font" type="font/woff2" href="/@/fonts/700i.woff2">
    <link rel="preload" as="font" type="font/woff2" href="/@/fonts/900.woff2">
    <link rel="preload" as="font" type="font/woff2" href="/@/fonts/note.woff2">
    <link rel="stylesheet" href="/@/styles.css">
    <script src="/@/async.js" async></script>
    <script src="/@/defer.js" defer></script>
    <title><%= @pageTitle || "We Ship Software" %></title>
  </head>
  <body
    class='<%= @pageClass || "" %>' id='<%= @pageId || "" %>'>
    <main>
      <header>
        <a href="mailto:email@weshipsoftware.com">email@weshipsoftware.com</a>
        <a href="/">ReadMe</a>
      </header>
      <article>
        <%= @inner_content %>
      </article>
    </main>
  </body>
</html>
