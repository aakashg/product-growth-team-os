-- Promo Conversion Rate
-- Returns weekly tier-discount-promo conversion rate broken down by from_tier,
-- to_tier, and discount_pct.
-- Conversion rate = (customers who redeemed within the offer's validity window)
-- / (customers who were shown the offer in the same week).
--
-- "Shown" and "redeemed" both come from `promo_offers` (event_type column).
-- We attribute redemptions back to the week the offer was *shown*, so the
-- numerator and denominator share a cohort definition.
--
-- Verified by:    [Analyst Name]
-- Last verified:  2026-05-06
-- Owner:          [Analyst Name]
-- Dashboard:      [Link to connected dashboard]
-- Tables used:    promo_offers, subscriptions (see analytics/data-catalog.yaml)

-- ============================================
-- SNOWFLAKE
-- ============================================
WITH shown AS (
    SELECT
        DATE_TRUNC('week', po.offer_shown_at) AS shown_week,
        po.customer_id,
        po.offer_id,
        po.from_tier,
        po.to_tier,
        po.discount_pct,
        po.offer_expires_at,
        po.cancelled_before_expiry
    FROM promo_offers po
    WHERE po.event_type = 'shown'
        AND po.offer_shown_at >= DATEADD('week', -12, DATE_TRUNC('week', CURRENT_DATE))
        AND po.cancelled_before_expiry = FALSE
),
redeemed AS (
    SELECT DISTINCT
        po.offer_id,
        po.customer_id,
        po.redeemed_at
    FROM promo_offers po
    WHERE po.event_type = 'redeemed'
),
joined AS (
    SELECT
        s.shown_week,
        s.from_tier,
        s.to_tier,
        s.discount_pct,
        s.customer_id,
        CASE
            WHEN r.redeemed_at IS NOT NULL
                AND r.redeemed_at <= s.offer_expires_at
            THEN 1 ELSE 0
        END AS converted
    FROM shown s
    LEFT JOIN redeemed r
        ON r.offer_id = s.offer_id
        AND r.customer_id = s.customer_id
)
SELECT
    shown_week,
    from_tier,
    to_tier,
    discount_pct,
    COUNT(DISTINCT customer_id) AS customers_shown,
    SUM(converted) AS customers_redeemed,
    ROUND(
        SUM(converted)::DECIMAL
        / NULLIF(COUNT(DISTINCT customer_id), 0) * 100,
        2
    ) AS conversion_rate_pct
FROM joined
GROUP BY 1, 2, 3, 4
ORDER BY shown_week DESC, conversion_rate_pct DESC;

-- ============================================
-- BIGQUERY
-- ============================================
-- WITH shown AS (
--     SELECT
--         DATE_TRUNC(po.offer_shown_at, WEEK) AS shown_week,
--         po.customer_id, po.offer_id, po.from_tier, po.to_tier,
--         po.discount_pct, po.offer_expires_at, po.cancelled_before_expiry
--     FROM promo_offers po
--     WHERE po.event_type = 'shown'
--         AND po.offer_shown_at >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), WEEK), INTERVAL 12 WEEK)
--         AND po.cancelled_before_expiry = FALSE
-- ),
-- redeemed AS (
--     SELECT DISTINCT po.offer_id, po.customer_id, po.redeemed_at
--     FROM promo_offers po
--     WHERE po.event_type = 'redeemed'
-- )
-- SELECT
--     s.shown_week, s.from_tier, s.to_tier, s.discount_pct,
--     COUNT(DISTINCT s.customer_id) AS customers_shown,
--     COUNTIF(r.redeemed_at IS NOT NULL AND r.redeemed_at <= s.offer_expires_at) AS customers_redeemed,
--     ROUND(SAFE_DIVIDE(
--         COUNTIF(r.redeemed_at IS NOT NULL AND r.redeemed_at <= s.offer_expires_at),
--         COUNT(DISTINCT s.customer_id)) * 100, 2) AS conversion_rate_pct
-- FROM shown s
-- LEFT JOIN redeemed r USING (offer_id, customer_id)
-- GROUP BY 1, 2, 3, 4
-- ORDER BY shown_week DESC, conversion_rate_pct DESC;

-- ============================================
-- VARIANTS
-- ============================================
-- Segmented by customer segment: JOIN subscriptions ON customer_id and add
-- s.segment to the GROUP BY.
--
-- Strict same-session conversion: filter redeemed_at <= shown_at + INTERVAL '24 hours'.
--
-- Include cancelled-before-expiry customers (raw conversion, not "fair chance"):
-- drop the cancelled_before_expiry = FALSE filter.

-- ============================================
-- NOTES
-- ============================================
-- from_tier / to_tier values: 'basic', 'pro', 'enterprise'
-- discount_pct values: integer 0-100 (e.g. 20 means 20% off)
-- A customer can be shown multiple distinct offer_ids; we de-dupe per offer_id.
-- promo_offers is streaming; lag typically < 5min. Investigating an anomaly
-- < 15 min old? Check pipeline lag first.
