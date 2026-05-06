# billing_events

Source: [Your data warehouse — Snowflake/BigQuery/etc.]
Updated: Real-time via event stream
Owner: [Data Engineering]

## Columns

| Column | Type | Description |
|--------|------|-------------|
| event_id | VARCHAR | Unique event identifier |
| customer_id | VARCHAR | FK to customers table |
| event_type | VARCHAR | One of: 'subscription_created', 'upgrade', 'downgrade', 'cancellation', 'renewal', 'payment_failed', 'payment_succeeded' |
| cancellation_reason | VARCHAR | Nullable. One of: 'voluntary', 'payment_failed', 'admin_cancelled'. Only populated when event_type = 'cancellation' |
| previous_tier | VARCHAR | Nullable. Tier before the event. Populated for upgrades/downgrades. |
| new_tier | VARCHAR | Nullable. Tier after the event. |
| mrr_delta | DECIMAL | Change in MRR caused by this event. Positive for upgrades, negative for downgrades/cancellations. |
| created_at | TIMESTAMP | When the event occurred (UTC) |

## Common Joins

- `customers` on customer_id — For segment, company_size, signup_date
- `subscriptions` on customer_id — For current tier, subscription start date

## Gotchas

- A single customer can have multiple events on the same day (e.g., upgrade then immediate downgrade)
- `payment_failed` events don't always lead to cancellation — there's a 14-day grace period
- Historical data before 2025-06-01 uses a different event schema. Filter to created_at >= '2025-06-01' for consistent data.
