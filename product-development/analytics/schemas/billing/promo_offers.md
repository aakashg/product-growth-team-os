# promo_offers

| | |
|---|---|
| **Source** | [Your data warehouse — Snowflake/BigQuery/etc.] |
| **Refresh** | streaming via Snowpipe |
| **Typical lag** | < 5 min; PagerDuty alert at > 15 min |
| **Volume** | ~50K events/day (projected at launch); grows with rollout |
| **Partition key** | `offer_shown_at` (clustered/partitioned daily) |
| **PII** | no — offer metadata only, no customer names or emails |
| **Grain** | one row per promo offer event (shown / redeemed / expired) |
| **Owner** | data-engineering |

## Columns

| Column | Type | Description |
|--------|------|-------------|
| event_id | VARCHAR | Unique event identifier |
| offer_id | VARCHAR | Stable ID for the specific offer instance shown to a customer |
| customer_id | VARCHAR | FK to customers / subscriptions |
| event_type | VARCHAR | One of: 'shown', 'redeemed', 'expired', 'dismissed' |
| from_tier | VARCHAR | Tier the customer was on when offer was shown ('basic', 'pro') |
| to_tier | VARCHAR | Tier the offer upgrades them to ('pro', 'enterprise') |
| discount_pct | INTEGER | Percentage discount, 0-100 |
| offer_shown_at | TIMESTAMP | When the offer was first shown to the customer (UTC). Populated on every row of an offer's lifecycle for join convenience. |
| offer_expires_at | TIMESTAMP | When the offer's validity window ends (UTC) |
| redeemed_at | TIMESTAMP | Nullable. When the customer redeemed. Only populated when event_type = 'redeemed'. |
| discount_amount | DECIMAL | Nullable. Dollar value of discount applied at redemption. |
| cancelled_before_expiry | BOOLEAN | TRUE if subscription was cancelled before offer_expires_at — used to exclude from conversion-rate denominators |
| created_at | TIMESTAMP | When the event row was written (UTC) |

## Common Joins

- `subscriptions` on customer_id — For segment, current tier
- `billing_events` on customer_id + redeemed_at — To attribute the upgrade event back to the promo

## Gotchas

- A single customer can be shown multiple distinct `offer_id`s — always de-dupe by offer_id, not customer_id, when computing per-offer rates
- `dismissed` events are emitted only when the customer explicitly closes the modal; closing the browser tab does NOT emit an event (treat as silent non-redemption)
- `discount_amount` is only populated on `redeemed` rows. Don't sum across all events.
- This table is new at launch (2026-05-13). No backfill — earliest data is launch day.
