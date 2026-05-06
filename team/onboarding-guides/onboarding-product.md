# Onboarding: Product

Setup and orientation specific to product managers.

> Read [onboarding-general.md](onboarding-general.md) **first** — it has the Day 1-5 reading list and the warning about repos that are still mostly placeholders. This guide layers PM-specifics on top.

## Setup

### Shared Tools

See [General Onboarding](onboarding-general.md#setup).

### PM-Specific Tools

| Tool | Purpose | Access |
|------|---------|--------|
| Amplitude / Mixpanel / Heap | Product analytics | Request from analytics lead |
| Figma | Design files (edit access) | Request from design lead |
| Granola / Otter / Fireflies | AI meeting notes | Team license — request from manager |
| Stripe (read-only) | Billing and subscription data | Request from finance |

## Key Documents

- [Product CLAUDE.md](../../product-development/product/CLAUDE.md) — product context, pillars, segments
- [PRDs](../../product-development/product/PRDs/) — current and shipped PRDs by area
- [Customer Insights](../../product-development/product/customers/CLAUDE.md) — call summaries, account context, feature requests
- [Competitive Research](../../product-development/product/competitive-research/CLAUDE.md) — competitor intel
- [Strategy](../../product-development/product/strategy/) — roadmaps, vision, business context
- [Decisions Log](../../product-development/product/decisions/CLAUDE.md) — every team decision with reasoning
- [Feature Index](../../product-development/feature-index.yaml) — every feature mapped to its artifacts

## Skills You'll Use Daily

- `/customer-call` — process a customer call into a summary, transcript, follow-up email, Slack draft
- `/decision-log-entry` — log a decision with reasoning and tradeoffs
- `/feature-launch-gate` — verify the repo is updated before a feature ships
- `/weekly-synthesis` — get a digest of repo changes for your team's Friday update

## First Tasks

- [ ] Read the three most recent PRDs to understand current product direction
- [ ] Skim the last 5 customer call summaries
- [ ] Read the current quarter's roadmap (`product/strategy/roadmaps/`)
- [ ] Review the competitive matrix (`product/competitive-research/competitors/`)
- [ ] Shadow a customer call this week
- [ ] Run `/customer-call` for the first call you own
- [ ] Pick up a small task from the current sprint

## Where Your Work Lives

| Artifact | Location |
|----------|----------|
| PRDs | `product/PRDs/{area}/{slug}-prd.md` |
| Decisions | `product/decisions/{YYYY-MM-DD}-{topic}.md` |
| Customer calls | `product/customers/accounts/{customer}/calls/summaries/{date}.md` |
| Strategy / roadmaps | `product/strategy/roadmaps/` |
| Launch emails | `product/launch-emails/` |
| Sales enablement | `product/sales-enablement/` |

## People to Meet

Check the team roster in the [root CLAUDE.md](../../CLAUDE.md). Specifically: your eng lead, your designer, your analytics partner, and any peer PMs in adjacent areas.
