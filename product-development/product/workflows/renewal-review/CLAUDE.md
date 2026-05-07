# Renewal Review Workflow

Weekly CSM ritual to look across the book and identify renewals at risk before they become escalations. 5 minutes. Prevents the "they churned and we didn't see it coming" outcome.

## Files

| File | Purpose |
|------|---------|
| `workflow-spec.md` | Process flow, signals, escalation thresholds |
| `step-1-renewal-window.md` | Pull all accounts with renewal in next 90 days |
| `step-2-signal-check.md` | Score each on health, champion, adoption signals |
| `step-3-action-list.md` | Generate prioritized action list with named owners |

## When to Run

- Every Monday morning (or your CSM team's standing day)
- Before every CS team standup
- Before any QBR cycle starts

## What It Reads

- `customers/accounts/portfolio.yaml` — `renewal_date`, `status`, `health_score`, `champion`, `last_call`
- `customers/accounts/{slug}/account-context.md` — open loops, risks
- `customers/accounts/{slug}/calls/summaries/` — last touch, sentiment

## What It Outputs

```markdown
## Renewal Review — {Date}

### Renewing in next 30 days (act this week)

| Account | Renewal | Health | Champion | Last touch | Action |
|---------|---------|--------|----------|------------|--------|
| {Customer} | 2026-05-15 | 4 | Active | 4 days ago | Confirm renewal verbally on next call |
| {Customer} | 2026-05-22 | 2 | Departed | 21 days ago | **ESCALATE** — run customer-escalation workflow |

### Renewing in 30-60 days

| Account | Renewal | Health | Action |
|---------|---------|--------|--------|
| ... | ... | ... | ... |

### Renewing in 60-90 days (monitor)

| Account | Renewal | Health | Watch For |
|---------|---------|--------|-----------|
| ... | ... | ... | ... |

### At-Risk Renewals (any window)

| Account | Renewal | Why At Risk | Run |
|---------|---------|-------------|-----|
| {Customer} | 2026-07-01 | Champion left 2026-04 | customer-escalation workflow |
```

## Escalation Thresholds

- **Health < 3 + renewal in 60 days** → run `customer-escalation` workflow
- **Champion departed + no replacement identified within 14 days** → escalate to AE for warm intro to new champion
- **Last touch > 21 days + renewal in 30 days** → CSM must touch this week

## Why This Is a Workflow, Not a Skill

A skill would dump data; the workflow forces the CSM to assign actions and timing. The output is a punch list — which is the artifact CS teams actually use.
