# Analytics

Organized by product area. Each area has three file types:

- **metrics.md** — Definitions only. Read this FIRST for any metrics question. Low token cost.
- **queries/** — Verified SQL queries. Read when someone needs the actual query. Medium token cost.
- **schemas/** — Table structures and data dictionaries. Read only when full context needed. Higher token cost.
- **playbooks/** — Verified investigation methodologies. Read when investigating an anomaly.

## Product Areas

- billing/ — Revenue metrics, churn, MRR, tier distribution
- onboarding/ — Activation, time-to-value, funnel conversion

## Dashboards

- [Billing Dashboard](https://your-analytics-tool.com/billing) — Real-time revenue and churn
- [Onboarding Dashboard](https://your-analytics-tool.com/onboarding) — Activation funnel and cohort analysis

## Rules

1. Always read metrics.md before loading queries or schemas
2. Never point Claude at the raw database without loading the relevant playbook first
3. The analyst on the team owns this folder. All queries must be verified by them before merging.
