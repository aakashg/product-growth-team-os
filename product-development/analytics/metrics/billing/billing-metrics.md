# Billing Metrics

Each metric below has a precise definition (event-level), a canonical SQL implementation, an owner, and an alert threshold. If you add a new billing metric, follow this shape so cross-team queries stay reproducible.

## MRR (Monthly Recurring Revenue)

**Definition:** Sum of `mrr_delta` from `billing_events` where `event_type IN ('subscription_created', 'upgrade', 'downgrade', 'renewal', 'cancellation')`, partitioned by month, summed cumulatively from the start of records.

**Numerator:** `SUM(mrr_delta)` across qualifying event types
**Denominator:** none — MRR is an absolute value
**Window:** as-of end of month (or any chosen point-in-time)
**Currency:** USD; for multi-currency see currency-conversion section in `playbooks/`
**Excludes:** one-time charges (`event_type = 'charge'`), refunds (`event_type = 'refund'`)

**Owner:** [Analyst Name]
**Dashboard:** [Link]
**Canonical query:** `../../queries/billing/mrr_trend.sql`
**Alert threshold:** < $[X] or > 15% MoM decline

## Churn Rate (Monthly)

**Definition:** Percentage of customers who were active at start of month and had a `cancellation` event during the month.

**Numerator:** `COUNT(DISTINCT customer_id)` from `billing_events` where `event_type = 'cancellation'` AND `cancellation_reason = 'voluntary'` AND `created_at` is within the calendar month
**Denominator:** `COUNT(DISTINCT customer_id)` from `subscriptions` where `start_date <= month_start` AND (`end_date IS NULL` OR `end_date > month_start`) AND `status = 'active'`
**Window:** calendar month, segmented by `segment` and `tier`
**Variants:** combined churn includes `cancellation_reason = 'payment_failed'`; see canonical query for the toggle

**Owner:** [Analyst Name]
**Canonical query:** `../../queries/billing/churn_by_segment.sql`
**Good:** < 3% | **Concerning:** 3-5% | **Critical:** > 5%

## Net Revenue Retention (NRR)

**Definition:** Revenue from a fixed customer cohort N months later, divided by their starting revenue.

**Numerator:** `SUM(mrr_delta)` for the cohort across all event types in the trailing 12 months
**Denominator:** Cohort's MRR at month 0
**Window:** 12-month trailing, by month 0 cohort
**Excludes:** customers added after the cohort start date

**Owner:** [Analyst Name]
**Canonical query:** `../../queries/billing/nrr_cohort.sql`
**Good:** > 110% | **Great:** > 130%

## ARPU (Average Revenue Per User)

**Definition:** Sum of MRR divided by count of paying customers as-of the same point in time.

**Numerator:** Total MRR (see MRR definition above)
**Denominator:** `COUNT(DISTINCT customer_id)` from `subscriptions` where `status = 'active'` AND `tier != 'free'`
**Window:** point-in-time (typically end of month)
**Segmented by:** `tier` (basic / pro / enterprise)

**Owner:** [Analyst Name]

## Tier Distribution

**Definition:** Percentage of paying customers on each pricing tier as-of a point in time.

**Numerator (per tier):** `COUNT(DISTINCT customer_id) WHERE tier = '{tier}' AND status = 'active'`
**Denominator:** `COUNT(DISTINCT customer_id) WHERE status = 'active' AND tier != 'free'`
**Window:** point-in-time

**Owner:** [Analyst Name]
**Current baseline:** Basic [X]% / Pro [X]% / Enterprise [X]%

---

## Related Queries

- `../../queries/billing/churn_by_segment.sql` — Churn broken down by customer segment + tier
- `../../queries/billing/mrr_trend.sql` — MRR over time with expansion/contraction breakdown
- `../../queries/billing/nrr_cohort.sql` — NRR by monthly cohort

## Related Schemas

- `../../schemas/billing/billing_events.md` — billing_events table
- `../../schemas/billing/subscriptions.md` — subscriptions table
- `../../schemas/billing/organizations.md` — organizations table

## Related in feature-index.yaml

These metrics power the **billing** product area. See `feature-index.yaml` for which features depend on each metric.

## Conventions for Adding a Metric

Every entry in this file must include:
1. **Definition** — one sentence, concrete enough that two analysts produce identical SQL
2. **Numerator** — explicit table + column-level filter
3. **Denominator** — explicit, including the as-of window
4. **Window** — calendar month? rolling 30d? point-in-time?
5. **Owner**
6. **Canonical query** — relative path to a runnable SQL file
7. **Alert threshold** (where applicable)

If you can't articulate numerator and denominator at column-level precision, the metric isn't defined yet — it's an aspiration.
