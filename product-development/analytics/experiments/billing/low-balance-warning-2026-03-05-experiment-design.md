# Low-Balance Warning Email — Experiment Design (2026-03-05)

> **Pre-registered design** — checked in *before* the experiment launches. Results live in a separate file (`*-experiment-results.md`) appended after the experiment concludes. Pre-registration is the team's way of avoiding "fitting the design to the answer" after the fact.

| | |
|---|---|
| **Status** | Pre-registered, awaiting launch |
| **Owner** | [Analyst Name] |
| **Cross-functional owners** | [PM Name], [Eng Lead] |
| **Linear ticket** | YOURPROJ/200 |
| **Related** | feature-index.yaml#billing.credit-usage-dashboard |

## Hypothesis

Sending a low-balance email at 80% of the plan ceiling reduces involuntary credit-exhaustion churn for Pro and Business tier orgs by ≥ 25% within 30 days of treatment.

## Population

Pro and Business tier organizations that crossed 60% credit usage in the prior 7 days, on or after experiment start. Excluded: orgs with usage spikes from imports, orgs in the prior 14-day low-balance experiment, orgs with active escalations.

**Population size estimate:** ~2,400 orgs over the 30-day enrollment window.

## Allocation

50/50, random by `organization_id` hash. Persistent assignment — once treated, always treated.

## Treatment vs. Control

- **Treatment:** Email at 80% threshold, single send, no SMS. Subject: "Heads up — you're approaching your plan limit." Copy in `step-1-eng-status.md` of the rollout.
- **Control:** No email at 80% threshold. Existing 95% threshold email applies to both arms.

## Metrics

| Class | Metric | Definition / canonical query | Threshold |
|-------|--------|------------------------------|-----------|
| Primary | 30-day involuntary churn | `metrics/billing/billing-metrics.md#churn-rate` filtered to `cancellation_reason = 'payment_failed'` | -25% relative reduction in treatment vs. control, p < 0.05 |
| Secondary | 30-day tier-up rate | `queries/billing/tier_up_conversion.sql` (to be added) | Directional positive |
| Guardrail | Email open rate | Email tool reporting | ≥ 35% — below this means deliverability issue, results are uninterpretable |
| Guardrail | Treatment-arm support tickets | Support tool tagged `low-balance-email` | < 5% lift vs. control |

## Sample Size and Power

| | |
|---|---|
| Baseline involuntary churn (Pro+Business) | 2.1% |
| Minimum detectable effect | 25% relative (1.575% absolute) |
| Alpha | 0.05 (two-sided) |
| Power | 0.80 |
| Required N per arm | ~1,200 |
| Enrollment window | 30 days |

## Stopping Rules

- **Don't peek before 14 days enrolled.** No interim analysis. Sequential testing inflates false-positive rate.
- **Auto-stop if guardrail trips:** if email open rate < 30% in week 1, halt and investigate deliverability.
- **Manual stop:** PM or Analyst can halt at any time with written reason in this doc.

## Decision Criteria

| Outcome | Action |
|---------|--------|
| Primary metric hits ≥ 25% reduction at p < 0.05, guardrails clear | Ship to all Pro and Business orgs |
| Primary metric hits 10-25% reduction at p < 0.05 | Ship + design v2 with stronger intervention (SMS, multi-touch) |
| Primary metric not significant | Don't ship, log learning, design v2 with different mechanism |
| Guardrail trips | Don't ship, fix the guardrail issue first |

## Related

- Investigation that motivated this experiment: `analytics/investigations/billing/2026-03-10-credit-depletion-churn-analysis.md`
- Customer signals: customer-call summaries flagging credit exhaustion (search `customers/accounts/`)
- Decision log: `product/decisions/2026-02-14-usage-based-pricing.md`
- Post-experiment results doc: `low-balance-warning-2026-03-05-experiment-results.md`
