# Upgrade to Team OS

Upgrades an existing Aakash PM Operating System into a Team OS by scaffolding the shared team structure around the personal setup. Never overwrites or deletes existing PM OS files.

## When to Use

Run once: `/upgrade-to-team-os`

Only use this if you already have Aakash's PM OS installed (with `context-library/`, `.claude/skills/`, `sub-agents/`, `templates/` folders). If you don't have a PM OS, just use the Team OS starter kit directly.

## What It Does

### Step 1: Create Team Structure

Scaffold these folders alongside the existing PM OS:

```
product-development/
├── feature-index.yaml                               (with stub examples)
├── product/
│   ├── PRDs/{area}/
│   ├── customers/accounts/{customer}/calls/{summaries,transcripts}/
│   ├── competitive-research/competitors/{competitor}/
│   ├── strategy/{roadmaps,vision,business-context}/
│   ├── decisions/
│   ├── meetings/{standup,sprint-planning,team-bi-weekly}/{docs,transcripts,summaries}/
│   ├── workflows/bi-weekly-update/{reference,output}/
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
│   ├── data-catalog.yaml                            (with stub examples)
│   ├── metrics/{area}/
│   ├── queries/{area}/
│   ├── schemas/{area}/
│   ├── dashboards/{area}/
│   ├── experiments/{area}/
│   ├── investigations/{area}/
│   └── playbooks/
└── design/

team/
├── onboarding-guides/                               (general + 6 role-specific files)
└── retros/
```

### Step 2: Migrate Context (COPY, don't move)

- `context-library/business-info` → `product-development/product/strategy/business-context/business-info.md`
- `context-library/competitive-intel/*` → `product-development/product/competitive-research/competitors/{competitor}/`
- Existing PRDs → `product-development/product/PRDs/{area}/{slug}-prd.md`
- Existing strategy docs → split between `strategy/roadmaps/`, `strategy/vision/`, `strategy/business-context/`

Leave all original PM OS files in place. Nothing gets deleted.

### Step 3: Add Shared Skills (folder + frontmatter convention)

Copy these 5 shared skills into `.claude/skills/{name}/SKILL.md` — they do NOT overwrite any existing personal skills:

- `customer-call-summary` (with `examples/example-2026-01-27.md`)
- `decision-log-entry`
- `feature-launch-gate`
- `freshness-check`
- `weekly-synthesis`

Also copy:
- `.claude/agents/onboarding.md` — orchestrator for new hires
- `.claude/commands/customer-call.md` — multi-step workflow that invokes the customer-call-summary skill

### Step 4: Create Navigation Files

Generate a CLAUDE.md navigation file for every new folder. Each:
- Lists files in the folder with a one-line description
- Notes when each file should be read
- Stays under ~200 tokens

### Step 5: Create Root Team CLAUDE.md

Generate the root CLAUDE.md with Hannah's table-style format:
- Team table (Name, GitHub, Linear/Jira/Asana ID, Slack ID — placeholder rows for the user to fill in)
- Slack channel table (placeholder rows)
- Doc index pointing to every CLAUDE.md (including PM OS folders if you want to surface them in the same map)
- Three Rules
- Where Different Roles Check In Work table

### Step 6: Add Session Start Hook

Create `.claude/hooks/session-start.md` with the standard team-context injection template.

### Step 7: Add Onboarding Guides

Copy `onboarding-general.md`, role-specific guides (product, engineering, design, analytics, data-engineering, strategy-ops), and `github-101.md` into `team/onboarding-guides/`.

## What Stays Personal (NOT moved to team repo)

- `sub-agents/` — your 7 reviewer perspectives are personal
- `context-library/personal-context-pm-background.md`
- `context-library/personal-context-working-preferences.md`
- Any personal writing style files
- Personal skills not relevant to the team (`/prd-draft`, etc.)

## Output

After running, print:

```
✅ Team OS scaffolded successfully.

Created:
- {N} new folders
- {N} CLAUDE.md navigation files
- 5 shared skills (folder convention with SKILL.md + frontmatter)
- 1 agent + 1 command (.claude/agents/onboarding.md, .claude/commands/customer-call.md)
- 2 YAML registries (feature-index.yaml, analytics/data-catalog.yaml)
- 7 onboarding guides (general + 6 role-specific)
- Session start hook
- LICENSE (CC BY-NC 4.0, attributing Hannah Stulberg's source repo)

Your personal PM OS files are untouched.

Next steps:
1. Fill in the team roster in CLAUDE.md
2. Fill in the Slack channel table
3. Replace product-area placeholders (currently "billing/") with your actual areas
4. Push to GitHub: git add . && git commit -m "Initialize Team OS" && git push
5. Share the repo URL with one teammate; show them three queries from the demo script
```

## Rules

1. NEVER delete or overwrite existing PM OS files. Only ADD new files.
2. COPY, don't move. Original PM OS structure stays intact.
3. If a file already exists at the destination, skip it and note: *"Skipped {file} — already exists"*
4. Ask the user for their team roster before generating the root CLAUDE.md.
5. Before starting, verify the PM OS structure exists by checking for `context-library/` and `.claude/skills/`. If not found: *"This doesn't look like a PM OS. Use the Team OS starter kit directly instead of the upgrade command."*
6. Use the SKILL.md folder convention (`.claude/skills/{name}/SKILL.md` with YAML frontmatter), not flat `.md` files.

## Rollback

If something goes wrong:

```
git checkout -- .
git clean -fd
```

This removes all uncommitted new files and reverts changes. Original PM OS is untouched because we only ADD files, never modify existing ones.

Tell the user about this rollback option in the output message.
