# organizations

> Stub schema doc shipped with the starter kit so `data-catalog.yaml#organizations` resolves to a real file. Replace with your own.

| | |
|---|---|
| **Source** | [Your data warehouse — Snowflake/BigQuery/etc.] |
| **Database / schema** | ANALYTICS.PROD |
| **Refresh** | daily |
| **Typical lag** | < 24h (overnight Fivetran sync) |
| **Volume** | ~80K total |
| **Upstream** | Billing service → Fivetran |
| **Grain** | one row per organization |
| **Partition key** | created_at |
| **PII** | no |
| **Owner** | data-engineering |

## Columns

| Column | Type | Description |
|--------|------|-------------|
| organization_id | VARCHAR | Primary key |
| name | VARCHAR | Org display name |
| segment | VARCHAR | One of: `enterprise`, `mid-market`, `smb`, `self-serve` |
| current_tier | VARCHAR | One of: `free`, `basic`, `pro`, `business`, `enterprise` |
| seats | INT | Current paid seat count |
| created_at | TIMESTAMP | When the org was created (UTC) |
| churned_at | TIMESTAMP | Nullable — when they cancelled or downgraded to free |
| renewal_date | DATE | Nullable — next renewal for paid tiers |

## Common Joins

- `users` on `organization_id` — for member-level analysis
- `billing_events` on `organization_id` — for revenue, charges, refunds, churn signals
- `subscriptions` on `organization_id` — for current MRR and plan history

## Gotchas

- A `churned_at` value doesn't always mean "no longer paying" — they may have downgraded to a free tier. Filter on `current_tier` for current state.
- `seats` reflects today's paid seats; for historical seat-trend analysis use `subscriptions` history
- Self-serve segment orgs are tracked in aggregate, not in `customers/accounts/` per-account folders
