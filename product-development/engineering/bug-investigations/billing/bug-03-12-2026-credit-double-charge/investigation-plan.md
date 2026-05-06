# Bug Investigation: Credit Double-Charge (2026-03-12)

> Stub investigation shipped with the starter kit. Replace with your own.

## Symptoms

Three Pro-tier orgs reported being charged twice for the same credit purchase on 2026-03-11. Stripe shows two `charge.succeeded` webhooks within ~50ms of each other for each duplicated purchase.

## Investigation Steps

1. **2026-03-12 09:14** — Confirmed three reports in `#support` between 17:00 and 21:00 UTC on 2026-03-11
2. **2026-03-12 09:30** — Pulled `billing_events` for affected orgs; confirmed two `charge.succeeded` events per duplicated purchase
3. **2026-03-12 10:00** — Stripe support confirmed our webhook endpoint sent a 5xx response within Stripe's retry window for those purchases, triggering Stripe's automatic retry
4. **2026-03-12 10:45** — Reproduced in staging by simulating a 503 from our webhook handler — Stripe retried within 30s, second charge processed
5. **2026-03-12 11:30** — Root cause confirmed: webhook handler had no idempotency on the `idempotency_key` path

## Root Cause

The webhook handler accepts duplicate `idempotency_key` values from Stripe retries because we never persisted the idempotency key. Any 5xx response within Stripe's retry window produces a duplicate charge.

## Fix Applied

PR #YYYY adds a `webhook_idempotency` table keyed on `idempotency_key`, with INSERT-OR-IGNORE semantics. Subsequent webhook deliveries with a key we've already seen are acknowledged (200) but not re-processed. Shipped 2026-03-13.

## Refunds

Affected customers refunded automatically via the migration script run on 2026-03-13. Confirmed in `billing_events` as `event_type = 'refund'` with `cancellation_reason = 'admin_cancelled'`.

## Prevention

- Idempotency table now in place for all Stripe webhooks (not just `charge.succeeded`)
- Added monitor: alert on any `idempotency_key` seen more than once in `webhook_idempotency` within 60s — would have caught this within minutes
- Added RFC requirement: every external webhook handler must have idempotency before merge

## Related

- Feature index: `feature-index.yaml#billing.credit-usage-dashboard`
- Underlying table: `analytics/schemas/billing/billing_events.md`
- Playbook for billing anomalies: `analytics/playbooks/churn-spike-investigation.md`
