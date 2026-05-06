# Credit Usage Dashboard — PRD

> Stub PRD shipped with the starter kit so the worked example in `feature-index.yaml` resolves to a complete artifact set. Replace with your own.

## Hypothesis

Customers churn from credit-based plans because they hit limits without warning. A surfaced usage dashboard with proactive low-balance alerts will reduce monthly involuntary churn by 30%.

## Problem

Across our top 10 paying accounts, 4 of last month's 7 churns were preceded by a "ran out of credits mid-workflow" complaint. Today there's no in-product surface for credit balance, burn rate, or runway.

## Strategic Fit

Pricing v2 (decision: `decisions/2026-02-14-usage-based-pricing.md`) introduces tiered usage. Without a usage dashboard, customers can't reason about which tier fits — bottoms out at the wrong tier or churns altogether.

## Solution

1. New top-bar surface: current balance, this month's burn, projected runway
2. Email alert at 80% and 95% of plan ceiling
3. Admin dashboard view: per-user breakdown for team plans

## Success Metrics

- **Primary:** Involuntary churn from credit exhaustion ↓ 30% within 60 days of GA
- **Secondary:** Tier-up conversions from pro → business ↑ 15% (people upgrade rather than churn)
- **Guardrail:** P95 page load < 1.5s; admin dashboard query < 2s

## Non-Goals

- Real-time usage (we ship hourly aggregation; real-time is v2)
- Cost-allocation to specific projects (separate feature)

## Related

- RFC: `engineering/rfcs/billing/credit-usage-dashboard-rfc.md`
- Plan: `engineering/plans/billing/credit-usage-dashboard.md`
- Pipeline RFC: `data-engineering/rfcs/billing/credit-ledger-model-rfc.md`
- Metrics: `analytics/metrics/billing/billing-metrics.md`
- Data: `analytics/data-catalog.yaml#billing_events`
- Decision: `product/decisions/2026-02-14-usage-based-pricing.md`
- Feature index: `feature-index.yaml#billing.credit-usage-dashboard`
