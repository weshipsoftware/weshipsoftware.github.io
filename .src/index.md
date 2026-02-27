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

We’re veterans of the tech industry, _hands–on engineers_,
helping to build **independent, product–led businesses**.

_And we’re really fucking good at it._

Hiring platforms are a mess,
freelancers are unreliable,
recruiting agencies are too expensive.

<aside class="right">
  How it should have been done all along.
</aside>

We started _We Ship Software_ to offer something better,
to **de–risk software development** by working directly
with a small roster of clients, _understanding their business_,
and **delivering reliable solutions** for **predictable prices**.

<form onkeyup="updateEmail()">
  <p><strong>How can we help?</strong></p>
  <textarea></textarea>
  <p>
    <small>Big Red Button that solves problems →</small>
    <a href="mailto:email@weshipsoftware.com" id="sendBtn">📬 Solve My Problem</a>
  </p>
</form>

## What We Do

- [Hands–On Startup Consulting](/services/startup-consulting)<br />
  For founders with traction,
  we will level up your organization to help keep you sane.
- [In–House, Bespoke Development](/services/bespoke-development)<br />
  For independent business owners with fresh ideas,
  we will turn them into features, products, and services.
- [Creative Partnerships]() <mark>Coming Soon</mark><br />
  For creators with a growing audience,
  we will work with you to build something that resonates with your fans.

## We Want to Hear From You!

<aside class="left">
  Near Nashville or West Palm Beach?
  <br /><br />
  Let’s get a coffee.
</aside>

Let us know what you’re working on.
We’ll answer any questions, see if we’re a good fit, then kick things off.

**[email@weshipsoftware.com](mailto:email@weshipsoftware.com)**

<style>
  #readme {
    form {
      background: aliceblue;
      box-shadow: 0 0 2px silver;
      margin: 1.5rem 0 1rem -1rem;
      padding: 1rem;
      width: 100%;
      
      textarea {
        width: calc(100% - .5rem);
        height: 3rem;
        margin-bottom: 1rem;
      }
      
      p:last-child { text-align: right; }
      
      small { font-family: note; }
      
      #sendBtn {
        background: crimson;
        border-radius: .25rem;
        color: white;
        font-variant: all-small-caps;
        padding: .5rem;
        text-decoration: none;
      }
    }

    header a:last-child { display: none; }

    ul { list-style-type: "👉  "; }
  }
</style>

<script>
  function updateEmail() {
    let name = document.getElementById("name").value
    let link = document.getElementById("sendBtn")
    link.href = "mailto:email@weshipsoftware.com?subject=" + name
  }
</script>
