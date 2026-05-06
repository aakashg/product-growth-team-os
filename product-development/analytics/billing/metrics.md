# Billing Metrics

## MRR (Monthly Recurring Revenue)
Sum of all active subscription values normalized to monthly. Excludes one-time charges and refunds.
**Owner:** [Analyst Name]
**Dashboard:** [Link]
**Alert threshold:** <$[X] or >15% MoM decline

## Churn Rate (Monthly)
Percentage of paying customers who cancel or downgrade to free in a given month.
**Formula:** (Customers lost in month / Customers at start of month) x 100
**Owner:** [Analyst Name]
**Good:** <3% | **Concerning:** 3-5% | **Critical:** >5%

## Net Revenue Retention (NRR)
Revenue from existing customers this month / Revenue from same customers 12 months ago.
**Formula:** (Starting MRR + Expansion - Contraction - Churn) / Starting MRR x 100
**Owner:** [Analyst Name]
**Good:** >110% | **Great:** >130%

## ARPU (Average Revenue Per User)
Total MRR / Total paying customers.
**Owner:** [Analyst Name]
**Segmented by:** Tier (Basic / Pro / Enterprise)

## Tier Distribution
Percentage of paying customers on each pricing tier.
**Owner:** [Analyst Name]
**Current baseline:** Basic [X]% / Pro [X]% / Enterprise [X]%

## Related Queries
- queries/churn_by_segment.sql — Churn broken down by customer segment
- queries/mrr_trend.sql — MRR over time with expansion/contraction breakdown
- queries/nrr_cohort.sql — NRR by monthly cohort

## Related Schemas
- schemas/billing_events.md — The billing_events table structure
- schemas/subscriptions.md — The subscriptions table structure
