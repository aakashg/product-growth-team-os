# Credit Usage Dashboard — PRD

> Worked PRD shipped with the starter kit. Use it as a teaching artifact: study what each section covers, why this length is right, and how cross-references make a PRD durable. Replace with your own once you write a real one.

| | |
|---|---|
| **Author** | [PM Name from team roster] |
| **Status** | Approved — in dev |
| **Target ship** | 2026-05-02 |
| **Reviewers** | [Eng Lead], [Designer], [Analyst], [CS Lead] |
| **Linear / Jira / Asana** | YOURPROJ/123 |

## TL;DR

Customers on credit-based pricing churn when they hit limits without warning. We're shipping an in-product credit usage surface plus proactive low-balance alerts. Targeting -30% involuntary churn from credit exhaustion, +15% upgrade conversions, no degradation to page-load performance.

## Hypothesis

If we surface credit balance, monthly burn rate, and projected runway in the product UI, plus send proactive alerts at 80% and 95% of plan ceiling, **involuntary churn from credit exhaustion will drop ≥ 30% within 60 days of GA**.

> *Coach note: a hypothesis is testable, has a magnitude, and has a window. "Reduce churn" is not a hypothesis. "Reduce involuntary credit-exhaustion churn by 30% in 60 days" is.*

## Problem

Across our top 10 paying accounts, 4 of last month's 7 churns were preceded by a "ran out of credits mid-workflow" complaint in support tickets. Pulled from the [investigation](../../analytics/investigations/billing/2026-03-10-credit-depletion-churn-analysis.md): 47% of February churners had a credit-depletion event in the trailing 14 days, of which 71% had received no in-product alert (we don't ship them yet).

The data is consistent with what CSMs hear in renewal calls: customers don't mind paying — they mind not knowing what they'll be billed.

> *Coach note: Problems with data beat problems with anecdotes. If you don't have data yet, link the customer call summaries that surface the pattern. Both are better than "users are frustrated."*

## Strategic Fit

Pricing v2 (decision: [`2026-02-14-usage-based-pricing.md`](../../decisions/2026-02-14-usage-based-pricing.md)) introduces tiered usage with explicit ceilings. Without a usage dashboard, customers can't reason about which tier fits — they bottom out at the wrong tier or churn. The dashboard is the missing surface that makes Pricing v2 trust-able.

This is also a near-zero-cost feature relative to the alternatives we considered for the activation OKR (full onboarding redesign, in-product help system) — see Alternatives below.

> *Coach note: Strategic fit answers "why this, why now, vs. what else." If you can't articulate what else the team would build with the same engineering time, you haven't earned the prioritization yet.*

## Solution

Three components, ranked by ship priority:

### 1. Top-bar credit summary (P0)

A persistent UI element on every project view showing:
- Current balance (credits remaining this billing period)
- Burn rate (credits used this period vs. days remaining)
- Projected runway (days until plan ceiling at current burn)

Updates hourly via the new `credit_usage_hourly` materialized view (see [data-eng RFC](../../../data-engineering/rfcs/billing/credit-ledger-model-rfc.md)).

### 2. Email alerts (P0)

- 80% threshold: heads-up email, no urgency
- 95% threshold: action-required email with one-click upgrade

Subject lines and copy are pre-tested in the [low-balance experiment](../../analytics/experiments/billing/low-balance-warning-2026-03-05-experiment-design.md) — 80% threshold confirmed at p < 0.05 to reduce churn 33%.

### 3. Admin breakdown (P1, ships 2026-05-09)

Team plan admins get a per-user usage table — who's burning the most, who's idle, where to allocate seats more efficiently.

### What we're NOT building (this version)

- Real-time updates (hourly is enough; real-time is a v2)
- Per-project credit attribution (the most-asked v2 feature; tracked separately)
- Soft-cap auto-extension (different problem, different decision)
- SMS alerts (deliverability concerns; revisit if email open rate drops)

## User Stories

| As a... | I want to... | So that... |
|---------|-------------|------------|
| Solo Pro user | See my balance without leaving the project | I don't context-switch to the billing portal mid-flow |
| Team admin | See my team's usage in one view | I can re-balance seats before mid-month panic |
| Finance contact at an enterprise account | Get a 95%-threshold alert | I can either approve the upgrade or pause work, not get a surprise charge |
| New trial user | Understand pricing implications before I commit | I don't churn after the first invoice |

## Edge Cases

- **Trial users** on free tier: dashboard shows trial credits + days remaining; no upgrade prompts (different funnel, different experiment)
- **Annual contracts** with custom credit pools: dashboard reflects custom pool, not standard ceilings
- **Plan changes mid-period**: balance recalculated; alert thresholds re-evaluated against new ceiling
- **Credit purchases (top-ups)**: balance increases, projected runway extends; do NOT clear the alert flag for 24 hours (anti-flicker)
- **Failed payment grace period**: dashboard shows yellow banner, balance frozen
- **Multi-org users**: balance shown is for the active org context; org switcher in the top bar

## Success Metrics

| Metric | Definition (canonical query) | Baseline | Target |
|--------|------------------------------|----------|--------|
| Involuntary churn (30d post-GA) | [`metrics/billing/billing-metrics.md#churn-rate`](../../analytics/metrics/billing/billing-metrics.md) filtered to `cancellation_reason = 'payment_failed'` | 2.1% | -30% relative (≤ 1.5% absolute) |
| Tier-up conversions (30d) | [`queries/billing/tier_up_conversion.sql`](../../analytics/queries/billing/) | 4.1% | +15% relative |
| Dashboard adoption (% paying users seeing it weekly) | New metric, tracked via product analytics | 0% | ≥ 80% in 60 days |

### Guardrails

| Metric | Threshold |
|--------|-----------|
| Page load P95 | < 1.5s |
| Admin dashboard query latency | < 2s |
| Email open rate | ≥ 35% (else deliverability is broken) |
| Support tickets related to dashboard | < 5% lift over baseline (else UX is confusing) |

## Alternatives Considered

| Option | Why we didn't pick it |
|--------|----------------------|
| Full onboarding redesign | Larger scope, doesn't address the credit-exhaustion churn pattern directly |
| In-app upgrade prompts only (no dashboard) | Treats the symptom, not the cause — customers want visibility, not pressure |
| Soft-cap with auto-extension | Different decision — see [`decisions/`](../../decisions/) (TBD if we revisit) |
| Just send emails, no in-product surface | Trial customers especially won't open emails — needs in-product surface |

## Open Questions

- Should the 95% threshold email auto-pause workflows or just notify? (Eng + CS aligned: notify only for v1.)
- Should we A/B the projected-runway display (number of days vs. percentage)? (Analyst recommends days; ship A only.)
- Multi-currency: do we localize the dashboard? (Defer to v2; English/USD only for now.)

## Rollout Plan

- 2026-04-15: feature flag enabled for internal team
- 2026-04-22: 5% production rollout
- 2026-04-29: 50% rollout if metrics clean
- 2026-05-02: 100% GA + launch email

## Related

- RFC: [`engineering/rfcs/billing/credit-usage-dashboard-rfc.md`](../../../engineering/rfcs/billing/credit-usage-dashboard-rfc.md)
- Plan: [`engineering/plans/billing/credit-usage-dashboard.md`](../../../engineering/plans/billing/credit-usage-dashboard.md)
- Pipeline RFC: [`data-engineering/rfcs/billing/credit-ledger-model-rfc.md`](../../../data-engineering/rfcs/billing/credit-ledger-model-rfc.md)
- Pricing decision: [`decisions/2026-02-14-usage-based-pricing.md`](../../decisions/2026-02-14-usage-based-pricing.md)
- Investigation that motivated this: [`analytics/investigations/billing/2026-03-10-credit-depletion-churn-analysis.md`](../../../analytics/investigations/billing/2026-03-10-credit-depletion-churn-analysis.md)
- Pre-registered experiment: [`analytics/experiments/billing/low-balance-warning-2026-03-05-experiment-design.md`](../../../analytics/experiments/billing/low-balance-warning-2026-03-05-experiment-design.md)
- UX audit (related surface): [`design/audits/example-2026-04-15-pricing-page-audit.md`](../../../design/audits/example-2026-04-15-pricing-page-audit.md)
- Feature index: [`feature-index.yaml#billing.credit-usage-dashboard`](../../../feature-index.yaml)

## Sign-off

| Role | Reviewer | Status |
|------|----------|--------|
| PM | [Author] | ✅ |
| Engineering | [Eng Lead] | ✅ |
| Design | [Designer] | ✅ |
| Analytics | [Analyst] | ✅ |
| CS | [CS Lead] | ✅ |
