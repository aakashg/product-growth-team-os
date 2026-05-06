# Credit Ledger Model — Data Engineering RFC

> Stub RFC shipped with the starter kit. Replace with your own.

## Context

The credit usage dashboard ([PRD](../../../product/PRDs/billing/credit-usage-dashboard-prd.md)) needs hourly-fresh credit balance per organization. Today `billing_events` has the raw stream but no rollup.

## Decision

Add a `credit_usage_hourly` materialized view keyed on `(organization_id, hour_truncated)` with columns: `credits_consumed`, `credits_purchased`, `running_balance`, `latest_event_id`. Refresh via Snowpipe-driven incremental update (5-minute target lag).

## Alternatives

1. **Compute balance on the fly from `billing_events`.** Rejected: O(N) scan per request; current event volume already 800K events/day.
2. **Daily snapshot.** Rejected per the PRD — daily granularity is too coarse for the alert use-case.

## Schema

```sql
CREATE MATERIALIZED VIEW credit_usage_hourly AS
SELECT
    organization_id,
    DATE_TRUNC('hour', created_at) AS hour_truncated,
    SUM(CASE WHEN event_type IN ('charge', 'usage') THEN -mrr_delta ELSE 0 END) AS credits_consumed,
    SUM(CASE WHEN event_type = 'credit_purchase' THEN mrr_delta ELSE 0 END) AS credits_purchased,
    -- running_balance computed via window function in downstream queries
    MAX(event_id) AS latest_event_id
FROM billing_events
GROUP BY organization_id, hour_truncated;
```

## Plan

`../../plans/billing/credit-ledger-model.md`

## Risks

- Backfill of historical hourly buckets will hit warehouse credits; schedule weekend backfill window
- Lag > 15 min triggers a PagerDuty alert (see plan)
