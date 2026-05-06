# Credit Usage Dashboards

Dashboard docs for the credit usage feature.

| Dashboard | Tool | URL | Owner |
|-----------|------|-----|-------|
| Credit Usage — Customer Self-Serve | Sigma | https://sigma.example.com/credit-usage-customer | [Analyst] |
| Credit Usage — Internal Health | Sigma | https://sigma.example.com/credit-usage-internal | [Analyst] |
| Low-Balance Alert Funnel | Mode | https://mode.example.com/low-balance-funnel | [Analyst] |

## Underlying Tables

- `billing_events` — see `data-catalog.yaml#billing_events`
- `credit_usage_hourly` (materialized view) — see `data-engineering/rfcs/billing/credit-ledger-model-rfc.md`

## Common Filters

- By plan tier (basic / pro / enterprise)
- By segment (smb / mid-market / enterprise)
- Time window (default 30 days, exposed selector for 7 / 30 / 90)

## When to Update

- New plan tier launched → add tier filter values
- Pipeline lag SLO changed → update the "data freshness" annotation
- Quarterly review of dashboards still in use; archive any that haven't been viewed in 90 days
