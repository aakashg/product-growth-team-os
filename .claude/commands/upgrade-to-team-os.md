# Upgrade to Team OS

Upgrades an existing PM Operating System (Aakash's PM OS) into a Team OS by scaffolding the shared team structure around the personal setup.

## When to Use

Run once: /upgrade-to-team-os

Only use this if you already have Aakash's PM OS installed (with context-library/, .claude/skills/, sub-agents/, templates/ folders).

## What It Does

### Step 1: Create Team Structure
Create these new folders alongside the existing PM OS:
- product-development/product/customers/
- product-development/product/competitive-research/
- product-development/product/PRDs/
- product-development/product/strategy/
- product-development/product/decisions/
- product-development/analytics/ (with billing/ and onboarding/ subfolders, each with metrics.md, queries/, schemas/, playbooks/)
- product-development/engineering/bugs/
- product-development/engineering/rfcs/
- team/onboarding/
- team/retros/

### Step 2: Migrate Context
- COPY (don't move) context-library/business-info → product-development/product/CLAUDE.md (as key context section)
- COPY context-library/competitive-intel files → product-development/product/competitive-research/
- COPY any existing PRDs → product-development/product/PRDs/
- COPY any existing strategy docs → product-development/product/strategy/
- Leave ALL original PM OS files in place. Nothing gets deleted.

### Step 3: Add Shared Skills
Copy these 5 shared skills into .claude/skills/ (they do NOT overwrite any existing personal skills):
- customer-call-summary.md
- decision-log-entry.md
- feature-launch-gate.md
- freshness-check.md
- weekly-synthesis.md

### Step 4: Create Navigation Files
Generate a CLAUDE.md navigation file for every new folder. Each one should:
- List the files in the folder with a one-line description
- Note when each file should be read
- Be under 200 tokens

### Step 5: Create Root Team CLAUDE.md
Generate the root CLAUDE.md with:
- Doc index covering ALL folders (both existing PM OS and new team folders)
- Placeholder team roster table (ask user to fill in)
- Placeholder channel map (ask user to fill in)

### Step 6: Add Session Start Hook
Create .claude/hooks/session-start.md with the standard team context injection template.

### Step 7: Create Onboarding
Copy the new-member-guide.md and github-101.md into team/onboarding/.

## What Stays Personal (NOT moved to team repo)

- sub-agents/ — Your 7 reviewer perspectives are personal
- context-library/personal-context-pm-background.md — Personal career context
- context-library/personal-context-working-preferences.md — Personal preferences
- Any personal writing style files
- Any personal skills that aren't relevant to the team

## Output

After running, print:

```
✅ Team OS scaffolded successfully.

Created:
- [N] new folders
- [N] CLAUDE.md navigation files
- 5 shared skills added to .claude/skills/
- Session start hook created
- Onboarding guides created

Your personal PM OS files are untouched.

Next steps:
1. Fill in the team roster in CLAUDE.md (names, Slack IDs, GitHub handles)
2. Fill in the channel map in CLAUDE.md
3. Push to GitHub: git add . && git commit -m "Initialize Team OS" && git push
4. Share the repo URL with one teammate
```

## Rules

1. NEVER delete or overwrite existing PM OS files. Only ADD new files.
2. COPY, don't move. The original PM OS structure stays intact.
3. If a file already exists at the destination, skip it and note: "Skipped [file] — already exists"
4. Ask the user for their team roster before generating the root CLAUDE.md. Use the ask-user-question tool.
5. Before starting, verify the PM OS structure exists by checking for context-library/ and .claude/skills/. If not found, tell the user: "This doesn't look like a PM OS. Use the Team OS starter kit directly instead of the upgrade command."

## Rollback

If something goes wrong, the user can undo the entire upgrade:

```
git checkout -- .
git clean -fd
```

This removes all uncommitted new files and reverts changes. Original PM OS is untouched because we only ADD files, never modify existing ones.

Tell the user about this rollback option in the output message.
