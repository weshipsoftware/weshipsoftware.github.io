---
@layout: .layout.html
@pageTitle: We Ship Software
@pageClass: readme
@pageID: readme
---

# Hello, World!

**_We Ship Software_** is a small development agency
run by [Jarrod Taylor][jt.me] & [Richard Rissanen][rr.is]
focused on one thing: <strong>shipping software</strong>.

We’re veterans of the tech industry, hands–on engineers,
working to build **independent, product–led businesses**.

_And we’re really fucking good at it._

## How It Should Have Been Done All Along.

Hiring platforms are a mess. Freelancers are unreliable.

By only working with a limited roster of motivated clients
_and really putting in the effort to get to know their business_,
we manage to deliver **reliable results** for **predictable prices**
— effectively **de–risking software development**.

---

<form>
  <textarea id="prompt" placeholder="What can we do for you?"></textarea>
  <a
    href="mailto:email@weshipsoftware.com?subject=🚀 Not Spam"
    onclick="solve(this)">
    Solve My Problem
  </a>
  <small>Big red solution generating button.</small>
</form>

---

## Let’s Do This Right!

Hiring platforms are a mess, freelancers are unreliable, and recruiting agencies are too expensive.

<aside class="left">
  Read this before hiring more programmers.
</aside>

- [Shape Up Your Startup](/services/startup-consulting)<br />
  For founders with traction,
  we will level up your organization to help keep you sane.
- [In–House, Bespoke Development](/services/bespoke-development)<br />
  For independent business owners with fresh ideas,
  we will turn them into features, products, and services.
- [Creative Partnerships]() <mark>Coming Soon</mark><br />
  For creators with a growing audience,
  we will work with you to build something that resonates with your fans.

## Where Do We Go From Here?

<aside class="left">
  Near Nashville or West Palm Beach?
  <br /><br />
  Let’s get a coffee.
</aside>

Let us know what you’re working on.
We’ll answer any questions, see if we’re a good fit, then kick things off.

**[email@weshipsoftware.com][mailto]**

<style>
  #readme {
    form {
      width: 100%;
      
      textarea {
        font-family: text;
        font-size: .75rem;
        width: calc(100% - 1rem);
        height: 4rem;
        border-radius: .25rem;
        padding: .5rem;
        border: 1px dashed silver;
        margin-bottom: .25rem;
        outline: none;
        
        &:focus {
          border: 1px solid silver;
        }
      }
      
      p:last-child { text-align: right; }
      
      small {
        color: indigo;
        font-family: note;
        margin-left: .5rem;
      }
      
      a {
        background: crimson;
        background: linear-gradient(0deg, firebrick 0%, crimson 100%);
        border-radius: .25rem;
        box-shadow: 0 0 1px black;
        color: white;
        display: inline-block;
        font-weight: 500;
        font-size: .875rem;
        padding: .125rem .5rem;
        text-decoration: none;
        
        &:hover {
          box-shadow: 0 0 3px silver;
          margin: 0;
          transform: scale(1.03);
        }
      }
    }

    header a:last-child { display: none; }

    ul { list-style-type: "👉  "; }
  }
</style>

<script>
  function solve(el) {
    let body = document.getElementById("prompt").value
    el.href = "mailto:email@weshipsoftware.com?subject=🚀 Not Spam&body="
      + encodeURIComponent(body)
  }
</script>

[jt.me]: https://jarrodtaylor.me
[rr.is]: https://richard.is
[mailto]: mailto:email@weshipsoftware.com