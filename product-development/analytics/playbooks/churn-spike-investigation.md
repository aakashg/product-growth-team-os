# Playbook: Investigating a Churn Spike

**Owner:** [Analyst Name]
**Last verified:** 2026-04-01
**When to use:** Churn rate exceeds 5% monthly or shows >50% increase MoM

## Step 1: Confirm the spike is real

Run `../queries/billing/churn_by_segment.sql` and check:
- Is the spike concentrated in one segment or spread across all?
- Is it voluntary or involuntary (payment_failed)?
- Did total customer count change (denominator shift can fake a spike)?

## Step 2: Check for external causes

- Was there a price change in the last 30 days? Check `product/decisions/` for recent pricing decisions.
- Was there an outage or incident? Check `engineering/bug-investigations/billing/` for recent P0/P1 incidents.
- Did a competitor launch something? Check `product/competitive-research/competitors/` for recent entries.

## Step 3: Segment the churned customers

Run this modified query to understand WHO churned:

```sql
SELECT
    s.segment,
    s.tier,
    c.signup_date,
    DATEDIFF('day', c.signup_date, be.created_at) AS days_as_customer,
    c.company_size
FROM billing_events be
JOIN subscriptions s ON be.customer_id = s.customer_id
JOIN customers c ON be.customer_id = c.customer_id
WHERE be.event_type = 'cancellation'
    AND be.created_at >= DATEADD('day', -30, CURRENT_DATE)
ORDER BY days_as_customer ASC;
```

Look for:
- Are churned customers disproportionately new (< 90 days)?
- Are they concentrated in one tier?
- Are they concentrated in one company size band?

## Step 4: Check product usage before churn

If connected to product analytics (Amplitude/PostHog MCP), query:
- Average sessions per week in the 30 days before cancellation
- Last feature used before cancellation
- Compare to non-churned customers in same segment

## Step 5: Document findings

Save the investigation to `analytics/investigations/billing/{date}-{topic}.md`. If it surfaces a production bug, also create `engineering/bug-investigations/billing/bug-{date}-{slug}/investigation-plan.md`. If it triggers a pricing or strategy decision, log it in `product/decisions/`.

Document:
- What the spike was
- Root cause identified (or hypothesized)
- Recommended action
- Whether action was taken and outcome

## Common Gotchas

- Annual renewals cluster in specific months. A "spike" in March might just be the annual cohort from last March deciding not to renew.
- Free trial expirations aren't churn. Make sure your query excludes customers who never converted to paid.
- Involuntary churn from payment failures often self-resolves within the 14-day grace period. Wait before raising alarms.
