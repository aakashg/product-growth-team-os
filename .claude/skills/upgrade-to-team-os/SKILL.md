---
name: upgrade-to-team-os
description: Upgrade any personal OS (PM, engineering, design, analytics, ops) into a Team OS. Detects the existing architecture, classifies private vs shareable, sanitizes personal info out of skills and docs, scaffolds the team structure, and fills gaps from this Team OS template. Privacy-first, additive-only, never leaks personal info to the team.
---

# Upgrade to Team OS

Take any personal Claude Code OS and convert it into a shared Team OS — without leaking personal context, working preferences, or owner-specific voice into the shared repo.

The skill is **role-aware** (PM, eng, design, analytics, strategy/ops, multi-role), **privacy-first** (every file is private by default — must earn its way into the shared repo), and **additive-only** (the personal OS is never modified or deleted).

## When to Use

`/upgrade-to-team-os` — at any of these moments:

- A PM, engineer, designer, analyst, or any operator wants to share their personal Claude OS with their team
- A solo operator hires their first teammate and needs a shared knowledge base
- An existing personal OS (Aakash's PM OS, Hannah's open-source repo, a homegrown setup) needs to become a team repo
- You want to seed a new team repo from an existing operator's repo without dumping their personal voice into it

The skill works whether the personal OS has 5 files or 500. It works whether folder names match this Team OS's conventions or not.

## Core Principles

1. **Default private.** A file is *not* shared unless it has positive evidence to share (semantic folder name, frontmatter, content matches a team-relevant pattern). Inverse-classification is dangerous — it leaks by default.
2. **Two-pass on skills.** Personal skills are *copies*, not moves. The personal version is preserved untouched. The shared version is a sanitized fork.
3. **Voice neutralization.** Shared docs and skills are rewritten from "I prefer X" to "the team's convention is X" — owner-specific voice is removed.
4. **Adjacent output.** The team OS is created in a sibling directory (e.g., `../team-os/`), never overwriting the personal OS. The two systems coexist.
5. **Gap-fill from canon.** Anything the personal OS lacks (folders, navigation files, shared skills) is generated from this Team OS as the canonical template.
6. **Show before write.** Before copying anything sensitive, show the user the classification preview and the sanitization diff. Get explicit confirmation.

## Inputs (ask up front)

Ask these in one round of questions before doing any work:

1. **Path to personal OS** — absolute path (default: prompt the user)
2. **Output path for team OS** — default: sibling folder `{personal-parent}/team-os/`
3. **Owner identity** — name, email, GitHub handle, Slack ID. Used to *find* personal info to strip, not to embed.
4. **Team roster (optional)** — names + GitHub + Slack IDs of teammates. If skipped, leave placeholders.
5. **Primary role** — PM / Engineering / Design / Analytics / Strategy-Ops / Multi-role. The skill auto-detects this; ask only to confirm the detection.

If the user invoked `/upgrade-to-team-os` with no personal-OS path and the cwd looks like a personal OS (has `.claude/skills/` and at least one of `context-library/`, `sub-agents/`, `personal-context*.md`), default the source path to cwd and confirm.

## Step 1 — Detect Architecture

Walk the personal OS and produce a structural inventory. **Do not assume folder names match this Team OS.** Detect by content shape:

### Role Tells

| Role | Strong tells | Weak tells |
|------|-------------|------------|
| PM | `PRDs/`, `prd-*.md`, `roadmap*.md`, `customers/`, `customer-call-*`, `decision-log*` | `okrs*.md`, `competitive-*` |
| Engineering | `rfcs/`, `adrs/`, `bug-investigations/`, `plans/`, `incident-*`, `runbook*` | `architecture*.md`, `tech-debt*` |
| Design | `figma-*`, `design-system*`, `ux-research/`, `usability-*`, `wireframes/` | `accessibility*`, `brand*` |
| Analytics | `metrics/`, `queries/`, `schemas/`, `dashboards/`, `experiments/`, `*.sql` | `data-catalog*`, `investigations/` |
| Strategy / Ops | `strategy/`, `vision/`, `business-context/`, `processes/` | `market-*`, `gtm-*` |

A repo can match multiple roles (this is common — most senior operators do). Treat this as multi-role, not one-or-the-other.

### Inventory Output

Produce an internal map (don't show the full thing to the user — too noisy):

```
{personal-os-path}/
├── DETECTED ROLES: [PM, Analytics]
├── SKILL FILES: 14 (.claude/skills/...)
├── SUB-AGENTS: 7 (sub-agents/...)
├── CONTEXT DOCS: 23 (context-library/...)
├── TEMPLATES: 5 (templates/...)
├── ANALYTICS ASSETS: 0
├── CUSTOMER ARTIFACTS: 0
├── LOOSE FILES AT ROOT: 4 (CLAUDE.md, README.md, ...)
└── STRUCTURE STYLE: flat-skills | folder-skills | mixed
```

Show the user a one-paragraph summary of the detection ("Detected a PM-leaning personal OS with 14 skills, 7 sub-agents, 23 context docs, flat-skill convention. No analytics or customer artifacts."), and confirm before proceeding.

## Step 2 — Classify Every File

Three buckets: **shared** (copy and sanitize), **private** (leave in personal OS), **review** (ask the user).

### Default-Private Triggers (high confidence)

Any of the following → private, do not copy:

- Path contains: `personal/`, `private/`, `me/`, `inbox/`, `journal/`, `drafts/`, `working-preferences*`, `pm-background*`, `personal-context*`, `*-private*`, `daily/`, `weekly/`
- Filename matches owner identity (e.g., `aakash-style.md`, `{owner-name}-*.md`)
- Frontmatter has `visibility: private` or `personal: true`
- Content contains owner's full name + contact info (email, phone, Slack ID) in a header position (top of file, "About me" section)
- Sub-agents folder (`sub-agents/`) — these are *always* personal review perspectives. Never share.
- Voice files: anything titled `*writing-style*`, `*voice*`, `*tone*` that contains first-person language

### Shareable Triggers (high confidence)

Any of these → candidate for shared (still gets sanitized):

- Path contains: `templates/`, `playbooks/`, `competitive-*`, `business-info*`, `product-context*`, `metrics/`, `schemas/`, `dashboards/`, `processes/`
- Frontmatter has `visibility: shared` or `team: true`
- File is a template with bracketed placeholders (`[FILL IN]`, `{customer}`) — already authored to be reusable
- Files in `PRDs/`, `decisions/`, `rfcs/`, `plans/`, `customers/accounts/{customer}/` — domain artifacts the team needs

### Review Bucket (ask the user)

Anything else: skill files (always sanitize-then-share unless name suggests personal workflow), loose root docs, anything with mixed signals.

### Show the Classification Preview

Show a compact table to the user before copying anything:

```
SHARED (12 files):
  templates/launch-checklist.md
  context-library/business-info.md
  ... (full list)

PRIVATE — staying in personal OS (18 files):
  context-library/personal-context-pm-background.md
  sub-agents/skeptic.md
  ... (full list)

REVIEW — please confirm (5 files):
  context-library/competitive-intel/lovable.md  → share?
  templates/prd-draft.md → share as template?
  ... (full list)
```

Resolve the review pile in one round of yes/no questions. Default the suggestion based on best-guess; the user only has to override exceptions.

## Step 3 — Sanitize Skills (the high-leverage step)

Every skill marked for sharing gets a **personal copy** (untouched, in the source) and a **shared copy** (sanitized, in the team OS).

### What to Strip from Shared Skills

For each personal skill being shared:

1. **Owner identifiers**
   - Full name → role (`Aakash` → `the PM` or `the skill owner`)
   - Email, phone, Slack ID, GitHub handle → remove entirely
   - Personal anecdote sections ("When I shipped X at Y, I learned Z…") → either remove or convert to abstract example

2. **First-person voice**
   - "I prefer X" → "Use X" or "The team convention is X"
   - "My PRDs always include…" → "PRDs should include…"
   - "I never use the word 'leverage'" → "Avoid 'leverage'" (preserve the rule, drop the ownership)

3. **Company-specific names**
   - Replace concrete company names (other than your own product, when shared in `business-info`) with `{Company}` or `{Customer}` placeholders, *unless* the doc is explicitly about a competitor the team tracks.
   - Replace specific stakeholder names with role labels (`Bryan in support` → `Support lead`).

4. **Personal calendar / time references**
   - Strip "I do this every Friday at 4pm" type cadence — keep the *what*, drop the *when-by-me*.

5. **Personal taste markers**
   - "I love Cursor over VS Code" → cut entirely (not a team norm)
   - "I always run pytest with -xvs" → keep if it's a team norm, drop if it's just preference

### Show the Sanitization Diff

For each skill being sanitized, show a compact diff to the user before writing:

```
SKILL: prd-draft → prd-draft (shared)

  - I always start a PRD with the hypothesis statement.
  + Start every PRD with the hypothesis statement.

  - When I worked on Apollo I learned that...
  + (removed personal anecdote)

  - Email me at aakash@example.com if stuck.
  + (removed contact info)

[Accept / Edit / Skip this skill]
```

If the skill has heavy personal voice and would lose its essence after sanitization, **suggest skipping** rather than producing a hollowed-out shared version. A weak sanitized skill is worse than none.

### Skill-Name Collisions

If a personal skill has the same name as one of the Team OS canonical skills (`customer-call-summary`, `decision-log-entry`, `feature-launch-gate`, `freshness-check`, `weekly-synthesis`, `portfolio-pulse`):

1. Default to keeping the **Team OS canonical version** (better baseline, cross-team consistency).
2. Offer to namespace the personal version (`prd-draft-personal`) to keep both.
3. Never silently shadow — always show the collision and ask.

## Step 4 — Scaffold the Team Structure

Generate the canonical Team OS structure at the output path, mirroring this repo:

```
product-development/
├── feature-index.yaml                # YAML registry — features → artifacts
├── product/
│   ├── PRDs/{area}/
│   ├── customers/accounts/{customer}/calls/{summaries,transcripts}/
│   ├── competitive-research/competitors/{competitor}/
│   ├── strategy/{roadmaps,vision,business-context}/
│   ├── decisions/
│   ├── meetings/{standup,sprint-planning,team-bi-weekly}/{docs,transcripts,summaries}/
│   ├── workflows/
│   ├── launch-emails/
│   ├── sales-enablement/
│   ├── processes/
│   └── product-context/
├── engineering/
│   ├── plans/{area}/
│   ├── rfcs/{area}/
│   └── bug-investigations/{area}/
├── data-engineering/
│   ├── plans/{area}/
│   └── rfcs/{area}/
├── analytics/
│   ├── data-catalog.yaml
│   ├── metrics/{area}/
│   ├── queries/{area}/
│   ├── schemas/{area}/
│   ├── dashboards/{area}/
│   ├── experiments/{area}/
│   ├── investigations/{area}/
│   └── playbooks/
└── design/

team/
├── onboarding-guides/
└── retros/

.claude/
├── skills/{name}/SKILL.md            # canonical skills + sanitized personal skills
├── agents/onboarding.md
├── commands/customer-call.md
├── hooks/                            # session-start hook
└── settings.json                     # if applicable

CLAUDE.md                              # root navigation
README.md
LICENSE                                # CC BY-NC 4.0 — credit Hannah Stulberg + Aakash Gupta
```

### Role-Aware Trimming

For a single-role personal OS, prune folders the team doesn't need *yet* — but leave a stub so growth is easy:

- **PM-only**: keep `product/`, full `analytics/`, prune `engineering/` and `data-engineering/` to `CLAUDE.md` stubs explaining what would live there
- **Eng-only**: keep `engineering/`, `data-engineering/`, `analytics/`, prune `product/customers/`, `sales-enablement/`, `launch-emails/` to stubs
- **Design-only**: keep `product/PRDs/`, `design/`, customer artifacts; prune engineering subtrees to stubs
- **Analytics-only**: full `analytics/`, keep `product/decisions/`, prune engineering plans to stubs
- **Multi-role**: full structure, no pruning

Pruned folders still get a `CLAUDE.md` placeholder ("This folder is reserved for {what}. Populate when {role} joins the team.") so the structure is legible to future hires.

## Step 5 — Migrate Content (COPY only)

Every shared file gets copied to its team-OS destination, sanitized along the way. The mapping rules:

| Personal OS pattern | Team OS destination |
|---|---|
| `context-library/business-info*` | `product-development/product/strategy/business-context/business-info.md` |
| `context-library/competitive-intel/{name}.md` | `product-development/product/competitive-research/competitors/{name}/CLAUDE.md` (split flat file → per-competitor folder using the Team OS template) |
| `**/PRDs/**`, `prd-*.md`, `*-prd.md` | `product-development/product/PRDs/{detected-area}/` |
| `**/decisions/**`, `decision-*.md`, `adr-*.md` | `product-development/product/decisions/` (PM/strategy decisions) or `engineering/rfcs/` (architectural) — classify by content |
| `**/customers/**`, `customer-*.md` | `product-development/product/customers/accounts/{customer-slug}/` |
| `**/rfcs/**`, `**/adrs/**` | `engineering/rfcs/{area}/` |
| `**/plans/**`, engineering plans | `engineering/plans/{area}/` |
| `**/bug-investigations/**`, `incident-*` | `engineering/bug-investigations/{area}/` |
| `**/metrics/**`, `*-metrics.md` | `analytics/metrics/{area}/` |
| `**/queries/**`, `*.sql` | `analytics/queries/{area}/` (sanitize warehouse paths if they contain personal/account info) |
| `**/schemas/**` | `analytics/schemas/{area}/` |
| `templates/**` | Inline into the matching shared skill, or land in `product-development/product/processes/templates/` |

If a file doesn't match any pattern, ask the user where it belongs (offer the 3 most likely destinations).

### Area Detection

Most folders use `{area}` (e.g., `engineering/plans/billing/`, `analytics/metrics/onboarding/`). Detect area from filename or content (`prd-billing-flow.md` → `billing`). If unsure, default to `general/` and flag for the user to retag later.

## Step 6 — Add Canonical Shared Skills

Copy these from this Team OS template (or from any local Team OS reference) into `{output}/.claude/skills/`:

- `customer-call-summary` (folder + `examples/`)
- `decision-log-entry`
- `feature-launch-gate`
- `freshness-check`
- `weekly-synthesis`
- `portfolio-pulse`

Plus:
- `.claude/agents/onboarding.md`
- `.claude/commands/customer-call.md`
- `.claude/hooks/` for session-start context injection (if not already there)

If a personal skill collides with a canonical name, follow the collision rules in Step 3.

## Step 7 — Generate Navigation Files

For every folder created, write a `CLAUDE.md` with:
- One-line description of what lives in this folder
- "Read this when…" guidance
- File index (one line per file)
- Stays under ~200 tokens

Don't recursively enumerate the entire tree in every CLAUDE.md — each navigation file describes its own folder and links to children's CLAUDE.md files.

The root `CLAUDE.md` follows the format from this Team OS root:
- Team table (placeholder rows with the user's roster from Step 0 if provided)
- Slack channel table (placeholders if not provided)
- Doc index (every CLAUDE.md mapped)
- Three Rules
- Read-order routing for common queries

## Step 8 — Print Summary & Next Steps

```
✅ Team OS scaffolded at {output-path}.

Migrated:
- {N} shared docs (sanitized for personal info)
- {N} skills (personal + shared copies preserved separately)
- {N} canonical Team OS skills added
- {N} navigation files generated
- {N} placeholder folders for future team growth

Stayed personal (in {personal-os-path}):
- {N} private files
- {N} sub-agents
- {N} personal skills

Skipped (flagged for you to handle):
- {N} files where classification was ambiguous

Next steps:
1. Fill in the team roster in {output}/CLAUDE.md (3 lines)
2. Fill in the Slack channel table
3. Push to GitHub: cd {output} && git init && git add . && git commit -m "Initialize Team OS" && git push
4. Run /freshness-check after a week to catch anything stale
5. Run /feature-launch-gate before the next feature launch

Rollback if needed: rm -rf {output} (your personal OS at {personal-os-path} is untouched).
```

## Failure Modes to Watch

- **The user runs this in their personal OS root and we write the team OS into a subfolder of it.** Bad — now `git status` in the personal OS sees a giant team-OS subtree. Always default to a sibling directory.
- **The user has frontmatter `visibility: shared` on a file that contains their phone number.** Frontmatter says share, content says don't. Trust the content rule and ask.
- **Skills sanitization removes 80% of a skill, leaving a hollow husk.** Suggest skipping that skill — the personal version stays in personal OS, no shared version is created.
- **The user has a 200-skill personal OS.** Don't show 200 diffs. Batch by category (templates, voice, workflow), and show one diff per category as a representative example.
- **The personal OS uses non-English language for filenames.** Detection rules above are English-keyword-biased. Fall back to asking the user about anything not classified after the heuristic pass.
- **The personal OS isn't a git repo.** Tell the user to `git init && git add . && git commit -m "Pre-Team-OS state"` in the personal OS *first*, so they have a rollback point even though we never modify it.

## Rules

1. **Never delete or modify a file in the personal OS.** Read-only. Always.
2. **Never write to the team OS path until the user has confirmed the classification preview.**
3. **Never silently overwrite** in the team OS. If a file exists, skip it and report.
4. **Always show the sanitization diff for the first 3 skills**, then offer to apply the rest in batch with the same rules.
5. **Always ask for the team roster before generating the root CLAUDE.md** — placeholders are fine if the user doesn't have it yet, but ask.
6. **Use the SKILL.md folder convention** (`.claude/skills/{name}/SKILL.md` with YAML frontmatter), even if the personal OS uses flat skills.
7. **Default to a sibling output directory.** Never write the team OS as a subfolder of the personal OS.
8. **Privacy beats completeness.** When in doubt, leave a file in the personal OS. The user can always add it later.

## Rollback

Because the team OS is a fresh adjacent directory, rollback is just:

```sh
rm -rf {output-path}
```

The personal OS is untouched and verifiable with `git status` (clean working tree).

## See Also

- [pm-os-migration.md](../../../pm-os-migration.md) — narrative migration guide for the original Aakash PM OS path, including the two known landmines
- [MINIMAL-SETUP.md](../../../MINIMAL-SETUP.md) — the "delete what you don't use" path for small teams after upgrade
- `examples/example-pm-os-detection.md` — worked example showing detection → classification → sanitization on a small PM OS
