# Onboarding: Engineering

Setup and orientation specific to engineers.

## Setup

See [General Onboarding](onboarding-general.md#setup) for shared tools.

### Engineering-Specific Tools

| Tool | Purpose | Access |
|------|---------|--------|
| Code-host CLI (gh, glab, etc.) | Manage PRs from terminal | Install per docs |
| Production observability (Datadog / New Relic / Grafana) | Logs and metrics | Request from manager |
| Sentry / equivalent | Error tracking | Request from manager |
| On-call rotation tool (PagerDuty / Opsgenie) | Pages | Onboarded after week 2 |

## Key Documents

- [Engineering CLAUDE.md](../../product-development/engineering/CLAUDE.md) — plans, RFCs, bug investigations by product area
- [Feature Index](../../product-development/feature-index.yaml) — every feature mapped to its PRD, RFC, plan, schema, dashboard
- [Data Catalog](../../product-development/analytics/data-catalog.yaml) — warehouse tables you'll query
- [Decisions Log](../../product-development/product/decisions/CLAUDE.md) — non-architectural decisions
- [Bug Investigation Template](../../product-development/engineering/bug-investigations/) — every investigation goes in `bug-investigations/{area}/bug-{date}-{slug}/investigation-plan.md`

## Skills You'll Use

- `/feature-launch-gate` — verify the repo is updated before your feature ships (analytics, RFC, schema)
- `/decision-log-entry` — for non-architectural decisions; for architectural decisions, write an RFC instead
- `/freshness-check` — find stale docs in your area

## First Tasks

- [ ] Get local dev environment running per `CONTRIBUTING.md` in the main app repo
- [ ] Read the most recent RFC in your area (`engineering/rfcs/{area}/`)
- [ ] Read the most recent bug investigation to learn the team's investigation style
- [ ] Ship a small starter task assigned by your manager
- [ ] Get on-call shadow rotation scheduled

## Where Your Work Lives

| Artifact | Location |
|----------|----------|
| Engineering plans | `engineering/plans/{area}/{feature}.md` |
| RFCs | `engineering/rfcs/{area}/{slug}-rfc.md` |
| Bug investigations | `engineering/bug-investigations/{area}/bug-{MM-DD-YYYY}-{slug}/investigation-plan.md` |
| Architectural decisions | RFC, not the decisions log |

## On-Call Notes

When you get paged at 2 AM, the analytics folder is your friend:

- `analytics/queries/{area}/` — pre-written SQL for common questions
- `analytics/playbooks/` — investigation methodologies (e.g., churn-spike-investigation.md)
- `analytics/schemas/{area}/` — column-level schema for the tables you'll query
- `analytics/data-catalog.yaml` — quick reference for which table has what

If you're paged on something not covered, file a `bug-investigation` directory after — even a rough one prevents the next person from starting from scratch.
