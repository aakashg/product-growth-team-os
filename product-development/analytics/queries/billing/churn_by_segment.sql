-- Churn by Segment
-- Returns monthly churn rate broken down by customer segment
-- Verified by: [Analyst Name] on [Date]
-- Last updated: [Date]
-- Warehouse: [Snowflake / BigQuery / Redshift — update to match yours]
-- Dashboard: [Link to connected dashboard]

-- ============================================
-- SNOWFLAKE VERSION
-- ============================================
-- If you use Snowflake, use this query as-is.
-- If you use BigQuery or Redshift, see the variants below.

SELECT
    DATE_TRUNC('month', be.created_at) AS churn_month,
    s.segment,
    s.tier,
    COUNT(DISTINCT CASE WHEN be.event_type = 'cancellation' THEN be.customer_id END) AS churned_customers,
    COUNT(DISTINCT s.customer_id) AS total_customers_start,
    ROUND(
        COUNT(DISTINCT CASE WHEN be.event_type = 'cancellation' THEN be.customer_id END)::DECIMAL
        / NULLIF(COUNT(DISTINCT s.customer_id), 0) * 100,
        2
    ) AS churn_rate_pct
FROM billing_events be
JOIN subscriptions s ON be.customer_id = s.customer_id
WHERE be.event_type = 'cancellation'
    AND be.created_at >= DATEADD('month', -6, CURRENT_DATE)
GROUP BY 1, 2, 3
ORDER BY churn_month DESC, churn_rate_pct DESC;

-- ============================================
-- BIGQUERY VARIANT
-- ============================================
-- Replace: DATEADD('month', -6, CURRENT_DATE) → DATE_SUB(CURRENT_DATE(), INTERVAL 6 MONTH)
-- Replace: ::DECIMAL → no cast needed (BigQuery auto-handles)
-- Replace: ROUND(..., 2) → ROUND(..., 2) (same)

-- ============================================
-- REDSHIFT VARIANT
-- ============================================
-- Replace: DATEADD('month', -6, CURRENT_DATE) → DATEADD(month, -6, GETDATE())
-- Otherwise syntax is compatible with Snowflake version.

-- ============================================
-- NOTES
-- ============================================
-- "cancellation" includes voluntary cancels AND failed payment churns
-- Segment values: 'enterprise', 'mid-market', 'smb', 'self-serve'
-- Tier values: 'basic', 'pro', 'enterprise'
-- For involuntary churn only: add WHERE be.cancellation_reason = 'payment_failed'
-- Data quality: filter to be.created_at >= '2025-06-01' for consistent schema
