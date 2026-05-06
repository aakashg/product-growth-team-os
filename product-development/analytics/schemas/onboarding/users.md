# users

> Stub schema doc shipped with the starter kit so `data-catalog.yaml#users` resolves to a real file. Replace with your own.

| | |
|---|---|
| **Database / schema** | ANALYTICS.PROD |
| **Owner** | data-engineering |
| **Refresh** | daily |
| **Upstream** | Auth service → Fivetran |
| **Grain** | one row per user |
| **Partition key** | signup_date |
| **PII** | yes — email, full name, IP at signup |

## Columns

| Column | Type | Description |
|--------|------|-------------|
| user_id | VARCHAR | Primary key |
| organization_id | VARCHAR | FK to `organizations` |
| email | VARCHAR | PII — gated to PII-cleared analysts |
| full_name | VARCHAR | PII — gated |
| signup_date | DATE | When the account was created (UTC) |
| signup_country | VARCHAR | ISO-2 country code, derived from signup IP |
| activated_at | TIMESTAMP | Nullable — when the user completed activation event |
| last_active_at | TIMESTAMP | Updated nightly from session data |

## Common Joins

- `organizations` on `organization_id` — for plan tier, billing info
- `billing_events` on `organization_id` — for org-level billing context (not user-level)

## Gotchas

- `last_active_at` is nightly, not real-time — for real-time use the `sessions` event stream instead
- `activated_at` is null for users who never activated, not 0 or epoch
- PII columns are masked in non-prod environments
