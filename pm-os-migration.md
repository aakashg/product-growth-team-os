# PM OS → Team OS Migration Guide

If you already have Aakash's PM Operating System, this guide explains what moves to the shared team repo and what stays personal.

## The Fast Way

Run `/upgrade-to-team-os` in Claude Code. It handles everything below in ~2 minutes without overwriting any of your existing PM OS files.

## The Manual Way

### What MOVES to the team repo (copy, don't delete originals)

| PM OS Location | Team OS Destination |
|---|---|
| `context-library/business-info.md` | `product-development/product/strategy/business-context/` |
| `context-library/competitive-intel/*` | `product-development/product/competitive-research/competitors/{competitor}/` |
| Any PRDs you've written | `product-development/product/PRDs/{area}/{slug}-prd.md` |
| Any strategy docs | `product-development/product/strategy/roadmaps/`, `strategy/vision/`, or `strategy/business-context/` |
| `templates/launch-checklist.md` | Already covered by `/feature-launch-gate` skill — review and merge any team-specific items |

### What STAYS personal (do NOT copy to team repo)

| PM OS File | Why It Stays Personal |
|---|---|
| `sub-agents/` (all 7 reviewers) | These are YOUR review perspectives. Others can build their own |
| `context-library/personal-context-pm-background.md` | Your personal career context |
| `context-library/personal-context-working-preferences.md` | Your personal preferences |
| Any personal writing style files | Your voice, not the team's |
| `.claude/skills/` (personal skills like `/prd-draft`) | Personal workflow skills stay personal |

### What gets ADDED in the team repo

The 5 shared skills bundled with the Team OS starter kit (`.claude/skills/{skill-name}/SKILL.md`):

- `customer-call-summary` — paired with the `/customer-call` command
- `decision-log-entry`
- `feature-launch-gate`
- `freshness-check`
- `weekly-synthesis`

These don't overwrite your personal skills. They live alongside them.

### Two YAML registries you'll want

The team repo introduces two registries that don't exist in the PM OS but pay off fast:

- `product-development/feature-index.yaml` — every feature mapped to its PRD, RFC, plan, schema, dashboard
- `product-development/analytics/data-catalog.yaml` — every warehouse table with owner, refresh, upstream

You can start with the stub examples and fill in as you go.

### How the two systems connect

Your personal PM OS continues to work as before. When you open Claude Code in your personal PM OS folder, you get your personal context and skills.

When you open Claude Code in the Team OS folder, you get shared team context and shared skills.

The content overlap (competitive intel, PRDs, strategy docs) means both systems have the information. That's intentional. Your personal OS gives you a fast personal workspace; the Team OS gives the team shared access.

Over time you may do most of your work in the Team OS and use the personal OS less. That's fine — the personal OS was step one, the Team OS is step two.
