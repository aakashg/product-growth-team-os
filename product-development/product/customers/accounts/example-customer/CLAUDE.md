# Example Customer

Anonymized example account showing the standard folder layout. Delete or replace this folder once you onboard your first real customer.

## Account at a Glance

| | |
|---|---|
| **Segment** | Growth |
| **Plan tier** | [tier] |
| **Their champion** | Their VP of Engineering |
| **Their economic buyer** | Their CTO |
| **Renewal date** | YYYY-MM-DD |
| **Account owner (our side)** | [PM name from team roster] |

## Files

| File | Purpose |
|------|---------|
| `account-context.md` | Persistent context — goals, risks, history (the "what to remember" file) |
| `calls/summaries/` | Call summaries by date (the read-first artifact, PII-safe) |
| `calls/transcripts/` | Raw transcripts by date (loaded only when summary isn't enough) |

## When to Update

- After each call: a new summary + transcript pair, plus any new context worth carrying forward in `account-context.md`
- When their champion or economic buyer changes — update this file
- When they hit a renewal milestone or risk event — update this file with a one-liner pointing to the relevant call summary

## PII Reminder

Customer-side names go in `account-context.md` (where they're useful for relationship management) but **never** in call summaries or quotes. See `.claude/skills/customer-call-summary/SKILL.md`.
