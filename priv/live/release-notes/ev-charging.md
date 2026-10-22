---
layout: _layout.md
pageClass: release-note
pageId: ev-charging
---

# <small>Release Notes:</small><br>Cumberland Farms/SmartPay

> We helped a business with millions of messages a day distributed over tens of
> thousands of IoT devices build a data pipeline that ingested, stored, and
> analyzed every single message in real-time.

Our client had tens of thousands of EV chargers that would send upwards of tens
of thousands of messages a day each. For those not keeping track, 10,000 *
10,000 = 100,000,000 messages minimum, AKA an overwhelming amount of messages.
They wanted to migrate these EV chargers to an existing management platform as a
new system of record. They also wanted real-time status updates available for
each EV charger, of course, why not? We worked with them to understand their
internal infrastructure and business limitations to architect a data pipeline
that worked within their existing infrastructure ecosystem. It was too
labor-intensive for their employees to onboard each charger. Can you imagine a
single person manually adding +20,000 EV chargers via a form? We could, thought
it was hilarious, but took pity on the poor soul so we built in automatic EV
charger registration, no human interaction needed. Our client had their own
customers using these chargers, and due to the significance of their business
operations, this system had to be secure, reliable, and durable. We chose an
established open standard between distributed systems to ensure reliability,
security, and structured communication. Durability was added by leveraging
message tracking, automatic retries, preventing duplicate messages being
recorded more than once, and a self-healing system capable of restarting itself
and resuming on failure. The outcome was a secure, reliable, and durable data
pipeline with 99.9% uptime.

---

<%= Markdown.include("release-notes/_footer.md") %>
