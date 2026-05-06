# PM OS → Team OS Migration Guide

If you already have Aakash's PM Operating System, this guide explains what moves to the shared team repo and what stays personal.

## The Fast Way

Run `/upgrade-to-team-os` in Claude Code. It handles everything below automatically in ~2 minutes.

## The Manual Way

### What MOVES to the team repo (copy, don't delete originals)

| PM OS Location | Team OS Destination |
|---|---|
| context-library/business-info.md | product-development/product/CLAUDE.md (as key context) |
| context-library/competitive intel files | product-development/product/competitive-research/ |
| Any PRDs you've written | product-development/product/PRDs/ |
| Any strategy docs | product-development/product/strategy/ |
| templates/launch-checklist.md | team/ (if team-relevant) |

### What STAYS personal (do NOT copy to team repo)

| PM OS File | Why It Stays Personal |
|---|---|
| sub-agents/ (all 7 reviewers) | These are YOUR review perspectives. Others can build their own. |
| context-library/personal-context-pm-background.md | Your personal career context |
| context-library/personal-context-working-preferences.md | Your personal preferences |
| Any personal writing style files | Your voice, not the team's |
| .claude/skills/ (personal skills like /prd-draft) | Personal workflow skills stay personal |

### What gets SHARED (copy to team repo .claude/skills/)

The 5 new shared skills in the Team OS starter kit:
- customer-call-summary.md
- decision-log-entry.md
- feature-launch-gate.md
- freshness-check.md
- weekly-synthesis.md

These don't overwrite your personal skills. They live alongside them.

### How the two systems connect

Your personal PM OS continues to work as before. When you open Claude Code in your personal PM OS folder, you get your personal context and skills.

When you open Claude Code in the Team OS folder, you get the shared team context and shared skills.

The content overlap (competitive intel, PRDs, strategy docs) means both systems have the information. That's intentional. Your personal OS gives you a fast personal workspace. The Team OS gives the team shared access.

Over time, you may find that you do most of your work in the Team OS and use the personal OS less. That's fine. The personal OS was step one. The Team OS is step two.
