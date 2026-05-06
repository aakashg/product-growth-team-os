# Chose Tiered Pricing Over Per-Seat and Credit Pools

**Date:** 2026-02-14
**Decided by:** [PM Name], [Eng Lead], [Head of Product]
**Status:** Active

## Options Considered

1. **Per-seat pricing ($15/user/month)** — Simple to implement. Predictable revenue. But our P90 user costs 22x what our P50 user costs in compute. Per-seat subsidizes heavy users with light user revenue. That gap grows as AI features improve.

2. **Credit pools ($20/month base + credits)** — Aligns cost to value. Power users pay more. But multiple companies have seen user backlash when switching from flat rates to variable pricing without sufficient transparency.

3. **Tiered with usage guardrails ($15 / $40 / $100)** — Three tiers mapped to genuinely different user behaviors (casual, power user, developer). Each tier has published limits. Overage pricing at the top tier only.

## Decision

Option 3: Tiered with usage guardrails.

## Reasoning

The P90/P50 cost ratio is 22x. Flat pricing is unsustainable at that ratio — we'd lose money on our best users. Tiers map to real user personas rather than arbitrary volume bands. Publishing exact limits avoids the trust problems that variable pricing creates.

## Tradeoff Accepted

More complex billing UX. Three tiers means three sets of feature gates, three upgrade paths, three sets of documentation. Mitigated with an in-app usage dashboard showing consumption vs. tier limit.

## Revisit Conditions

Revisit if: churn on any tier exceeds 5% for two consecutive months, or if compute costs drop more than 50% (making flat pricing viable again).

## Related

- `../PRDs/billing/credit-usage-dashboard-prd.md` (downstream — usage-based pricing motivated the credit dashboard)
- `../../analytics/metrics/billing/billing-metrics.md`
- `../../analytics/queries/billing/churn_by_segment.sql`
- `../../feature-index.yaml#billing.credit-usage-dashboard`
