Array
  .from(document.getElementsByTagName("a"))
  .filter((a) => a.getAttribute("href").startsWith("http"))
  .forEach((a) => a.setAttribute("rel", "external"))
