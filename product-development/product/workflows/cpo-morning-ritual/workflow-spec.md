# CPO Morning Ritual — Workflow Spec

## Overview

Five-minute synthesis at the start of every weekday. Produces priorities, meeting briefs, Slack drafts, and an account-touch list. Replaces the *"flip through 7 tabs and try to remember what's important"* morning ritual.

## Process Flow

```
1. Create dated output file in output/YYYY-MM-DD.md
2. Step 1: Portfolio Pulse  → writes "Top 3 Priorities" + "Account Health" + "Open Loops"
3. Step 2: Meeting Briefs  → writes "Calendar Today" with per-meeting prep
4. Step 3: Slack Drafts    → writes "Drafts for Review" (never auto-posted)
5. Step 4: Publish         → pushes to your private Notion page (optional MCP)
```

## What Changes Every Day vs. What's Stable

### Changes every run

- **Top 3 Priorities** — recomputed from portfolio.yaml status changes + open loops aging + today's calendar
- **Calendar briefs** — different meetings each day
- **Slack drafts** — based on overnight DMs and open threads
- **Open loops aging** — days-since-asked changes daily

### Stable across runs (carried forward, not rewritten)

- Account roster from `portfolio.yaml`
- Standing weekly meetings get a stable brief that updates only when material context changes

## Conventions

- **Never auto-send anything.** Drafts go to a review queue. Even Slack messages.
- **Read-only.** This workflow doesn't modify the repo. Decisions, call summaries, and PRs come from other workflows.
- **Token budget per run:** under 2,000 output tokens. If the output exceeds this, the workflow has too many open loops — escalate via 1:1 reviews.
- **PII rule** still applies — meeting briefs use role attribution for customer-side names; Slack drafts to internal channels can use first names.

## Special Cases

### Calendar empty

The workflow still runs — just produces "no meetings today" + portfolio pulse + open loops. Useful on focus days.

### Calendar has 8+ meetings

The workflow briefs the first 5 only. Items 6+ get a one-liner + link to their last call summary.

### Customer escalation overnight

If `portfolio.yaml#status` flipped to `at-risk` or `churning` since the last run, that customer goes to the top of "Today's Top 3 Priorities" automatically with the most-recent call summary linked.

## Reference

`../bi-weekly-update/reference/` shows the canonical good-output for the bi-weekly cadence. This workflow's reference will accumulate in `reference/` once you've run it for a week and have a good template.
