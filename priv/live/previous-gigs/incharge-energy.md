---
layout: _layout.md
pageClass: release-note
pageId: ev-charging
---

<h1 style="margin-bottom: 0; margin-top: -.5em; color: black; background: white;">
  <small>Previous Gig:</small>
</h1>
<br />
<h1 style="margin-top: 0;">InCharge Energy</h1>

> Richard helped InCharge Energy ingest, store, and analyze **_millions of
> daily messages in real–time_**.

InCharge Energy is a full–lifecycle energy infrastructure partner delivering EV
charging, electrical, and distributed energy solutions—from design and
construction through long–term operations and maintenance.

<aside class="right">
  10,000 * 10,000 = 100,000,000 messages/day… minimum.
</aside>

One of InCharge Energy’s biggest customers needed to **onboard tens of thousands
of EV chargers** that would **each send tens of thousands of messages per day**
through InCharge Energy’s asset management platform.

### The Challenge

1. Reliably scale to handle the growing demand.
2. Connect new chargers without manually onboarding one–by–one.
3. Provide accurate, real–time insights for customers.

### The Solution

From 2024 through 2026, Richard worked at InCharge Energy **building and scaling
a data pipeline** that now processes **hundreds of millions of messages
per day in real–time**. His work was foundational for ingesting, storing, and
segmenting the massive amounts of data needed to provide the live status
insights that customers demand.

<aside class="left">
  Open standards don’t require onboarding.
</aside>

Richard researched and chose an open standard for communicating between
distributed systems, providing **security and reliability through structured
messaging**. He managed to reach **99.9+% uptime by designing the system to
self–heal** by restarting itself after upstream issues, picking up where it left
off, while handling automatic retries and idempotency to make sure it never
misses a message.

### The Result

The pipeline is now secure, reliable, and durable at scale, allowing
InCharge Energy to **_quickly add any number of EV chargers_** and **immediately
provide valuable insights** for their customers.

---

[THIS CTA NEEDS REWORKING]

<%= @include.("previous-gigs/_footer.md", []) %>
