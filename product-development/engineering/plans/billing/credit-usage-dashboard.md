# Credit Usage Dashboard — Engineering Plan

> Stub plan shipped with the starter kit. Replace with your own.

Implementation plan for the credit usage dashboard described in the [PRD](../../../product/PRDs/billing/credit-usage-dashboard-prd.md) and [RFC](../../rfcs/billing/credit-usage-dashboard-rfc.md).

## Workstreams

| Workstream | Owner | Status | Tickets |
|------------|-------|--------|---------|
| Materialized view + Snowpipe lag alerting | Data Eng | In dev | YOURPROJ/123 |
| `/api/v2/credits/summary` endpoint | Backend | Scoped | YOURPROJ/124 |
| Top-bar surface + admin dashboard | Frontend | Scoped | YOURPROJ/125 |
| Email alerts at 80% / 95% | Notifications | Scoped | YOURPROJ/126 |

## Sequencing

1. Data eng ships the materialized view + lag alerting
2. Backend ships the API once the view is reliable
3. Frontend + notifications ship in parallel against the API
4. Admin dashboard view ships last (depends on cursor pagination work)

## Risks

- Snowpipe lag — see RFC mitigation
- Tier ceiling values are hardcoded today; pricing v2 should make them dynamic — coordinate with the pricing v2 workstream
