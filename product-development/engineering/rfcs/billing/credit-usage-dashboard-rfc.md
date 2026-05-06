# Credit Usage Dashboard — Engineering RFC

> Stub RFC shipped with the starter kit. Replace with your own.

## Context

PRD: `../../../product/PRDs/billing/credit-usage-dashboard-prd.md`. Need an in-product surface for current credit balance, burn rate, and projected runway, plus admin breakdown for team plans.

## Decision

Aggregate billing events hourly into a `credit_usage_hourly` materialized view. Surface via a new `/api/v2/credits/summary` endpoint. Admin breakdown queries are paginated and use cursor-based scrolling rather than offset.

## Alternatives Considered

1. **Real-time computation on every request.** Rejected: stripe events are lossy under load and recomputing balance per request would 10x the read load on `billing_events`.
2. **Daily batch instead of hourly.** Rejected: a customer who runs through their daily cap in 4 hours is exactly the customer the alerts need to catch.

## Risks

- Snowpipe delay > 30 min would make balance stale; we'll alert on lag > 15 min
- Materialized view cost is ~$X/month; budget approved by [Eng Lead]

## Plan

`../plans/credit-usage-dashboard.md`

## Schema

`../../../analytics/schemas/billing/billing_events.md` and the new `credit_usage_hourly` (DDL in the data-eng RFC at `../../../data-engineering/rfcs/billing/credit-ledger-model-rfc.md`).
