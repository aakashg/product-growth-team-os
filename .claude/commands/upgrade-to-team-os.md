# Upgrade to Team OS

Convert any personal Claude Code OS (PM, engineering, design, analytics, ops, multi-role) into a Team OS — privacy-first, additive-only, never leaking personal info to the team.

This command is a thin entry point. The full logic lives in the `upgrade-to-team-os` skill at `.claude/skills/upgrade-to-team-os/SKILL.md`. **Invoke that skill** and follow its 8-step flow exactly.

## When to Use

`/upgrade-to-team-os` — at any of these moments:

- You have a personal Claude OS (any role) and want to share a sanitized, team-ready version
- You're a solo operator hiring your first teammate
- You have Aakash's PM OS specifically and want the fast path (this command's original purpose, still works)

## What the Skill Does (Summary)

1. **Detect** the personal OS architecture and infer the role(s) — PM, eng, design, analytics, strategy/ops, or multi-role
2. **Classify** every file as shared, private, or review (default: private)
3. **Sanitize** skills marked for sharing — strip owner names, emails, Slack IDs, first-person voice, personal anecdotes; produce a personal copy + a shared copy
4. **Scaffold** the canonical Team OS structure at a sibling output path (never overwrite the personal OS)
5. **Migrate** shared content with role-aware mapping (PRDs, decisions, customers, competitive intel, metrics, queries, schemas, RFCs, plans)
6. **Add canonical Team OS skills** — customer-call-summary, decision-log-entry, feature-launch-gate, freshness-check, weekly-synthesis, portfolio-pulse — handling name collisions explicitly
7. **Generate navigation files** — root CLAUDE.md + nested CLAUDE.md per folder
8. **Print summary** with rollback instructions (`rm -rf {output}` — personal OS is untouched)

## Privacy-First Defaults

- A file is private unless it earns its way into the shared repo (semantic folder, frontmatter, content shape).
- Sub-agents are *always* personal. Working preferences, personal context, writing-style files are *always* personal.
- Skill sanitization shows a diff before writing. If sanitization would hollow a skill out, suggest skipping rather than producing a husk.
- Output goes to a sibling directory, never inside the personal OS.

## The Two Original Landmines (Still Apply)

If you're upgrading Aakash's PM OS specifically, also read [pm-os-migration.md](../../pm-os-migration.md) for:

- **Skill-name collisions** — personal skills with the same name as canonical Team OS skills (the skill detects and resolves these explicitly)
- **Competitive-research restructure** — flat `competitive-intel/competitor-x.md` files split into per-competitor folders following the Team OS template

## Rules

1. Never delete or modify a file in the personal OS.
2. Never write to the team OS until the user has confirmed the classification preview.
3. Use the SKILL.md folder convention for all skills.
4. Default the output path to a sibling directory of the personal OS.
5. Privacy beats completeness. When in doubt, leave it personal.

## See Also

- `.claude/skills/upgrade-to-team-os/SKILL.md` — full skill (detection, classification, sanitization rules)
- `.claude/skills/upgrade-to-team-os/examples/example-pm-os-detection.md` — worked example on a 47-file PM OS
- [pm-os-migration.md](../../pm-os-migration.md) — narrative migration guide
- [MINIMAL-SETUP.md](../../MINIMAL-SETUP.md) — the "delete what you don't use" path post-upgrade
