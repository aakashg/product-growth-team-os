# Worked Example — Upgrading a PM Personal OS

A concrete walkthrough of running `/upgrade-to-team-os` on a typical PM personal OS. Use this to calibrate expectations on what good detection, classification, and sanitization look like.

## Source: A 47-File PM Personal OS

```
/Users/devon/Downloads/pm-os/
├── CLAUDE.md
├── README.md
├── context-library/
│   ├── business-info.md
│   ├── personal-context-pm-background.md
│   ├── personal-context-working-preferences.md
│   ├── product-context.md
│   ├── writing-style-devon.md
│   └── competitive-intel/
│       ├── lovable.md
│       ├── replit.md
│       └── cursor.md
├── sub-agents/
│   ├── engineer.md
│   ├── designer.md
│   ├── executive.md
│   ├── skeptic.md
│   ├── customer.md
│   ├── analyst.md
│   └── strategist.md
├── templates/
│   ├── prd-template.md
│   ├── launch-checklist.md
│   ├── decision-log-template.md
│   └── customer-call-template.md
├── .claude/skills/
│   ├── prd-draft.md
│   ├── customer-call-summary.md
│   ├── competitive-research-summary.md
│   ├── decision-log-entry.md
│   ├── status-update.md
│   └── feature-spec.md
├── PRDs/
│   ├── billing-redesign-prd.md
│   ├── onboarding-flow-prd.md
│   └── ai-search-prd.md
├── decisions/
│   ├── 2026-02-vendor-choice.md
│   └── 2026-03-pricing-tiers.md
└── customers/
    ├── acme-corp/
    │   ├── account-context.md
    │   └── 2026-04-15-call.md
    └── globex/
        └── 2026-04-22-call.md
```

## Step 1 — Detection

The skill walks the tree and produces:

```
DETECTED ROLES: [PM]  (high confidence: PRDs, decisions, customers, competitive-intel)
                Weak signal for Analytics: 0 metrics/queries/dashboards.

SKILL FILES: 6 (.claude/skills/, flat-skill convention — needs migration to folder convention)
SUB-AGENTS: 7 (sub-agents/ — always private)
CONTEXT DOCS: 8 (context-library/)
TEMPLATES: 4
PRDS: 3
DECISIONS: 2
CUSTOMERS: 2 accounts, 2 calls
LOOSE FILES AT ROOT: 2 (CLAUDE.md, README.md)
```

Confirm with the user: "Detected a PM personal OS, flat-skill convention, 6 skills, 7 sub-agents, 3 PRDs, 2 customers tracked. Output team OS to `/Users/devon/Downloads/team-os/`?"

## Step 2 — Classification

```
SHARED (15):
  context-library/business-info.md
  context-library/product-context.md
  context-library/competitive-intel/lovable.md
  context-library/competitive-intel/replit.md
  context-library/competitive-intel/cursor.md
  templates/prd-template.md
  templates/launch-checklist.md
  templates/decision-log-template.md
  templates/customer-call-template.md
  PRDs/billing-redesign-prd.md
  PRDs/onboarding-flow-prd.md
  PRDs/ai-search-prd.md
  decisions/2026-02-vendor-choice.md
  decisions/2026-03-pricing-tiers.md
  customers/acme-corp/account-context.md
  customers/acme-corp/2026-04-15-call.md
  customers/globex/2026-04-22-call.md

PRIVATE — staying in personal OS (10):
  context-library/personal-context-pm-background.md
  context-library/personal-context-working-preferences.md
  context-library/writing-style-devon.md
  sub-agents/* (all 7 — always private)

REVIEW — please confirm (6 skills + 2 root docs):
  .claude/skills/prd-draft.md → sanitize and share?
  .claude/skills/customer-call-summary.md → COLLISION with canonical Team OS skill — keep canonical, namespace personal as customer-call-summary-personal?
  .claude/skills/competitive-research-summary.md → sanitize and share?
  .claude/skills/decision-log-entry.md → COLLISION — keep canonical?
  .claude/skills/status-update.md → looks personal-workflow (heavy first-person); recommend skip
  .claude/skills/feature-spec.md → sanitize and share?
  CLAUDE.md → root nav file: regenerate from Team OS template (don't share personal version)
  README.md → personal repo intro; do not share
```

The user resolves the review pile in one round. Default suggestions are usually right; the user just confirms or overrides.

## Step 3 — Sanitization (skill: `prd-draft`)

Before:

```markdown
---
name: prd-draft
description: Draft a PRD using my PM OS template.
---

# PRD Draft

I always start a PRD with the hypothesis statement. When I worked on the
Apollo growth team, I learned that PRDs without a testable hypothesis are
just feature lists.

My PRDs always include:
- Hypothesis (one sentence, testable)
- Problem (who has it, with data)
- Strategic fit
- Solution
- Success metrics
- Non-goals

Email me at devon@example.com if you get stuck. I usually do PRD reviews
on Friday mornings — DM me on Slack.
```

After (shown as a diff to the user):

```markdown
---
name: prd-draft
description: Draft a PRD covering hypothesis, problem, strategic fit, solution, success metrics, and non-goals.
---

# PRD Draft

Start every PRD with a testable hypothesis statement. PRDs without a
testable hypothesis become feature lists.

PRDs should include:
- Hypothesis (one sentence, testable)
- Problem (who has it, with data)
- Strategic fit
- Solution
- Success metrics
- Non-goals
```

What got removed:
- Personal anecdote (`When I worked on the Apollo growth team…`) — abstracted to the lesson
- First-person voice (`I always`, `My PRDs`) — converted to imperative
- Contact info (email + Slack cadence) — removed entirely
- "my PM OS template" reference in description — generalized

The user accepts the diff. Skill lands at `team-os/.claude/skills/prd-draft/SKILL.md`. Personal version untouched at `pm-os/.claude/skills/prd-draft.md`.

## Step 4 — Output

The team OS lands at `/Users/devon/Downloads/team-os/` with:

- Full canonical structure (product-development, team, .claude)
- Sanitized PRDs in `product-development/product/PRDs/{billing,onboarding,ai-search}/`
- Decisions in `product-development/product/decisions/`
- Customers reorganized into `accounts/{acme-corp,globex}/calls/summaries/`
- Competitive intel split from flat files into per-competitor folders (lovable, replit, cursor)
- 4 sanitized personal skills + 6 canonical Team OS skills
- Navigation CLAUDE.md in every folder
- Pruned engineering/data-engineering subtrees with stub CLAUDE.mds
- Root CLAUDE.md with Devon's roster (he supplied 3 names) and Slack channel placeholders

Devon's personal OS at `/Users/devon/Downloads/pm-os/` is bit-for-bit identical to before — `git status` is clean.

## Final Summary Printed

```
✅ Team OS scaffolded at /Users/devon/Downloads/team-os/.

Migrated:
- 17 shared docs (sanitized for personal info)
- 4 skills (sanitized; personal copies preserved at pm-os/.claude/skills/)
- 6 canonical Team OS skills added
- 31 navigation CLAUDE.md files generated
- 9 placeholder folders (engineering, data-engineering subtrees)

Stayed personal (in /Users/devon/Downloads/pm-os/):
- 3 personal context files
- 7 sub-agents
- 1 personal skill (status-update — too personal-workflow to sanitize cleanly)
- 2 collision skills, namespaced as -personal

Skipped:
- 0 files (everything classified)

Next steps:
1. Fill in 2 more rows in team-os/CLAUDE.md (Slack channels)
2. cd /Users/devon/Downloads/team-os && git init && git add . && git commit -m "Initialize Team OS"
3. Push to GitHub
4. Run /freshness-check after a week
5. Run /feature-launch-gate before the next launch
```

## Why This Example Matters

A real upgrade keeps the personal OS as the operator's fast workspace and produces a team OS that is *immediately legible* to a teammate who has never seen Devon's setup. The teammate doesn't read Devon's working preferences, his PM background, his writing-style notes, or his personal anecdotes inside skills. They get the team's conventions, the team's PRDs, the team's decisions, and skills that read as team norms — not as Devon's voice.

That separation is the whole point.
