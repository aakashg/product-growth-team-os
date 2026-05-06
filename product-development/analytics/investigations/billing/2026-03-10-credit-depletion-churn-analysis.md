# Credit Depletion Churn Analysis (2026-03-10)

> Stub investigation shipped with the starter kit. Replace with your own.

## Question

Of customers who churned in February, what fraction hit credit exhaustion in the 14 days before cancellation?

## Method

Joined `billing_events` (cancellation events) to `credit_usage_hourly` (running balance < 5% of plan ceiling for ≥ 4 of the prior 14 days = "depletion event").

Query: `analytics/queries/billing/credit_depletion_pre_churn.sql` (to be added).

## Findings

- 47% of February churners had a depletion event in the trailing 14 days
- Of those, 71% had no in-product alert (we don't ship low-balance warnings yet)
- Concentrated in Pro tier (where the ceiling is tightest relative to typical usage)

## Implication

Low-balance warning experiment ([results](../../experiments/billing/low-balance-warning-2026-03-05-experiment-results.md)) is the right intervention. Investigation predates and motivates the experiment.

## Related

- Feature index: `feature-index.yaml#billing.credit-usage-dashboard`
- Decision: `product/decisions/2026-02-14-usage-based-pricing.md`
- Playbook: `analytics/playbooks/churn-spike-investigation.md`
