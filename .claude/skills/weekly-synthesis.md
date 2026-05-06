# Weekly Synthesis

Generate a summary of everything that changed in the Team OS repo this week. Post to Slack so the team stays current.

## When to Use

- Run every Friday afternoon (automate via cron or Claude Code hooks)
- Run manually before Monday standup
- Adjust the day to match your team's timezone and sprint cadence

## What It Does

1. Scans all git commits from the last 7 days
2. Groups changes by folder (product, analytics, engineering, team)
3. Summarizes what was added, updated, or removed
4. Highlights key decisions, customer insights, and metric changes
5. Formats as a Slack-ready message

## Output Format

```markdown
## 📋 Team OS Weekly Synthesis — Week of [Date range, e.g., Apr 28 - May 2]

### Product
- **Decisions logged:** [N]
  - [Title] — [One-line summary]
- **Customer calls summarized:** [N]
  - [Customer A]: [Key takeaway]
  - [Customer B]: [Key takeaway]
- **PRDs updated:** [List]
- **Design artifacts added:** [List, if any]

### Analytics
- **Metrics updated:** [Which metrics.md files changed]
- **New queries:** [List]
- **Playbooks updated:** [List]

### Engineering
- **Bug investigations:** [N new]
- **RFCs:** [N new or updated]

### Team
- **Retros added:** [List]
- **New contributors:** [Anyone who made their first commit this week 🎉]

### ⚡ Top 3 Things to Know
1. [Most important new information]
2. [Second]
3. [Third]

### 📊 Repo Health
- Files added this week: [N]
- Total files: [N]
- Contributors this week: [N] of [total team size]
```

## If Nothing Changed This Week

Don't skip the synthesis. Post:

```markdown
## 📋 Team OS Weekly Synthesis — Week of [Date]

No changes this week. If decisions were made or customer calls happened, they should be checked in.

Quick reminder: /decision-log-entry after meetings with decisions, /customer-call-summary after calls.
```

This gentle nudge prevents the repo from going silent without being preachy.

## Rules

1. Keep under 500 words. Scan, not report.
2. "Top 3 Things to Know" is the most important section. Prioritize: decisions affecting the whole team > customer insights > metric movements.
3. If Slack MCP connected, post to the team's product channel. If not, save to team/weekly-syntheses/[YYYY-MM-DD].md
4. Tag specific people if a change is relevant to them (using roster from root CLAUDE.md).
5. Include the "New contributors" callout to celebrate adoption.
6. For multi-team setups: each team should run their own synthesis in their own channel. Don't merge teams into one digest.
