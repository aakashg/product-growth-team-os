# Onboarding: Customer Success

Setup and orientation specific to CSMs and CS leaders.

> Read [onboarding-general.md](onboarding-general.md) **first** — Day 1-5 reading list and warning about under-populated repos. This guide layers CS-specifics on top.

## Setup

See [General Onboarding](onboarding-general.md#setup) for shared tools.

### CS-Specific Tools

| Tool | Purpose | Access |
|------|---------|--------|
| Customer Health Platform (Gainsight / ChurnZero / Catalyst) | Health scoring, expansion signals, renewal forecasting | Workspace invite |
| Gong / Chorus | Call recording + AI insights | Team license |
| Loom | Async customer walkthroughs | Free or team license |
| Product analytics | Adoption metrics per account | Read access |

## Key Documents

- [Customer Insights](../../product-development/product/customers/CLAUDE.md) — call summaries, account-context, accounts portfolio
- [Portfolio rollup](../../product-development/product/customers/accounts/portfolio.yaml) — every named account in one place
- [QBR Prep workflow](../../product-development/product/workflows/qbr-prep/CLAUDE.md)
- [Renewal Review workflow](../../product-development/product/workflows/renewal-review/CLAUDE.md) — your weekly Monday-morning ritual
- [Customer Escalation workflow](../../product-development/product/workflows/customer-escalation/CLAUDE.md) — when an account goes sideways
- [Win-Loss](../../product-development/product/customers/win-loss/CLAUDE.md) — track churns; learn the pattern

## Skills You'll Use

- `/customer-call` — summary every call, role-attributed PII-safe
- `/portfolio-pulse --mode=daily` — your morning view of the book
- Renewal Review workflow weekly
- QBR Prep workflow per QBR cycle
- Customer Escalation workflow when needed

## First Tasks

- [ ] Read `customers/CLAUDE.md` and `accounts/portfolio.yaml` end-to-end
- [ ] Read 5 example call summaries to learn the format
- [ ] Pick 3 accounts assigned to you; read their `account-context.md` and last 3 calls each
- [ ] Run the Renewal Review workflow on Monday — walk through with your manager
- [ ] Run a QBR Prep workflow for one upcoming QBR — also walk through with manager
- [ ] Run a discovery shadow with a teammate

## Where Your Work Lives

| Artifact | Location |
|----------|----------|
| Call summaries | `customers/accounts/{slug}/calls/summaries/{date}.md` |
| Account context updates | `customers/accounts/{slug}/account-context.md` (Open Loops, Risks, Strategic Notes) |
| Portfolio status changes | `customers/accounts/portfolio.yaml` (status, health_score, expansion_signal, risks) |
| QBR drafts | `workflows/qbr-prep/output/{customer}-qbr-{YYYY-Q}.md` |
| Escalation records | `customers/accounts/{slug}/escalations/{date}-{topic}.md` |
| Win-loss for churns | `customers/win-loss/{date}-churn-{customer}.md` |

## CS Cadence

| Cadence | What |
|---------|------|
| Daily | `/portfolio-pulse --mode=daily` for your accounts; respond to inbound |
| Weekly Monday | Renewal Review workflow |
| Per call | `/customer-call` summary + update account-context.md as needed |
| Per escalation | Customer Escalation workflow |
| Per QBR | QBR Prep workflow ~2 weeks before |
| Per churn | Win-Loss entry within 48h |
| Quarterly | Portfolio review with manager — what patterns are repeating |

## How CS Surfaces to PM

When 3+ accounts ask for the same feature: file in `feature-index.yaml` as a customer-driven pri. The bi-weekly synthesis surfaces these to the PM automatically.

When an account churns: the win-loss entry feeds the PM's "what we lose to" pattern detection. Don't write churn entries gently — be honest about the cause.

When a champion changes: update `account-context.md` AND `portfolio.yaml#champion`. The CSM owns champion intel.

## The Single Most Important Habit

Update `portfolio.yaml#{account}.status` whenever it changes. The whole CS-team rollup depends on this single field being accurate. Stale `status` is worse than no status at all because it produces false confidence.
