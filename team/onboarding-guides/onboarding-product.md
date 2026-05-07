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

## First 90 Days (Junior PM Track)

If this is your first PM role, the Day 1-5 reading list extends into a 90-day arc. Each week's milestone builds on the previous.

| Window | Milestone |
|--------|-----------|
| Week 1 | Day 1-5 reading list completed; one tiny PR landed (typo fix or one bracket filled in) |
| Week 2 | Shadow your first customer call. Run `/customer-call --quick` on it. Read 3 most recent decisions deeply (read the Reasoning twice). |
| Week 3 | Lead a customer call (with someone watching). Log a decision after a meeting you sat in on. |
| Week 4-6 | Draft your first PRD on a small feature. Use [credit-usage-dashboard-prd.md](../../product-development/product/PRDs/billing/credit-usage-dashboard-prd.md) as the model. Get reviewed by your manager + eng lead. |
| Week 7-8 | Shadow a feature launch end-to-end (PRD → RFC → ship → launch email → metrics). Run `/feature-launch-gate` on it before ship. |
| Week 9-12 | Own a small feature launch start to finish. PRD, decisions, launch coordination, metrics check, retro. |

Confidence builders along the way:

- Your first decision log entry: write it, get feedback, iterate. Two minutes of writing saved your team 25 minutes the next time someone asks. That's the unit of value you produce.
- Your first PRD: it will be too thin or too thick. That's normal. The first 5 PRDs are calibration; by PRD #10 it's muscle memory.
- Your first launch: something will go wrong. The launch-gate catches most things; postmortems catch the rest. The repo doesn't punish first-time mistakes — it captures them so the next person doesn't repeat them.

## What "Good" Looks Like for Each Artifact

When in doubt, study these examples — they're shipped with the starter as teaching artifacts:

- **PRD:** [`PRDs/billing/credit-usage-dashboard-prd.md`](../../product-development/product/PRDs/billing/credit-usage-dashboard-prd.md) — has Hypothesis, Problem, Strategic Fit, Solution, Metrics, Non-goals, with cross-references that resolve
- **Decision log (full):** [`decisions/2026-02-14-usage-based-pricing.md`](../../product-development/product/decisions/2026-02-14-usage-based-pricing.md) — three options compared, reasoning explicit, tradeoff named, revisit conditions specific
- **Customer call summary (Quick):** [`accounts/example-customer/calls/summaries/2026-04-22.md`](../../product-development/product/customers/accounts/example-customer/calls/summaries/2026-04-22.md) — three sections, role-attributed quotes, action items with named owners
- **Engineering plan:** [`engineering/plans/billing/credit-usage-dashboard.md`](../../product-development/engineering/plans/billing/credit-usage-dashboard.md) — workstreams, sequencing, risks
- **Bug investigation:** [`engineering/bug-investigations/billing/bug-03-12-2026-credit-double-charge/investigation-plan.md`](../../product-development/engineering/bug-investigations/billing/bug-03-12-2026-credit-double-charge/investigation-plan.md) — symptoms, timestamped steps, root cause, fix, prevention

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
