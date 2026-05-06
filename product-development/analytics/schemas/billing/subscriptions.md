# subscriptions

| | |
|---|---|
| **Source** | [Your data warehouse] |
| **Refresh** | daily |
| **Typical lag** | < 24h (overnight Fivetran sync) |
| **Volume** | ~50K rows currently; one row per active subscription |
| **Partition key** | `start_date` |
| **PII** | no |
| **Grain** | one row per subscription state (a customer with multiple subscription periods has multiple rows) |
| **Owner** | data-engineering |

## Columns

| Column | Type | Description |
|--------|------|-------------|
| subscription_id | VARCHAR | Primary key |
| customer_id | VARCHAR | FK to customers / users |
| organization_id | VARCHAR | FK to organizations |
| segment | VARCHAR | One of: `enterprise`, `mid-market`, `smb`, `self-serve` |
| tier | VARCHAR | One of: `free`, `basic`, `pro`, `business`, `enterprise` |
| status | VARCHAR | One of: `active`, `cancelled`, `paused` |
| start_date | DATE | When this subscription state began |
| end_date | DATE | Nullable — when this state ended (null for currently-active) |
| mrr | DECIMAL | Current MRR for this subscription |

## Common Joins

- `billing_events` on `customer_id` — for event history
- `organizations` on `organization_id` — for org-level context
- `users` on `customer_id` — for user-level context

## Gotchas

- **Multi-row per customer.** A customer that upgraded from pro → business has two rows: one for the pro period (with `end_date`), one for the current business state. To count "current paying customers," filter to `end_date IS NULL AND status = 'active'`.
- **`segment` and `tier` denormalized here.** Source of truth is `organizations`; `subscriptions` carries snapshots. For the freshest segment, join to `organizations` directly.
- **Daily refresh** means same-day churn doesn't show up until the next morning. Use `billing_events` for real-time signals.
- **Cancellation reasons** live in `billing_events.cancellation_reason`, not here.
