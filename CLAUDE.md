# [Your Product Name] — Team OS

## Team

| Role | Name | Slack | GitHub |
|------|------|-------|--------|
| PM | [Your Name] | @[slack-id] | @[github] |
| Eng Lead | [Name] | @[slack-id] | @[github] |
| Designer | [Name] | @[slack-id] | @[github] |
| Analyst | [Name] | @[slack-id] | @[github] |
| [Add more rows as needed] | | | |

## Channels

- #[product-team] — Daily standups and feature updates
- #[eng-team] — Engineering discussions and PRs
- #[data-insights] — Weekly metrics and analysis
- #[design] — Design reviews and research (if applicable)

## Doc Index

- product-development/product/ — PRDs, strategy, customers, competitive research, decisions, design research
- product-development/analytics/ — Metrics definitions, SQL queries, table schemas, playbooks
- product-development/engineering/ — Bug investigations, RFCs, technical designs
- team/ — Onboarding guides, retros, team docs
- .claude/skills/ — Shared skills invoked by all team members
- .claude/commands/ — Shared commands (weekly-synthesis, upgrade-to-team-os)

## Three Rules

1. **Summaries first, raw data in subfolders.** A one-hour call becomes a 500-token summary. Raw data sits one folder deeper for when the summary is not enough.
2. **Every folder has a CLAUDE.md navigation file.** Update it when you add files. This is how Claude finds things without burning tokens searching.
3. **The repo gets updated before a feature ships.** Run /feature-launch-gate. No exceptions.

## Quick Start

**New team member?** Read team/onboarding/new-member-guide.md

**Small team (2-5 people)?** Read MINIMAL-SETUP.md — you only need 3 folders and 5 files to start.

**Already have Aakash's PM OS?** Run /upgrade-to-team-os (about 2 minutes).

**Never used Git before?** Read team/onboarding/github-101.md — 5 commands, 10 minutes.

## Where Different Roles Check In Work

| Role | Primary Folders | What to Check In |
|------|----------------|------------------|
| PM | decisions/, customers/, PRDs/ | Decision logs, call summaries, PRDs, strategy |
| Engineer | engineering/bugs/, engineering/rfcs/ | Bug investigations with root cause, technical designs |
| Designer | product/customers/ (UX findings), product/decisions/ (design decisions) | User research, UX audit results, design decision rationale |
| Analyst | analytics/[area]/ | Metric definitions, verified SQL, schemas, playbooks |
| Ops/Strategy | product/customers/, product/competitive-research/ | Call summaries, competitive intel |

## Branch Protection (Recommended)

On GitHub: Settings > Branches > Add rule for main branch:
- Require pull request reviews (at least 1 approval)
- This prevents accidental pushes and ensures review
