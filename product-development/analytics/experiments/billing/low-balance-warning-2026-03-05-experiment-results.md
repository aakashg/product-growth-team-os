# Low-Balance Warning Email — Experiment Results (2026-03-05)

> Results doc — appended after the experiment concluded. Design was pre-registered in `low-balance-warning-2026-03-05-experiment-design.md`. Reading the design first is highly recommended.

| | |
|---|---|
| **Status** | Concluded — shipping decision: Ship to all Pro and Business orgs |
| **Run dates** | 2026-03-05 → 2026-04-04 (30 days) |
| **Owner** | [Analyst Name] |
| **Pre-registered design** | [low-balance-warning-2026-03-05-experiment-design.md](low-balance-warning-2026-03-05-experiment-design.md) |

## Results

| Metric | Treatment | Control | Lift | p-value | Guardrail |
|--------|-----------|---------|------|---------|-----------|
| Involuntary churn (30d, primary) | 1.4% | 2.1% | -33% | 0.012 | — |
| Tier-up conversions (secondary) | 4.8% | 4.1% | +17% | 0.08 | — |
| Email open-rate (guardrail) | 41% | — | — | — | ≥ 35% ✅ |
| Support tickets (guardrail) | +1.2% | baseline | +1.2% | 0.34 | < 5% lift ✅ |

Primary metric significant at p < 0.05 and exceeds the pre-registered 25% threshold. Secondary metric directionally positive but underpowered. Both guardrails passed.

## Sample

| | Treatment | Control |
|---|---|---|
| Enrolled orgs | 1,247 | 1,231 |
| Days enrolled (median) | 30 | 30 |

## Pre-Registered Decision Outcome

Per the design's Decision Criteria table — primary metric ≥ 25% reduction, p < 0.05, guardrails clear → **Ship to all Pro and Business orgs**.

Implementation tracked in `engineering/plans/billing/credit-usage-dashboard.md` workstream "Email alerts at 80% / 95%".

## Follow-up Experiments

- **95% threshold escalation email** — pre-register design in a new file when ready
- **SMS for highest-tier orgs** — would test stronger intervention; pre-register if scoped
- **Personalization on consumption pattern** — would tailor copy to "you'll hit cap in N days at current rate"

## Related

- Investigation: `analytics/investigations/billing/2026-03-10-credit-depletion-churn-analysis.md`
- Feature index: `feature-index.yaml#billing.credit-usage-dashboard`
- Dashboards: `analytics/dashboards/billing/credit-usage-dashboards.md`
