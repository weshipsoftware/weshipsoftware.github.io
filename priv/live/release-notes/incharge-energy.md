---
layout: _layout.md
pageClass: release-note
pageId: ev-charging
---

<h1 style="margin-bottom: 0; color: black; background: white;"><small>Previous Gig:</small></h1>
<br />
<h1 style="margin-top: 0;">InCharge Energy</h1>

> Richard helped InCharge Energy ingest, store, and analyze **_millions of
> daily messages in real–time_**.

## The Problem

<aside class="right">
  10,000 * 10,000 = 100,000,000 messages minimum
</aside>

InCharge Energy is a holistic EV charging solution. From planning and building out EV charging sites, to maintaining chargers, to managing and monitoring them via their own asset management software platform.

## The Solution

Between 2024 and 2026 Richard worked for InCharge Energy as a Senior Backend Engineer. His most impactful project there was building out a data pipeline that facilitated the realtime processing of hundreds of millions of messages a day. This work was foundational to onboarding tens of thousands of EV chargers from one of InCharge Energy’s biggest customers.

## The Details

This data pipeline was responsible for ingesting, storing, segmenting, and providing realtime insights to the status of these EV chargers. Once it went live, chargers could be pointed at the InCharge system having never been onboarded and immediately provide valuable insights for the customer.

On top of that, the system was secure, reliable, and durable. Richard chose an open standard between distributed systems to ensure reliability, security, and structured communication. Durability was added by leveraging message tracking, automatic retries, preventing duplicate messages being recorded more than once, and a self-healing system capable of restarting itself and resuming on failure. The outcome was a secure, reliable, and durable data pipeline with 99.9% uptime.

## The Follow–up

After that was done, InCharge Energy and their customer were so pleased that they had Richard tackle other pet projects around reliability and security.

---

<%= @include.("release-notes/_footer.md", []) %>
