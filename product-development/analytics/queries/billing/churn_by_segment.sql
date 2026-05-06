-- Churn by Segment
-- Returns monthly churn rate broken down by customer segment + tier.
-- Churn rate = (customers who churned in month) / (customers active at start of month).
--
-- "Churn" here = voluntary cancellations only (event_type = 'cancellation' AND
-- cancellation_reason = 'voluntary'). For involuntary churn or combined, see
-- the Variants section at the bottom.
--
-- "Customers active at start of month" = had an active subscription on day 1
-- of the month. Computed from `subscriptions` as of the month boundary.
--
-- Verified by:    [Analyst Name]
-- Last verified:  [YYYY-MM-DD]
-- Owner:          [Analyst Name]
-- Dashboard:      [Link to connected dashboard]
-- Tables used:    billing_events, subscriptions (see analytics/data-catalog.yaml)
--
-- Pick the block matching your warehouse and run it as-is. Each block is
-- runnable; the differences are in the date math.

-- ============================================
-- SNOWFLAKE
-- ============================================
WITH month_starts AS (
    SELECT DATE_TRUNC('month', DATEADD('month', -i.value, CURRENT_DATE)) AS month_start
    FROM (SELECT 0 AS value UNION ALL SELECT 1 UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL SELECT 5) i
),
active_at_month_start AS (
    SELECT
        m.month_start,
        s.segment,
        s.tier,
        COUNT(DISTINCT s.customer_id) AS active_customers
    FROM month_starts m
    JOIN subscriptions s
        ON s.start_date <= m.month_start
        AND (s.end_date IS NULL OR s.end_date > m.month_start)
        AND s.status = 'active'
    GROUP BY 1, 2, 3
),
churned_in_month AS (
    SELECT
        DATE_TRUNC('month', be.created_at) AS month_start,
        s.segment,
        s.tier,
        COUNT(DISTINCT be.customer_id) AS churned_customers
    FROM billing_events be
    JOIN subscriptions s ON be.customer_id = s.customer_id
    WHERE be.event_type = 'cancellation'
        AND be.cancellation_reason = 'voluntary'
        AND be.created_at >= DATEADD('month', -6, DATE_TRUNC('month', CURRENT_DATE))
    GROUP BY 1, 2, 3
)
SELECT
    a.month_start AS churn_month,
    a.segment,
    a.tier,
    COALESCE(c.churned_customers, 0) AS churned_customers,
    a.active_customers AS total_customers_start,
    ROUND(
        COALESCE(c.churned_customers, 0)::DECIMAL
        / NULLIF(a.active_customers, 0) * 100,
        2
    ) AS churn_rate_pct
FROM active_at_month_start a
LEFT JOIN churned_in_month c
    ON a.month_start = c.month_start AND a.segment = c.segment AND a.tier = c.tier
ORDER BY churn_month DESC, churn_rate_pct DESC;

-- ============================================
-- BIGQUERY
-- ============================================
-- WITH month_starts AS (
--     SELECT DATE_TRUNC(DATE_SUB(CURRENT_DATE(), INTERVAL i MONTH), MONTH) AS month_start
--     FROM UNNEST([0, 1, 2, 3, 4, 5]) AS i
-- ),
-- active_at_month_start AS (
--     SELECT
--         m.month_start,
--         s.segment,
--         s.tier,
--         COUNT(DISTINCT s.customer_id) AS active_customers
--     FROM month_starts m
--     JOIN subscriptions s
--         ON s.start_date <= m.month_start
--         AND (s.end_date IS NULL OR s.end_date > m.month_start)
--         AND s.status = 'active'
--     GROUP BY 1, 2, 3
-- ),
-- churned_in_month AS (
--     SELECT
--         DATE_TRUNC(be.created_at, MONTH) AS month_start,
--         s.segment,
--         s.tier,
--         COUNT(DISTINCT be.customer_id) AS churned_customers
--     FROM billing_events be
--     JOIN subscriptions s ON be.customer_id = s.customer_id
--     WHERE be.event_type = 'cancellation'
--         AND be.cancellation_reason = 'voluntary'
--         AND be.created_at >= DATE_SUB(DATE_TRUNC(CURRENT_DATE(), MONTH), INTERVAL 6 MONTH)
--     GROUP BY 1, 2, 3
-- )
-- SELECT
--     a.month_start AS churn_month,
--     a.segment,
--     a.tier,
--     IFNULL(c.churned_customers, 0) AS churned_customers,
--     a.active_customers AS total_customers_start,
--     ROUND(
--         SAFE_DIVIDE(IFNULL(c.churned_customers, 0), a.active_customers) * 100,
--         2
--     ) AS churn_rate_pct
-- FROM active_at_month_start a
-- LEFT JOIN churned_in_month c USING (month_start, segment, tier)
-- ORDER BY churn_month DESC, churn_rate_pct DESC;

-- ============================================
-- REDSHIFT
-- ============================================
-- (Same shape as Snowflake, replace DATEADD('month', -X, ...) with
--  DATEADD(month, -X, ...) and CURRENT_DATE with GETDATE().)

-- ============================================
-- VARIANTS
-- ============================================
-- Combined churn (voluntary + involuntary):
--   In churned_in_month, drop the cancellation_reason filter.
--
-- Involuntary churn only:
--   In churned_in_month, change cancellation_reason = 'voluntary' to
--   cancellation_reason = 'payment_failed'.
--
-- Calendar-month vs. rolling-30d window:
--   This query measures calendar months. For rolling-30d, replace
--   DATE_TRUNC('month', ...) with explicit 30-day windows.

-- ============================================
-- NOTES
-- ============================================
-- Segment values: 'enterprise', 'mid-market', 'smb', 'self-serve'
-- Tier values: 'basic', 'pro', 'enterprise'
-- Schema cutoff: filter be.created_at >= '2025-06-01' to avoid pre-rewrite events
-- Freshness: billing_events is streaming via Snowpipe; lag typically < 5min,
--   alerts at > 15min. If you're investigating an anomaly < 15 min old, check
--   pipeline lag before drawing conclusions.
