---
name: portfolio-pulse
description: Exec-grade daily / weekly synthesis across all managed accounts and active features. Rolls up account health, risks, expansion signals, top 3 priorities, and drafted Slack messages. Designed for CPO / Head-of-Product hub-and-spoke usage.
---

# Portfolio Pulse

Exec-grade synthesis for the person watching the whole portfolio. Outputs priorities, account health rollup, top risks, expansion signals, and drafted messages.

This is the morning-ritual / weekly-synthesis skill for hub-and-spoke usage. Pair with `/weekly-synthesis` (which covers repo-level changes) for the full picture.

## Inputs

The skill reads:

- `product-development/product/customers/accounts/portfolio.yaml` — primary input
- Recent summaries in `accounts/{customer}/calls/summaries/` (last 14 days)
- `product/decisions/` (recent)
- `feature-index.yaml` — for cross-referencing in-flight work
- Optional MCP feeds: Calendar (today's meetings), CRM (deal stages), Granola (recent transcripts), Slack (mentions of customer names), LinkedIn (champion job changes)

If MCPs aren't connected, the skill still works on the YAML + markdown alone — just without the live signals.

## When to Run

- **Morning** — hub-and-spoke daily ritual. Run with `--mode=daily`. Output: today's top 3 priorities + 1:1 prep + accounts to touch.
- **Friday afternoon** — exec weekly digest. Run with `--mode=weekly`. Output: cross-team rollup, top 5 risks, top 5 expansion signals, week's decision highlights.
- **Pre board / leadership meeting** — `--mode=board`. Output: portfolio health distribution, ARR-weighted risk, expansion ARR.

## Daily Mode Output

```markdown
## 📋 Portfolio Pulse — {Date} (Daily)

### Today's Top 3 Priorities

1. {Priority — link to account/feature/decision}
2. {Priority}
3. {Priority}

### Calendar Today (from MCP)

| Time | Customer / Topic | Prep |
|------|------------------|------|
| 10:00 | {Customer} bi-weekly | {1-line context from latest call summary} |
| 14:00 | Internal pricing review | {link to relevant decision} |

### Accounts Needing Touch

- **{Customer}** — {Reason: champion not heard from in 14 days; next milestone in 3 days}
- **{Customer}** — {Reason: risk flagged 2026-04-22 unresolved}

### Open Loops Aging > 7 Days

| Account | Loop | Days open | Owner |
|---------|------|-----------|-------|
| {Customer} | {Loop} | 9 | {Name} |
```

## Weekly Mode Output

```markdown
## 📋 Portfolio Pulse — Week of {Date} (Weekly)

### Account Health Distribution

| Status | Count | Δ vs. last week | ARR (band-weighted) |
|--------|-------|-----------------|---------------------|
| Expanding | 4 | +1 | $1.2M-$2.1M |
| Healthy | 12 | 0 | $3.5M-$5.0M |
| At-risk | 3 | +1 | $400k-$800k |
| Churning | 1 | -1 | $50k-$100k |

### Top 5 Cross-Account Risks

1. **{Pattern}** — {N accounts affected: A, B, C} — {Mitigation status}
2. ...

### Top 5 Expansion Signals

1. **{Customer}** — {Signal} — {Owner / next step}
2. ...

### Decision Highlights (Week of {Date})

- **{Decision title}** — {1-line summary} — `{path/to/decision.md}`

### Cross-Team Rollup (multi-team only)

| Team | Active workstreams | Decisions this week | Customer calls | Stale files (90d+) |
|------|--------------------|---------------------|--------------:|-------------------:|
| Team A | 6 | 2 | 5 | 3 |
| Team B | 4 | 1 | 3 | 1 |
| Team C | 7 | 3 | 4 | 0 |

### Drafted Slack Messages (review before posting)

#### #leadership
> {Drafted week-in-review message}

#### #cpo-direct-reports
> {Drafted message to direct reports about week's priorities}
```

## Board Mode Output

Compresses Weekly mode to one page. Adds: ARR-weighted risk score, ARR-weighted expansion score, top 3 narrative-grade insights for board memo.

## Rules

1. Never invent data. If the YAML doesn't have it, mark "(no data)".
2. Cross-reference every claim — every account mention links to its folder, every risk to its source summary or audit, every decision to its file.
3. Drafted Slack messages always go to a "review before posting" section, never auto-posted.
4. Health distribution is computed from `portfolio.yaml#status`. If the YAML is stale (last_updated > 30 days for any entry), flag in the output.
5. For multi-team setups, the cross-team rollup pulls from each team's repo using a configurable list. If repos aren't reachable, mark "(unreachable)".
6. Token budget: daily mode under 800 tokens output, weekly under 1500, board under 1000.

## Setting Up Multi-Team Rollup

If the CPO oversees multiple product teams each with their own Team OS repo:

1. Maintain a single `~/.team-os/multi-team.yaml` listing each team's repo path
2. The skill reads each repo's `portfolio.yaml`, recent decisions, and call summaries
3. Outputs a unified cross-team digest with per-team breakdowns

A starter `multi-team.yaml` schema:

```yaml
teams:
  - name: Growth
    repo: ~/work/growth-team-os
    pm: drew
  - name: Platform
    repo: ~/work/platform-team-os
    pm: alex
  - name: Enterprise
    repo: ~/work/enterprise-team-os
    pm: hannah
```

## Related

- `/weekly-synthesis` — repo-level changes (decisions logged, files added, contributors); pair with portfolio-pulse for the full Friday afternoon read
- `customers/accounts/portfolio.yaml` — the registry this skill reads from
- `workflows/cpo-morning-ritual/` — wraps portfolio-pulse with calendar pull and pre-meeting briefs
