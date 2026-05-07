# Tier-Discount-Promo Metrics

Metrics for the tier-discount-promo feature: a time-bound discount offered to users on a lower tier to incentivize upgrade. Each metric below has a precise definition (event-level), a canonical SQL implementation, an owner, and an alert threshold. Same shape as `billing-metrics.md`.

## Promo Conversion Rate

**Definition:** Of users who were *shown* a tier-discount-promo offer in a given window, the percentage who *redeemed* the offer (upgraded with the promo applied) within the offer's validity window.

**Numerator:** `COUNT(DISTINCT customer_id)` from `promo_offers` where `event_type = 'redeemed'` AND `redeemed_at <= offer_expires_at` AND `offer_shown_at` is within the reporting window
**Denominator:** `COUNT(DISTINCT customer_id)` from `promo_offers` where `event_type = 'shown'` AND `offer_shown_at` is within the reporting window
**Window:** calendar week, segmented by `from_tier`, `to_tier`, `discount_pct`
**Excludes:** offers shown to customers whose subscription was cancelled before the offer expired (not given a fair chance to convert) — filter `cancelled_before_expiry = FALSE`
**Joins:** `subscriptions` for `segment` breakdown when needed

**Owner:** [Analyst Name]
**Dashboard:** [Link]
**Canonical query:** `../../queries/billing/promo_conversion_rate.sql`
**Good:** > 8% | **Concerning:** 4-8% | **Critical:** < 4%
**Alert threshold:** weekly conversion rate < 4% for two consecutive weeks

## Promo-Attributed MRR Lift

**Definition:** Incremental MRR from upgrades attributed to a tier-discount-promo, net of the discount itself, in the first full billing cycle after redemption.

**Numerator:** `SUM(mrr_delta)` from `billing_events` where `event_type = 'upgrade'` AND `promo_id IS NOT NULL` AND `created_at` within the reporting window, minus `SUM(discount_amount)` from `promo_offers` for the same redemptions
**Denominator:** none — absolute value
**Window:** calendar month
**Owner:** [Analyst Name]
**Canonical query:** *follow-up — not yet written. Will land at `../../queries/billing/promo_mrr_lift.sql` once the first month of redemption data is available.*

---

## Related Queries

- `../../queries/billing/promo_conversion_rate.sql` — Weekly conversion rate by tier pair and discount

## Related Schemas

- `../../schemas/billing/promo_offers.md` — promo_offers table (shown / redeemed / expired events)
- `../../schemas/billing/subscriptions.md` — for segment joins

## Related in feature-index.yaml

These metrics power the **billing.tier-discount-promo** feature.

## Conventions for Adding a Metric

See `billing-metrics.md` for the full convention. Every metric must include numerator, denominator, window, owner, and a canonical query whose path resolves to a real file on disk (the launch gate enforces this).
