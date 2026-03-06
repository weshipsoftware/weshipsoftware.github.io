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

<aside class="right">
  We like to roll up our sleeves and do the hard work.
</aside>

By only working with a limited roster of motivated clients
_and putting in the extra effort to get to know their business_,
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

Tap into our years of industry experience shipping software
used by [thousands of companies and millions of customers](/case-studies)
all around the world every day.

<aside class="left">
  Read this one before hiring more programmers.
</aside>

- [Shape Up Your Startup](/srv/startup-consulting)<br />
  _For founders with traction:_
  We will refactor your technical and social systems
  to **grow your company with confidence**.

- [Launch Something New](/srv/bespoke-development)<br />
  _For execs with fresh ideas:_
  We will translate your business plan into production code
  and **get it out to your customers**.

<aside class="right">Our favorite new business model.</aside>

- **Connect With Your Audience** **_Coming Soon_**<br />
  _For creators with a growing reach:_
  We will partner with you
  to build products that **resonate with your fans**.

## Where Do We Go From Here?

<aside class="left">
  Near Nashville or West Palm Beach?<br /><br />Let’s get a coffee.
</aside>

Let us know what you’re working on. We’ll have plenty of questions
to know each other and confirm a good fit.

When you like what you hear, we’ll kick things off.

<!-- Roadmapping session? -->

**[email@weshipsoftware.com][mailto]**

<style>
  form {
    width: 100%;

    a {
      background: crimson;
      background: linear-gradient(0deg, firebrick 0%, crimson 100%);
      border-radius: .25rem;
      box-shadow: 0 0 1px black;
      color: white;
      display: inline-block;
      font-size: .875rem;
      font-weight: 500;
      padding: .125rem .5rem;
      text-decoration: none;

      &:hover {
        background: linear-gradient(0deg,
          firebrick 0%, crimson 100%) !important;
        border-radius: .25rem !important;
        box-shadow: 0 0 3px silver;
        margin: 0;
        padding: .125rem .5rem !important;
        transform: scale(1.03);
      }
    }

    small {
      color: indigo;
      font-family: note;
      margin-left: .5rem;
    }

    textarea {
      background: #F0FFFF55;
      border: 1px dashed silver;
      border-radius: .25rem;
      font-family: text;
      font-size: .75rem;
      height: 4rem;
      margin-bottom: .25rem;
      margin-left: -1px;
      outline: none;
      padding: .5rem;
      width: calc(100% - 1rem);
      &:focus { border: 1px solid silver; }
    }
  }

  header a:last-child { display: none; }
  
  ul {
    list-style-type: "☞  ";

    li strong em {
      font-variant: all-small-caps;
      margin-left: .25rem;
    }
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