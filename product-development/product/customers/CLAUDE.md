# Customer Insights

Account context, call summaries, and call transcripts for your team's named accounts.

## Segments

| Segment | Description |
|---------|-------------|
| Enterprise | Managed accounts with complex needs (SSO, compliance, dedicated CSM) |
| Growth | Mid-market accounts with expansion potential |
| Self-serve | Long-tail accounts tracked through aggregate analytics, no individual folder |

Only named/managed accounts get folders. Self-serve customers live in dashboards, not here.

## Named Accounts

| Account | Segment | Folder | Last Call |
|---------|---------|--------|-----------|
| Example Customer | Growth | [accounts/example-customer/](accounts/example-customer/CLAUDE.md) | (none yet) |

> Add a row per managed account during initial setup. Update **Last Call** when you save a new summary.

## Folder Layout

Each account follows the same shape:

```
accounts/{customer}/
├── CLAUDE.md            # one-pager: contacts, segment, current relationship state
├── account-context.md   # the persistent context worth carrying forward
└── calls/
    ├── summaries/       # /YYYY-MM-DD.md per call (the read-first artifact)
    └── transcripts/     # /YYYY-MM-DD.md per call (only loaded when summary isn't enough)
```

This separation matters: summaries are 500 tokens each, transcripts can be 10K+. The PII rule (no customer-side personal names in summaries) keeps them safe to share and synthesize.

## Finding Customer Data

| Looking for... | Where to find it |
|----------------|------------------|
| Account context, goals, risks | `accounts/{customer}/account-context.md` |
| Call summaries | `accounts/{customer}/calls/summaries/` |
| Call transcripts | `accounts/{customer}/calls/transcripts/` |
| Analytics (metrics, queries, dashboards) | `../../analytics/CLAUDE.md` (organized by product area, not by customer) |
| Feature requests for a customer | Linear / Jira / Asana — filter by customer label |
| Escalations | Linear / Jira / Asana — filter by `type:escalation` + customer label |

## Processing a Customer Call

Use the `/customer-call` command (in `.claude/commands/customer-call.md`). It:

1. Identifies the customer and product area
2. Checks for existing summary/transcript files
3. Generates a structured summary with insights tables, feature requests, follow-up email, and Slack draft
4. Saves to `accounts/{customer}/calls/summaries/{YYYY-MM-DD}.md` and `accounts/{customer}/calls/transcripts/{YYYY-MM-DD}.md`
5. Updates `account-context.md` and the **Last Call** column above

The format is in `.claude/skills/customer-call-summary/SKILL.md` with a worked example at `.claude/skills/customer-call-summary/examples/example-2026-01-27.md`.

## PII Rule

Never include customer-side personal names in summaries. Use role titles only — *"Their VP of Engineering"*, *"Their Champion"*. Quotes get role attribution: *"[quote]" — Their VP of Eng*. Our team members' names are fine.

The transcript file may contain raw names since it's a faithful record. The summary, which gets shared and synthesized, must not.
