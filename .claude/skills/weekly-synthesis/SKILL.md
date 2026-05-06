---
name: weekly-synthesis
description: Summarize everything that changed in the repo this week, grouped by folder (product, analytics, engineering, data-engineering, team). Highlights decisions, customer insights, metric changes. Slack-ready output.
---

# Weekly Synthesis

Generate a summary of everything that changed in the Team OS repo this week. Post to Slack so the team stays current.

## When to Use

- Run every Friday afternoon (automate via cron or Claude Code hooks)
- Run manually before Monday standup
- Adjust the day to match your team's timezone and sprint cadence

## What It Does

1. Scans all git commits from the last 7 days
2. Groups changes by folder (product, analytics, engineering, data-engineering, team)
3. Summarizes what was added, updated, or removed
4. Highlights key decisions, customer insights, and metric changes
5. Formats as a Slack-ready message

## Output Format

```markdown
## 📋 Team OS Weekly Synthesis — Week of {Date range, e.g., Apr 28 - May 2}

### Product
- **Decisions logged:** {N}
  - {Title} — {One-line summary}
- **Customer calls summarized:** {N}
  - {Customer A}: {Key takeaway, role-attributed quote if relevant}
  - {Customer B}: {Key takeaway}
- **PRDs updated:** {List by area}
- **Competitive research:** {New competitor entries or matrix updates}
- **Launch emails / sales enablement:** {List, if any}

### Analytics
- **Metrics updated:** {Which metrics/{area}/ files changed}
- **New queries:** {List by area}
- **Schemas / data-catalog:** {New tables registered}
- **Experiments:** {Started, results posted}
- **Investigations:** {New}
- **Playbooks updated:** {List}

### Engineering
- **Bug investigations:** {N new, by area}
- **RFCs:** {N new or updated, by area}
- **Plans:** {Net new}

### Data Engineering
- **Pipeline plans / RFCs:** {New, by area}

### Team
- **Retros added:** {List}
- **New contributors:** {Anyone who made their first commit this week 🎉}

### ⚡ Top 3 Things to Know
1. {Most important new information}
2. {Second}
3. {Third}

### 📊 Repo Health
- Files added this week: {N}
- Total files: {N}
- Contributors this week: {N} of {total team size}
- Stale files (from /freshness-check): {N}
```

## If Nothing Changed This Week

Don't skip the synthesis. Post:

```markdown
## 📋 Team OS Weekly Synthesis — Week of {Date}

No changes this week. If decisions were made or customer calls happened, they should be checked in.

Quick reminder: /decision-log-entry after meetings with decisions, /customer-call after calls.
```

This gentle nudge prevents the repo from going silent without being preachy.

## Rules

1. Keep under 500 words. Scan, not report.
2. "Top 3 Things to Know" is the most important section. Prioritize: decisions affecting the whole team > customer insights > metric movements.
3. If Slack MCP connected, post to the team's product channel. If not, save to `team/weekly-syntheses/{YYYY-MM-DD}.md`
4. Tag specific people if a change is relevant to them (using roster from root CLAUDE.md).
5. Include the "New contributors" callout to celebrate adoption.
6. For multi-team setups: each team should run their own `/weekly-synthesis` in their own channel for repo-level changes. The exec-grade rollup across teams (top risks, expansion signals, account health) is the `/portfolio-pulse` skill — see `.claude/skills/portfolio-pulse/SKILL.md`. Pair the two on Friday afternoon for the full picture.
