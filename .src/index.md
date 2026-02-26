---
@layout: .layout.html
@pageTitle: We Ship Software
@pageClass: readme
@pageID: readme
---

# Hello, World!

<p>
  <mark>We Ship Software</mark> is a small development agency
  run by <a href="https://jarrodtaylor.me/">Jarrod Taylor</a>
  & <a href="https://richard.is/">Richard Rissanen</a>
  focused on one thing: <strong>shipping software</strong>.
</p>

We’re veterans of the tech industry, hands–on engineers,
helping to build **independent, product–led businesses**.

_And we’re really f\*cking good at it._

Hiring platforms are a mess,
freelancers are unreliable,
recruiting agencies are too expensive.

<aside class="right">
  How it should have been done all along.
</aside>

We started _We Ship Software_ to offer something better,
to **de–risk software development** by working directly
with a small roster of clients to build and ship exactly what
they need on a predictable timeline for a reasonable rate.

<form onkeyup="updateEmail()">
  <p><strong>What are you working on?</strong></p>
  <input id="name">
  <label for="name">Name</label>
  <p>
    <a href="mailto:email@weshipsoftware.com" id="sendBtn">📬 Send</a>
  </p>
</form>

<style>
  form {
    background: aliceblue;
    background: linear-gradient(0deg, aliceblue 0%, azure 100%);
    border-radius: .75rem;
    box-shadow: 0 0 2px silver;
    margin: 1.5rem 0 1rem -1rem;
    padding: 1rem 1rem .5rem 1rem;
    width: 100%;
    
    p:last-child { text-align: right; }
    #sendBtn { background: white; }
  }
</style>

<script>
  function updateEmail() {
    let name = document.getElementById("name").value

    let link = document.getElementById("sendBtn")
    link.href = "mailto:email@weshipsoftware.com?subject=" + name
  }
</script>

## What We Do

- [Hands–On Startup Consulting]()<br />
  For founders with traction,
  we will level up your organization to help keep you sane.
- [In–House, Bespoke Development]()<br />
  For independent business owners with fresh ideas,
  we will turn them into features, products, and services.
- [Creative Partnerships]() <mark>Coming Soon</mark><br />
  For creators with a growing audience,
  we will work with you to build something that resonates with your fans.

<h2 id="contact">
  We Want to Hear From You!
</h2>

<aside class="left">
  Near Nashville or West Palm Beach?
  <br /><br />
  Let’s get a coffee.
</aside>

Let us know what you’re working on.
We’ll answer any questions, see if we’re a good fit, then kick things off.

**[email@weshipsoftware.com](mailto:email@weshipsoftware.com)**