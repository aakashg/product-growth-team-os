---
name: upgrade-to-team-os
description: Upgrade any personal OS (PM, engineering, design, analytics, ops, exec, multi-role) into a Team OS. Auto-detects architecture, locale, and maturity; classifies private vs shareable with regex+content gates; sanitizes personal info out of skills and docs; scaffolds the team structure; fills gaps from this Team OS template; validates with programmatic PII / pronoun / coverage gates before declaring success. Privacy-first, additive-only, idempotent on re-runs, never leaks personal info to the team.
---

# Upgrade to Team OS

Take any personal Claude Code OS and convert it into a shared Team OS — without leaking personal context, working preferences, owner-specific voice, comp/equity discussions, customer cohort identifiers, or infrastructure credentials into the shared repo.

The skill is **role-aware** (PM, eng, design, analytics, strategy/ops, exec, multi-role), **locale-aware** (English keywords + content-shape fallback for non-English repos), **maturity-aware** (full-scaffold for fresh repos, idempotent-augment for already-canonical repos), **privacy-first** (every file is private by default — must earn its way in), **validation-gated** (programmatic checks block success on any leakage), and **additive-only** (the personal OS is never modified).

## When to Use

`/upgrade-to-team-os` — at any of these moments:

- A PM, engineer, designer, analyst, exec, or any operator wants to share their personal Claude OS with their team
- A solo operator hires their first teammate and needs a shared knowledge base
- An existing personal OS (Aakash's PM OS, Hannah's open-source repo, a homegrown setup, an already-canonical Team OS used solo) needs to become a team repo
- You want to seed a new team repo from an existing operator's repo without dumping their personal voice into it

The skill works whether the personal OS has 5 files or 500. It works whether folder names are English or not. It works whether the repo already follows canonical structure or has zero conventions.

## Core Principles

1. **Default private.** A file is *not* shared unless it has positive evidence to share (semantic folder name, frontmatter, or content matches a team-relevant pattern AND passes the PII content-pattern check). Inverse-classification is dangerous — it leaks by default.
2. **Two-pass on skills.** Personal skills are *copies*, not moves. Personal version untouched. Shared version is a sanitized fork.
3. **Voice neutralization.** Shared docs and skills are rewritten from "I prefer X" to "the team's convention is X" — owner-specific voice removed, but the *insight* is preserved (don't kill the lesson when stripping the anecdote).
4. **Adjacent output.** Team OS lives in a sibling directory (`{personal-parent}/team-os/`), never inside the personal OS, never overwriting it.
5. **Gap-fill from canon.** Anything the personal OS lacks (folders, navigation files, shared skills) is generated from this Team OS as the canonical template — full content, not stubs.
6. **Show before write.** Classification preview + sanitization diffs require explicit user confirmation. Show before copying anything.
7. **Validate before declaring done.** Programmatic gates (PII grep, pronoun grep, CLAUDE.md coverage, canonical-must-exist) run after every transformation. A failed gate blocks the success message — fix and re-validate.
8. **Auto-detect, don't ask.** Inferred from filesystem and MCP servers: role(s), output path, structure style, skill names, area names, locale, maturity, team roster (when MCP exposes it). Asked from user: only the irreducibly-ambiguous classifications.

---

## Step 0 — Pre-Detection (auto-route execution mode)

Before asking any input questions, walk the source path and run these four scans. Each emits a routing decision the rest of the skill consumes.

### 0.1 Maturity Scan

Detect whether the source is already canonical Team OS structure:

- **Trigger:** source contains `product-development/` AND `team/` AND at least 3 canonical subfolders (`product-development/product/PRDs/`, `product-development/analytics/metrics/`, `product-development/engineering/rfcs/`, etc.)
- **Decision:**
  - `mode = idempotent-augment` if trigger fires → skip Step 4 (full scaffold), only sanitize/extract personal-context files, run Steps 5–7.5 in idempotent mode
  - `mode = full-scaffold` otherwise → run all 8 steps

Print to user: *"Source already follows canonical Team OS structure. Switching to idempotent-augment mode (~60s) instead of full-scaffold mode (~2min)."*

### 0.2 Locale Scan

Detect the source's primary filename language:

- **Trigger:** ≥30% of folder names match English keyword patterns from the Role Tells table → `locale = english`
- **Trigger:** Korean / Japanese / Chinese / Cyrillic / Arabic Unicode ranges in folder names → `locale = non-english`, capture the script

If `locale = non-english`:
1. Build an interactive mapping table by reading the first 3 files in each non-English folder and probing for canonical content shape (see 0.2.1).
2. Confirm the inferred mapping with the user in one round.
3. Cache the mapping at `{output}/.claude/upgrade-mapping.json` so re-runs don't re-ask.

#### 0.2.1 Content-Shape Probe (language-agnostic)

Read each folder's first 3 files. Look for canonical heading patterns regardless of language:

| Heading match | Likely canonical mapping |
|---|---|
| `## Hypothesis` / `## 가설` / `## 仮説` | PRDs |
| `## Decision` / `## 결정` / `## 決定` | decisions |
| `## RFC` / `## 設計` / numbered ADR pattern | engineering/rfcs |
| `SELECT … FROM …` / SQL keywords | analytics/queries |
| `## Hypothesis` + `MDE`/`treatment`/`holdout` | analytics/experiments |
| `## Action Items` + customer name in title | customers/accounts/{slug}/calls/summaries |
| Tables of `metric_name`, `numerator`, `denominator` | analytics/metrics |

Frontmatter `team-os-area: {area}` overrides everything — respect it.

### 0.3 MCP Probe

Check available MCP servers (the skill runs inside Claude Code, which exposes the active MCP list). For each available connector, offer to pull the relevant info:

| MCP available | Pull |
|---|---|
| Slack | Team roster (workspace members), channel list (channel IDs + names + purpose) |
| Notion | Existing team page → roles, OKRs, doc links |
| Linear / Jira | Project list → product-area names for `{area}` slugs |
| Google Drive | Shared folder listing → existing team docs to reference (don't copy) |
| GitHub | Org members → roster, repo list → existing docs |

Print: *"Detected MCP servers: Slack, Notion, GitHub. Pull team roster from Slack? (Y/n) Pull product areas from Linear projects? (Y/n)"*

If MCP returns data, downstream Inputs steps skip questions for what was retrieved.

### 0.4 Manifest Scan

Check for prior runs:

- If `{output}/.claude/upgrade-state.json` exists → previous run; load source-hash + mapping decisions + sanitization rules; this is a re-run; show diff against current source state and only act on changes.
- If `{output}` exists but no manifest → user-created or partial; treat as idempotent-augment with caution; never overwrite.
- If `{output}` doesn't exist → fresh run.

---

## Inputs (ask only what Step 0 couldn't infer)

After Step 0 routing, ask only the inputs not already resolved. Each has a "skip if" rule:

1. **Path to personal OS** — skip if cwd looks like a personal OS (has `.claude/skills/` and at least one of `context-library/`, `sub-agents/`, `personal-context*.md`, or canonical Team OS folders). Default to cwd, ask one-line confirm.
2. **Output path** — skip if not first run; otherwise default to sibling `{personal-parent}/team-os/`, confirm only if the parent directory has unusual structure (e.g., source is at filesystem root, or under `~/Documents` with no clear sibling pattern).
3. **Owner identity** — skip if found in source (auto-extract from `personal-context*.md`, top-of-CLAUDE.md "About me" section, git config user.name/user.email, `.claude/settings.json` user info). Confirm what was extracted; ask only for missing pieces.
4. **Team roster** — skip if MCP Slack/GitHub returned it. Otherwise ask, but accept "skip — leave placeholders" as a valid answer.
5. **Slack channel table** — skip if MCP Slack returned channel list. Otherwise ask, accept skip.
6. **Primary role(s)** — skip if Step 1 detection has high confidence. Otherwise show detected role(s) and ask user to confirm or correct.
7. **Locale mapping confirmation** — skip if `locale = english`. Otherwise present the inferred mapping table and ask for confirmation/edits.

**Rule:** the skill should never ask a user something it can already see. Every prompt costs trust. The maximum-question case is a tiny English-only repo with no MCP — that's ~2 questions (output path + roster). The minimum-question case is a fully-MCP-connected, already-canonical, Aakash-style repo — that's 0 questions.

---

## Step 1 — Detect Architecture

Walk the source and produce a structural inventory.

### Role Tells (English keyword pass)

| Role | Strong tells | Weak tells |
|------|-------------|------------|
| PM | `PRDs/`, `prd-*.md`, `roadmap*.md`, `customers/`, `customer-call-*`, `decision-log*` | `okrs*.md`, `competitive-*` |
| Engineering | `rfcs/`, `adrs/`, `bug-investigations/`, `plans/`, `incident-*`, `runbook*` | `architecture*.md`, `tech-debt*` |
| Design | `figma-*`, `design-system*`, `ux-research/`, `usability-*`, `wireframes/` | `accessibility*`, `brand*` |
| Analytics | `metrics/`, `queries/`, `schemas/`, `dashboards/`, `experiments/`, `*.sql` | `data-catalog*`, `investigations/` |
| Strategy / Ops | `strategy/`, `vision/`, `business-context/`, `processes/` | `market-*`, `gtm-*` |
| Exec | `board-memos/`, `1on1s/`, `vision/`, `okrs/`, `acquisition/` | `comp/`, `m-a/` |
| DevOps | `runbooks/`, `terraform-notes/`, `infrastructure/`, `oncall-*`, `incident-reports/` | `paging-*`, `escalation-*` |

For `locale = non-english`, skip this table and use the content-shape probe from 0.2.1.

### Multi-Role Detection

If 3 or more rows in the Role Tells table fire with strong tells → `mode = multi-role`. Don't pick a primary; treat all detected roles equally and **skip Step 5.1 pruning** (multi-role repos need the full scaffold).

### Inventory Output

Emit an internal map (don't dump to user — too noisy):

```
DETECTED ROLES: [PM, Analytics] (or [Multi-role: PM, Eng, Design, Analytics])
LOCALE: english | non-english (script)
MATURITY: fresh | idempotent-augment
SKILL FILES: 14 (.claude/skills/...)
SUB-AGENTS: 7 (sub-agents/...)
CONTEXT DOCS: 23
TEMPLATES: 5
ANALYTICS ASSETS: 0
CUSTOMER ARTIFACTS: 0
LOOSE FILES AT ROOT: 4
STRUCTURE STYLE: flat-skills | folder-skills | mixed
NESTED PERSONAL-CONTEXT FILES: 2 (recursive walk found these — flag for Step 2)
```

Show user a one-paragraph summary and confirm.

---

## Step 2 — Classify Every File (default-private)

Three buckets: **shared** (copy and sanitize), **private** (leave in personal OS), **review** (ask user). Run BOTH the path-based check AND the content-pattern check on every file. Either firing → private (stricter rule wins).

### 2.1 Default-Private Path/Filename Triggers

Path or filename matches any of (recursive walk — match at any depth):

- **Personal context:** `personal/`, `private/`, `me/`, `inbox/`, `journal/`, `drafts/`, `working-preferences*`, `pm-background*`, `personal-context*`, `*-private*`, `daily/`, `weekly/`
- **People management (NEVER share):** `1on1*`, `1-on-1*`, `direct-reports*`, `coaching-notes*`, `feedback-*`, `personal-feedback*`, `mentor-feedback*`, `mentor-*`, `career-*`, `career-goals*`, `growth-plan*`, `pip*`
- **Sensitive business (NEVER share):** `board-memos*`, `comp/`, `compensation/`, `equity/`, `cap-table*`, `acquisition/`, `m-a/`, `due-diligence/`, `negotiation/`, `pricing-thesis*`, `term-sheet*`, `investor-update*`
- **Voice / style:** `*writing-style*`, `*voice*`, `*tone*`, `*leadership-style*`, `*management-style*`, `*sketch-style*`, `*coding-style*` (when first-person)
- **Sub-agents:** any file under `sub-agents/` — *always* personal review perspectives. Never share, even with frontmatter override.
- **Filename matches owner identity:** `{owner-firstname}-*.md`, `{owner-lastname}-*.md`, `*-{owner-firstname}.md`

### 2.2 Default-Private Content-Pattern Detector (PII regex pack)

Run these regexes on every file's content. **Any hit → private regardless of folder/frontmatter** (file goes to `review` bucket with reason flagged):

| Pattern category | Regex (examples — extend per locale) |
|---|---|
| Phone (US/intl) | `\+?1?[-\s.]?\(?\d{3}\)?[-\s.]?\d{3}[-\s.]?\d{4}`, `\+82[-\s]?\d{2}[-\s]?\d{4}[-\s]?\d{4}` (Korean), `\+81[-\s]?\d{2}[-\s]?\d{4}[-\s]?\d{4}` (Japanese), generic `\+\d{1,3}[-\s]\d{6,}` |
| Email (owner) | exact match against owner email from Inputs |
| Slack ID | `\b[UW][A-Z0-9]{8,}\b` (user IDs), `\bC0[A-Z0-9]{8,}\b` (channel IDs) |
| KakaoTalk / WeChat / LINE IDs | `kakao_[a-z0-9_]+`, `wechat:[a-z0-9_-]+`, `line\.me/ti/p/` |
| AWS account ID | `\b\d{12}\b` (in context of `aws`, `account`, `arn:`) |
| Internal hostnames | `[a-z0-9-]+\.internal\b`, `[a-z0-9-]+\.corp\.[a-z]+\b` |
| SSH paths | `~/\.ssh/`, `id_rsa`, `id_ed25519`, `\.pem\b` |
| Compensation | `\$\d{2,4}k?\s*(base\|salary\|comp)`, `\d+(\.\d+)?%?\s*equity`, `RSU`, `vest`, `cliff`, `refresh grant`, `comp adjusted` |
| Promotion / leveling | `promotion to (Senior\|Staff\|Principal\|GPM\|VP\|Director)`, `\bL[3-9]\b\s*(promotion\|to)` |
| M&A / capital | `Series [A-E]`, `term sheet`, `acquisition`, `due diligence`, `walk-away`, `floor:` |
| Customer cohort IN-clauses | `(WHERE\|where)\s+\w+\s+(IN\|in)\s*\([^)]+\)` (when contents include named customer slugs like `cust_*` or brand strings) |
| API / secret env vars | `\bAPI_KEY\b`, `\bSECRET[_\s]`, `Bearer [A-Za-z0-9_-]{20,}`, `aws[_\s]configure`, `Authorization:\s*Bearer`, webhook URLs `https://hooks\.slack\.com/services/T[A-Z0-9]+/B[A-Z0-9]+/[A-Za-z0-9]+` |
| Korean RRN / NRIC / national IDs | `\d{6}-\d{7}` (KR RRN), `[A-Z]\d{7}[A-Z]` (SG NRIC), etc. — extend per locale detected in 0.2 |
| NDA pilot indicators | `under NDA`, `friends-and-family`, `early-access` near customer name |

The detector flags the file with the first matching pattern; the user sees the reason in the classification preview. **Files with comp/equity/M&A patterns are NEVER candidates for "shared" — they go straight to private.**

### 2.3 Shareable Triggers

Any of these → candidate for shared (still gets sanitized + validated):

- Path contains: `templates/`, `playbooks/`, `competitive-*`, `business-info*`, `product-context*`, `metrics/`, `schemas/`, `dashboards/`, `processes/`
- Frontmatter has `visibility: shared` or `team: true` AND content-pattern detector returned no hits
- File is a template with bracketed placeholders (`[FILL IN]`, `{customer}`)
- Files in `PRDs/`, `decisions/`, `rfcs/`, `plans/`, `customers/accounts/{customer}/` AND content-pattern detector returned no hits

### 2.4 Skill-as-Leak-Vector Rule

For every file under `.claude/skills/`, additionally check the skill's **purpose** (description + body):

- If the skill's description or body prescribes capturing comp / equity / M&A / 1:1 review / board-memo authoring / negotiation tactics → classify as **skip-entirely** (don't share even sanitized — the skill exists to author never-share content).
- If the skill's purpose is generic but the body has heavy first-person voice that survives sanitization without losing meaning → flag as `review`.

### 2.5 Review Bucket

Anything else: skill files (sanitize-then-share unless 2.4 fires), loose root docs, mixed-signal files. Default the user-suggestion based on best guess.

### 2.6 Show the Classification Preview

```
SHARED (12 files, will be sanitized):
  templates/launch-checklist.md
  context-library/business-info.md  [content-detector: clean]
  ...

PRIVATE — staying in personal OS (18 files):
  context-library/personal-context-pm-background.md  [path: personal-context*]
  sub-agents/skeptic.md  [path: sub-agents/]
  1on1s/2026-04-15-sarah.md  [path: 1on1s/, content: comp pattern]
  pricing-thesis.md  [content: "$80k floor", "negotiate"]
  ...

REVIEW — please confirm (5 files):
  context-library/competitive-intel/lovable.md  → share?
  templates/prd-draft.md → share as template?
  ...

SKILL skip-entirely (2 files):
  .claude/skills/board-memo/  → skill prescribes comp/M&A capture
  .claude/skills/1on1-review/  → skill prescribes direct-report review
```

Resolve in one round of confirmations. Default to suggestion; user overrides exceptions only.

---

## Step 3 — Sanitize Skills

Every skill marked for sharing gets a **personal copy** (untouched in source) and a **shared copy** (sanitized in team OS).

### 3.0 No-Skills Branch

If the source has zero personal skills (e.g., Yuki: 8 files, no `.claude/`), skip Step 3 entirely. Don't run a vacuous pass. Step 6 handles all skill installation in this case.

### 3.1 What to Strip from Shared Skills

For each personal skill being shared:

1. **Owner identifiers** — Full name → role label (`Aakash` → `the PM` or `the skill owner`); email/phone/Slack ID/KakaoTalk ID/GitHub handle/PagerDuty handle → remove entirely; personal Figma/Notion/Linear URLs → remove unless they're shared team URLs.

2. **First-person voice** — `I prefer X` → `Use X` or `The team convention is X`; `My PRDs always include` → `PRDs should include`; `I never use 'leverage'` → `Avoid 'leverage'`.

3. **Company-specific names** — Replace concrete company names with `{Company}`/`{Customer}`/`{Vendor}` placeholders unless the doc is explicitly about a tracked competitor. Replace specific stakeholder names with role labels (`Bryan in support` → `Support lead`).

4. **Personal calendar / time references** — Strip "I do this every Friday at 4pm" cadence. Keep the *what*, drop the *when-by-me*.

5. **Personal taste markers** — `I love Cursor over VS Code` → cut entirely (not a team norm). `I always run pytest with -xvs` → keep if team norm, drop if just personal preference.

### 3.2 Preserve Insight, Drop Anecdote

The hardest sanitization: insights buried inside autobiographical scaffolding. Default to **keeping the lesson, dropping the autobiography**.

```
BEFORE: "When I was at the Apollo growth team, I learned that PRDs without
         a testable hypothesis become feature lists by week three."
AFTER:  "PRDs without a testable hypothesis become feature lists within
         a few weeks of work starting."
```

```
BEFORE: "I block a day a week for sketching — without it the team ships
         the first idea, not the best one."
AFTER:  "Block dedicated sketch time. Without it the team ships the first
         idea, not the best one."
```

Don't flatten the insight into a bare directive. Keep the *why* — the consequence/observation that makes the rule stick. The skill is testing whether you can extract the generalizable rule + its motivating observation from an autobiographical wrapper.

### 3.3 Pronoun-Pass with Template-String Exemption

After sanitization, run a regex audit for `\bI\b|\bmy\b|\bmine\b|\bme\b` on every shared SKILL.md. Two exemptions:

- **Code blocks** (```...```) — preserve verbatim
- **Quoted template strings** — text inside `"..."` or surrounded by `*italics*` that is meant to be spoken/written by a user (e.g., a design-critique skill says `*"I notice the spacing here feels uneven — was that intentional?"*` as a facilitator script). Preserve these.

Any remaining hit → **block the skill from being written**, surface to user with the line, suggest a rewrite.

### 3.4 Sanitization Diff Preview

Show diffs for the **first 3** skills individually. Then offer to apply the same rules in batch with one summary diff for the rest.

```
SKILL: prd-draft → prd-draft (shared)
  - I always start a PRD with the hypothesis statement.
  + Start every PRD with the hypothesis statement.
  - When I worked on Apollo I learned...
  + (anecdote scaffolding removed; insight preserved below)
  + PRDs without a testable hypothesis become feature lists.
  - Email me at aakash@example.com if stuck.
  + (removed contact info)
[Accept / Edit / Skip]
```

If sanitization removes >70% of body content, suggest skipping the skill (better to leave personal-only than ship a husk).

### 3.5 Skill-Name Collisions

If a personal skill name collides with a canonical Team OS skill (`customer-call-summary`, `decision-log-entry`, `feature-launch-gate`, `freshness-check`, `weekly-synthesis`, `portfolio-pulse`):

1. **Default:** install the canonical Team OS skill **with full content** (not a stub). Namespace the personal version as `{name}-personal`.
2. **Alternative:** offer to keep the personal version as the team's canonical (replaces the canonical install).
3. **Always show the collision count** in the Step 8 summary: `"Collisions detected: 2 (customer-call-summary, decision-log-entry) — resolved by: namespace personal."`

Never silently shadow. Never install a stub that says "see canonical for full content" — copy the actual canonical SKILL.md content.

---

## Step 4 — Scaffold the Team Structure (paired with nav)

Generate canonical Team OS structure at the output path. **Every `mkdir` in this step pairs with a `CLAUDE.md` write before moving on.** No deferred nav generation.

### 4.0 Idempotent-Augment Mode

If Step 0.1 set `mode = idempotent-augment`, **skip this step**. The structure already exists; only sanitize/extract personal-context files in Step 5 and run gap-fill for missing canonical skills in Step 6.

### 4.1 Canonical Tree

```
product-development/
├── feature-index.yaml
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
├── skills/{name}/SKILL.md
├── agents/onboarding.md
├── commands/customer-call.md
├── hooks/session-start hook
└── settings.json (if applicable)

CLAUDE.md
README.md
LICENSE
```

### 4.2 Role-Aware Pruning

For single-role repos, prune (but stub, never omit). Multi-role repos skip pruning.

| Role | Stubbed (placeholder CLAUDE.md only) |
|------|-------------------------------------|
| PM-only | `engineering/`, `data-engineering/` (full subtrees stubbed) |
| Eng-only | `product/customers/`, `product/sales-enablement/`, `product/launch-emails/`, `product/competitive-research/`, `product/strategy/roadmaps/` |
| Design-only | `engineering/`, `data-engineering/`, `analytics/queries/`, `analytics/schemas/` |
| Analytics-only | `engineering/`, `data-engineering/`, `product/customers/`, `product/sales-enablement/` |
| Exec/strategy-only | most of `engineering/`, `data-engineering/`, `analytics/queries/` (keep `analytics/dashboards/` and `analytics/metrics/` for board-level rollups) |
| DevOps-only | `product/PRDs/`, `product/customers/`, `analytics/dashboards/`, `analytics/experiments/` |

### 4.3 Stub CLAUDE.md Template

Every pruned folder gets:

```markdown
# {Folder Name}

This folder is reserved for {what lives here per Team OS canon}. Empty for now — populate when {role} joins the team.

When populated, follow the structure in [the canonical Team OS](https://github.com/aakashg/team-os) for this folder.
```

### 4.4 Coupling Check

After Step 4, verify with `find {output} -type d ! -path '*/\.git*' ! -exec test -f '{}/CLAUDE.md' \;` — every directory must have a CLAUDE.md. Failure → fix before moving on. (This check repeats in Step 7.5 as a hard gate.)

---

## Step 5 — Migrate Content (COPY only, with redaction)

Every shared file gets copied to its team-OS destination, sanitized along the way.

### 5.1 Mapping Rules

| Personal OS pattern | Team OS destination |
|---|---|
| `context-library/business-info*` | `product-development/product/strategy/business-context/business-info.md` |
| `context-library/competitive-intel/{name}.md` (flat) | `product-development/product/competitive-research/competitors/{name}/CLAUDE.md` (split flat → per-competitor folder) |
| `**/PRDs/**`, `prd-*.md`, `*-prd.md` | `product-development/product/PRDs/{detected-area}/` |
| `**/decisions/**`, `decision-*.md`, ADRs that are non-architectural | `product-development/product/decisions/` |
| `**/customers/**`, `customer-*.md` | `product-development/product/customers/accounts/{customer-slug}/` |
| `**/rfcs/**`, `**/adrs/**` (architectural) | `engineering/rfcs/{area}/` |
| `**/plans/**` | `engineering/plans/{area}/` |
| `**/bug-investigations/**`, `incident-*` | `engineering/bug-investigations/{area}/` |
| `**/metrics/**`, `*-metrics.md` | `analytics/metrics/{area}/` |
| `**/queries/**`, `*.sql` | `analytics/queries/{area}/` (with redaction — see 5.3) |
| `**/schemas/**` | `analytics/schemas/{area}/` |
| `templates/**` | inline into matching shared skill, OR `product-development/product/processes/templates/` |
| For Korean folders (`기획서/`, `회의록/`, `고객/`, `결정사항/`) | Use the locale mapping from Step 0.2 |

If a file doesn't match any pattern, ask the user with the 3 most likely destinations.

### 5.2 Area Detection

Detect `{area}` from filename or content. `prd-billing-flow.md` → `billing`. Default to `general/` if unsure and flag for the user to retag later.

### 5.3 SQL / Credential Redaction

For any `*.sql` file or query content being shared:

1. Strip `WHERE customer_id IN ('cust_acme123', ...)` cohorts → replace with `JOIN dim_cohort_exclusions ce ON ce.cohort_name = '{cohort}'` referenced from a generated `analytics/cohort-exclusions.yaml`
2. Strip warehouse credentials referenced in queries (`snowflake://user:pass@host`, `~/.dbt/profiles.yml` paths)
3. Strip Slack channel IDs from query comments
4. Run the PII regex pack from Step 2.2 on the rewritten query
5. **Block migration** if any pattern still matches after redaction

If a query's *purpose* is named-customer cohort analysis (`expansion_by_account.sql`, `at_risk_accounts.sql`), classify as **private** outright — the query exists to operate on never-share customer identifiers.

### 5.4 Customer Slug Anonymization for NDA Accounts

If an account folder has any of: `under NDA` flag in account-context.md, frontmatter `nda: true`, or filename `*-nda*`:

1. Use a generic slug (`account-001`, `account-002`) instead of brand-named (`outdoor-voices-alum`)
2. Strip vertical / ARR band when narrow enough to identify (`footwear DTC at $4M ARR` → `consumer goods`)
3. Strip company size markers when combined with sector

### 5.5 Recursive Personal-Context Extraction

In idempotent-augment mode (Alex), `personal-context-*.md` files can hide nested deep under `product-development/product/` or other canonical folders. Run a recursive walk for these patterns at any depth:

- `personal-context*.md`
- `working-preferences*.md`
- `*-style-{owner-firstname}.md`
- Any file with `visibility: private` in frontmatter

Move (logical move — copy then mark for source-side cleanup the user must do manually; never delete from personal OS) into a `_extracted-personal/` quarantine reported in the Step 8 summary.

---

## Step 6 — Add Canonical Shared Skills (full content)

Copy these from this Team OS template (or any local Team OS reference) into `{output}/.claude/skills/`. **Full canonical content, not stubs.**

Required:
- `customer-call-summary` (folder + `examples/example-2026-01-27.md`)
- `decision-log-entry`
- `feature-launch-gate`
- `freshness-check`
- `weekly-synthesis`
- `portfolio-pulse`

Plus:
- `.claude/agents/onboarding.md`
- `.claude/commands/customer-call.md`
- `.claude/hooks/session-start.json` (or .md per the canonical Team OS)

Verify each must-exist path before continuing. Step 7.5 has the formal check.

For collisions (Step 3.5), the canonical version installs with full content; the personal version is namespaced.

---

## Step 7 — Generate Navigation Files

Step 4 already wrote a CLAUDE.md per directory. Step 7 fills in the **content** of each CLAUDE.md once files are migrated:

- One-line description of what lives here
- "Read this when…" guidance
- File index (one line per file with one-line description)
- Stays under ~200 tokens

Don't recursively enumerate the entire tree — each CLAUDE.md describes its own folder and links to children's CLAUDE.md files.

The root CLAUDE.md follows the canonical Team OS root format:
- Team table (placeholder rows or roster from MCP/Inputs)
- Slack channel table (placeholders or from MCP)
- Doc index (every CLAUDE.md mapped)
- Three Rules
- Read-order routing for common queries

For repos with sensitive folders (1on1s/, board-memos/, comp/), root CLAUDE.md auto-includes a **privacy contract section**:

> ## Privacy Contract
>
> The following content lives in personal OSes only and is **never** committed to this team repo:
> - 1:1 notes with direct reports
> - Board memos / acquisition discussions
> - Comp & equity decisions
>
> If you find any of these in this repo, treat it as an incident: revert the commit, rotate any leaked secrets, notify the owner.

---

## Step 7.5 — Validate (programmatic gates)

Before declaring success, run these gates. **Any failure blocks the success message; fix and re-validate.**

### 7.5.1 PII Grep Gate

`grep -r {output}` for every entry in:
- Owner identifiers from Inputs (name, email, GitHub, Slack, phone)
- All regexes from the Step 2.2 content-pattern pack
- Any locale-specific PII patterns (Korean phone, KakaoTalk, etc.)

Hits → fail. Print the file:line of each hit. Re-sanitize and re-run gate.

### 7.5.2 Pronoun Grep Gate

`grep -rn -E '\bI\b|\bmy\b|\bme\b|\bmine\b' {output}/.claude/skills/` (and shared docs).

Apply exemptions:
- Skip code blocks
- Skip quoted facilitator-script strings (`*"..."*` patterns)

Remaining hits → fail. Show line, suggest rewrite, re-run gate.

### 7.5.3 CLAUDE.md Coverage Gate

`find {output} -type d ! -path '*/\.git*' ! -path '*/_extracted-personal*'` — every directory must contain a `CLAUDE.md`. Missing → fail; generate before re-running.

### 7.5.4 Canonical Must-Exist Gate

Verify each of these exists with non-stub content (>20 lines):
- `{output}/.claude/skills/customer-call-summary/SKILL.md`
- `{output}/.claude/skills/decision-log-entry/SKILL.md`
- `{output}/.claude/skills/feature-launch-gate/SKILL.md`
- `{output}/.claude/skills/freshness-check/SKILL.md`
- `{output}/.claude/skills/weekly-synthesis/SKILL.md`
- `{output}/.claude/skills/portfolio-pulse/SKILL.md`
- `{output}/.claude/agents/onboarding.md`
- `{output}/.claude/commands/customer-call.md`
- `{output}/CLAUDE.md`
- `{output}/product-development/feature-index.yaml`
- `{output}/product-development/analytics/data-catalog.yaml`

Missing or stub-content → fail.

### 7.5.5 Personal-OS Preservation Gate

Run `find {source} -type f -exec md5 {} \;` and compare with the snapshot taken at Step 0. Any diff → fail (this should never happen given additive-only contract; if it does, halt immediately and tell the user).

### 7.5.6 Idempotency Manifest Write

After all gates pass, write `{output}/.claude/upgrade-state.json`:

```json
{
  "skill_version": "2.0",
  "source_path": "/Users/devon/Downloads/pm-os",
  "source_snapshot_hash": "sha256:...",
  "run_at": "2026-05-07T14:23:00Z",
  "mode": "full-scaffold",
  "locale": "english",
  "detected_roles": ["PM"],
  "owner": {"name": "Devon", "email": "..."},
  "classifications": {
    "shared_count": 17,
    "private_count": 10,
    "review_resolved": 6,
    "skipped_skills": 1,
    "collisions": 2
  },
  "sanitization_rules_applied": ["pronoun-pass", "anecdote-extraction", "company-anonymization"],
  "mapping": {/* locale mapping from 0.2 if non-english */}
}
```

This makes re-runs idempotent: next run reads the manifest, hashes the source again, and only acts on diffs.

---

## Step 8 — Print Summary

```
✅ Team OS scaffolded at {output-path}.

Mode: {full-scaffold | idempotent-augment}
Time: {Xs}
Locale: {english | non-english (script)}
Detected role(s): {role list}

Migrated:
- {N} shared docs (sanitized)
- {N} skills (personal preserved + shared sanitized)
- {N} canonical Team OS skills installed (full content)
- {N} navigation CLAUDE.md files generated
- {N} placeholder folders for future team growth

Stayed personal (in {source}):
- {N} private files (path-trigger or content-pattern)
- {N} sub-agents
- {N} skipped-entirely skills (board-memo / 1on1-review type)
- {N} skill collisions resolved by: {namespace-personal | replace-canonical}

Validation gates passed:
- PII grep: 0 hits ✓
- Pronoun grep: 0 hits ✓
- CLAUDE.md coverage: all folders ✓
- Canonical must-exist: all present ✓
- Personal OS preservation: hash match ✓

Manifest written: {output}/.claude/upgrade-state.json (use for safe re-runs)

Privacy contract section auto-added to root CLAUDE.md (sensitive-folder source detected).

Next steps:
1. Fill in {N} placeholder rows in {output}/CLAUDE.md (team roster + Slack channels not pulled from MCP)
2. cd {output} && git init && git add . && git commit -m "Initialize Team OS"
3. Push to GitHub
4. Run /freshness-check after a week
5. Run /feature-launch-gate before next launch

Rollback: rm -rf {output} (source at {source} is verified untouched).
```

---

## Failure Modes (lessons from hardening rounds)

- **Pronoun leakage in shared skills.** Mitigation: Step 3.3 + Step 7.5.2 gate.
- **Customer cohort SQL slipping through to shared queries.** Mitigation: Step 5.3 + Step 2.2 IN-clause regex.
- **1:1 notes / comp / equity reaching team OS.** Mitigation: Step 2.1 expanded triggers + Step 2.2 content-pattern pack.
- **Leaf folders without CLAUDE.md.** Mitigation: Step 4 coupling + Step 7.5.3 gate.
- **Canonical skills installed as "see canonical" stubs.** Mitigation: Step 6 full-content rule + Step 7.5.4 must-exist gate.
- **Re-run produces duplicate folders.** Mitigation: Step 0.1 maturity scan + Step 0.4 manifest scan + Step 7.5.6 manifest write.
- **Non-English filenames produce zero detection.** Mitigation: Step 0.2 locale scan + Step 0.2.1 content-shape probe.
- **Multi-role repos pruned wrong.** Mitigation: Step 1 multi-role branch + Step 4.2 skip-pruning rule.
- **Skill prescribes capturing private content (board-memo skill).** Mitigation: Step 2.4 skill-as-leak-vector rule.
- **Sanitization kills the insight along with the anecdote.** Mitigation: Step 3.2 preserve-insight-drop-anecdote rule.
- **Asks the user 8 questions when 1 would do.** Mitigation: Step 0 pre-detection + MCP probe + skip-if rules on every Input.
- **No-skills repo (Yuki) runs Step 3 vacuously.** Mitigation: Step 3.0 no-skills branch.
- **Already-canonical repo (Alex) gets re-scaffolded.** Mitigation: Step 0.1 maturity scan + Step 4.0 idempotent-augment skip.
- **NDA pilot customer leaks via vertical/ARR band inference.** Mitigation: Step 5.4 NDA slug anonymization.
- **Personal-context files nested deep.** Mitigation: Step 5.5 recursive extraction + Step 2.1 path triggers match at any depth.

## Rules

1. Never delete or modify a file in the personal OS. Read-only. Always.
2. Never write to the team OS until classification preview is confirmed.
3. Never silently overwrite. Existing files are preserved; conflicts are reported.
4. Use the SKILL.md folder convention.
5. Default the output path to a sibling directory.
6. Privacy beats completeness — when in doubt, leave it personal.
7. Auto-detect, don't ask. MCP-probe before user-prompt.
8. Validate before declaring done. Programmatic gates are not optional.

## Rollback

```sh
rm -rf {output-path}
```

Personal OS verified untouched (Step 7.5.5).

## See Also

- `examples/example-pm-os-detection.md` — worked example on a 47-file PM OS
- `../../../pm-os-migration.md` — narrative migration guide for the original Aakash PM OS path
- `../../../MINIMAL-SETUP.md` — the "delete what you don't use" path post-upgrade
