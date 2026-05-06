# PM OS → Team OS Migration Guide

If you already have Aakash's PM Operating System, this guide explains what moves to the shared team repo, what stays personal, and how to handle the two real landmines (skill-name collisions and competitive-research restructuring).

## Before You Run Anything

**Create your own rollback** — the upgrade command is additive-only, but better safe than sorry:

```sh
cd /path/to/your-pm-os
git status                          # confirm clean working tree
git tag pre-team-os-upgrade         # rollback marker
git push origin --tags              # if your PM OS has a remote
```

If your PM OS isn't a git repo yet:

```sh
cd /path/to/your-pm-os
git init && git add . && git commit -m "Pre-Team-OS state"
git tag pre-team-os-upgrade
```

To roll back later: `git reset --hard pre-team-os-upgrade && git clean -fd`.

## The Fast Way

Run `/upgrade-to-team-os` in Claude Code. It's additive-only — never deletes or overwrites — and skips any file that already exists. Read the rest of this doc first to understand the two landmines.

## Landmine 1: Skill-Name Collisions

Your `.claude/skills/` is shared between personal and team skills. If you have a personal skill with the same name as one of the team skills (e.g., personal `customer-call-summary`), the upgrade command sees the existing folder and **skips** rather than overwriting.

**That sounds safe but produces a subtle problem.** When Claude Code loads skills, it picks the one that matches the name. Your personal version stays in place; the team version never lands. Future you assumes the team version is in effect. It isn't.

**Fix before upgrade:**

1. List your existing skills: `ls .claude/skills/`
2. For any name in this list — `customer-call-summary`, `decision-log-entry`, `feature-launch-gate`, `freshness-check`, `weekly-synthesis`, `portfolio-pulse` — rename your personal version: `mv .claude/skills/customer-call-summary .claude/skills/customer-call-summary-personal/`
3. Update the `name:` field in the frontmatter to match (`name: customer-call-summary-personal`)
4. Now run `/upgrade-to-team-os`

If you want to *replace* the team skill with your personal version permanently, do step 2/3 in reverse — rename the team skill after install. But honestly: the team skills are a lower bar than your personal ones; consider keeping both with namespaced names so cross-team consistency holds.

## Landmine 2: Competitive Research Restructure

The new Team OS uses per-competitor folders with three files each — not flat markdown:

```
product/competitive-research/competitors/
├── {competitor-a}/
│   ├── CLAUDE.md       # one-pager: strengths, weaknesses, segment
│   ├── tldr.md         # full teardown
│   └── pricing.md      # pricing tiers and contract terms
└── competitive-matrix.md
```

If your PM OS has flat `competitive-intel/competitor-x.md` files, the upgrade command will copy them into `competitive-research/competitors/`. **They will land flat in the wrong place** — outside the per-competitor folder convention — and your `competitive-matrix.md` won't cross-reference them correctly.

**Fix after upgrade** (one-time, ~10 min per competitor):

1. For each `competitor-x.md` you migrated:
   - `mkdir competitive-research/competitors/competitor-x/`
   - Move the file's content: split into `CLAUDE.md` (one-pager summary), `tldr.md` (full teardown), `pricing.md` (pricing only)
   - Use `competitive-research/competitors/example-competitor/` as the template
2. Update `competitive-matrix.md` to point at the new `tldr.md` paths
3. Delete the now-empty flat file

If you have only 2-3 competitors, do it manually. For more, ask Claude in plain English: *"Restructure competitive-research/competitors/lovable.md into a per-competitor folder following the example-competitor template."*

## What MOVES to the Team Repo (COPY, don't delete originals)

| PM OS Location | Team OS Destination |
|---|---|
| `context-library/business-info.md` | `product-development/product/strategy/business-context/business-info.md` |
| `context-library/competitive-intel/*.md` | `product-development/product/competitive-research/competitors/{competitor}/` (then restructure per landmine 2) |
| Existing PRDs | `product-development/product/PRDs/{area}/{slug}-prd.md` |
| Existing strategy docs | `product-development/product/strategy/roadmaps/`, `strategy/vision/`, or `strategy/business-context/` |
| `templates/launch-checklist.md` | Already covered by `/feature-launch-gate` skill — review and merge any team-specific items |

## What STAYS Personal (do NOT copy)

| PM OS File | Why It Stays Personal |
|---|---|
| `sub-agents/` (all 7 reviewers) | These are YOUR review perspectives. Others can build their own. |
| `context-library/personal-context-pm-background.md` | Your personal career context |
| `context-library/personal-context-working-preferences.md` | Your personal preferences |
| Personal writing style files | Your voice, not the team's |
| Personal skills like `/prd-draft`, `/competitive-research-summary` | Personal workflow stays personal — but namespace them per landmine 1 if names collide with team skills |

## What Gets ADDED in the Team Repo

The 6 shared skills bundled with the Team OS starter kit, all using the **SKILL.md folder convention** (`.claude/skills/{name}/SKILL.md` with YAML frontmatter):

- `customer-call-summary` (paired with the `/customer-call` command — process orchestration)
- `decision-log-entry`
- `feature-launch-gate`
- `freshness-check`
- `weekly-synthesis`
- `portfolio-pulse` (exec-grade rollup across accounts and teams)

Plus:
- `.claude/agents/onboarding.md` — interactive onboarding agent for new hires
- `.claude/commands/customer-call.md` — multi-step orchestrator that invokes the customer-call-summary skill

## SKILL.md Folder Convention (vs. Flat Skills)

If your personal skills are still flat `.md` files (`.claude/skills/prd-draft.md`), they continue to work, but you're missing two affordances the team skills use:

- **YAML frontmatter** with `name:` and `description:` — makes the skill discoverable in Claude Code's skill picker with a hint about when to use it
- **`examples/` subfolder** — ships a worked example alongside the skill, so the level of detail is concrete

Migration is optional. To upgrade a flat skill:

```sh
mv .claude/skills/prd-draft.md .claude/skills/prd-draft/SKILL.md
```

Then add frontmatter at the top:

```yaml
---
name: prd-draft
description: Draft a PRD using my PM OS template (hypothesis, problem, strategic fit, solution, metrics, non-goals).
---
```

Optionally add `.claude/skills/prd-draft/examples/example-prd.md`.

## Two Registries Worth Adopting

The Team OS introduces two YAML registries that don't exist in the PM OS but pay off fast:

- **`product-development/feature-index.yaml`** — every feature mapped to its PRD, RFC, plan, schema, dashboard. Check this first when looking up artifacts for a specific feature.
- **`product-development/analytics/data-catalog.yaml`** — every warehouse table with owner, refresh, upstream, grain, partition_key, last_validated.

You can start with the stub examples and fill in as you go.

## How the Two Systems Connect

Your personal PM OS continues to work as before. When you open Claude Code in your personal PM OS folder, you get personal context and skills.

When you open Claude Code in the Team OS folder, you get shared team context and shared skills.

The content overlap (competitive intel, PRDs, strategy docs) means both systems have the information. That's intentional. Your personal OS is your fast personal workspace; the Team OS gives the team shared access.

Over time you may do most of your work in the Team OS and use the personal OS less. That's fine — the personal OS was step one, the Team OS is step two.

## Rollback

The upgrade command is additive-only, so worst case:

```sh
cd /path/to/team-os
git reset --hard pre-team-os-upgrade
git clean -fd
```

This requires the `pre-team-os-upgrade` tag from the prep step at the top. If you didn't tag, fall back to:

```sh
git checkout -- .
git clean -fd
```

— but only run this if you're confident there's no uncommitted personal work to lose. Take a backup folder first: `cp -r /path/to/pm-os /tmp/pm-os-backup-$(date +%Y%m%d)`.
