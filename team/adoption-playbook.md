# Team OS Adoption Playbook

Everything you need to roll out the Team OS to your team.

---

## 1. The Slack Pitch

Copy-paste this into your team channel when you're ready to introduce the repo:

---

Hey team — I've been building something I want to show you.

I set up a shared repo where I've been checking in our key decisions, customer call summaries, and metric definitions. Any of us can query it in natural language and get answers in seconds.

Quick examples of what it can do:
- "Why did we choose [recent decision]?" → Full reasoning in 15 seconds
- "What have customers said about [feature] this month?" → Synthesis across all call summaries
- "How do we calculate [metric]? Show me the query." → Definition + SQL + schema

I want to do a 15-minute demo this week. If it's useful, we'll start using it together. If not, no harm done. I'll keep using it personally either way.

Who's in for the demo? 🙋

---

## 2. The 15-Minute Demo Script

### Before the demo
- Make sure you have at least 10 files in the repo
- Test the three queries below to confirm they work
- Have the repo open in your coding agent, ready to go

### The three queries (in this order)

**Query 1: The Decision Lookup (3 minutes)**

"Why did we choose [a decision the whole team will recognize]?"

This demonstrates the core value: 15-second context retrieval vs. 25-minute Slack archaeology. Pick a decision the team debated. Show them the full reasoning appearing instantly.

What to say: "This took me 3 sentences to write after that meeting. Now anyone on the team can find the reasoning without asking me."

**Query 2: The Customer Synthesis (5 minutes)**

"What have customers been saying about [active feature or pain point]?"

This demonstrates cross-cutting analysis. Claude synthesizes across multiple call summaries. The audience sees patterns they didn't know existed because the data was scattered across individual PMs' notes.

What to say: "Every call summary follows the same format. That's what makes the synthesis work. One skill, applied consistently."

**Query 3: The Analytics Self-Serve (5 minutes)**

"How do we calculate [key metric]? Show me the query and the table schema."

This is the one that wins over engineers and analysts. Show that anyone on the team can find metric definitions, verified SQL, and table schemas without paging the analyst.

What to say: "Our analyst verified this query. It's the same one behind the dashboard. Now anyone can use it at 2 AM without waking anyone up."

**Close (2 minutes)**

"Here's what I'm asking from the team: after meetings where we make decisions, one person writes a 3-sentence entry. After customer calls, run the summary skill. That's it. Two habits. Everything else is optional."

### If someone asks "isn't this just Notion?"

"Notion stores documents. This stores context that an AI can query with structured navigation. We're not replacing Notion. We're adding a layer on top where anyone can ask a question and get an answer in seconds instead of searching through pages."

---

## 3. Weekly Ritual Template

### Monday (2 minutes)
Query the repo: "What decisions were made last week? What customer calls happened?"
Review the weekly synthesis (if automated) or scan recent commits.

### Daily (30 seconds per occurrence)
After a meeting with a decision → /decision-log-entry
After a customer call → /customer-call

### Friday (5 minutes)
Run /weekly-synthesis (or review if automated)
Run /freshness-check monthly

### Launch day (10 minutes)
Run /feature-launch-gate before shipping
Resolve any BLOCKED items before deploy

---

## 4. Feature Launch Gate Checklist

Before any feature ships, verify:

- [ ] PRD exists in the repo
- [ ] Decisions are logged
- [ ] Metric definitions updated
- [ ] SQL queries verified by analyst and checked in
- [ ] Table schemas documented
- [ ] Dashboard link added
- [ ] CLAUDE.md navigation files updated for any new folders

Run /feature-launch-gate [feature-name] to automate this check.

---

## 5. Meeting Integration Guide

### The Team OS doesn't replace your meetings. It feeds them.

The cadences below assume a team that runs standups, sprint planning, and retros. **If your team doesn't run those rituals (small startups often don't), skip the rituals you don't have.** The "after any meeting where a decision is made" line is the only universal one.

**Before any sync (standup, weekly check-in, whatever you call it):**
Query: *"What shipped yesterday? What's blocked?"*
The repo has this if the team is checking in status updates. If not, the sync still works the old way.

**After identifying a blocker:**
Add it to `engineering/bug-investigations/{area}/` or `product/decisions/` depending on whether it needs investigation or a decision.

**Before planning (sprint planning, weekly priority review, etc.):**
Query: *"What customer feedback from the last two weeks is relevant to our priorities?"*
The structured call summaries make this a 30-second lookup instead of a 30-minute review.

**After a retro (if you run them):**
Check in the retro summary to `team/retros/`. Name it `{YYYY-MM-DD}-retro.md` (drop the "sprint-" prefix if you don't run sprints).
Format: What went well, what didn't, action items with owners.

**After any meeting where a decision is made:**
Run `/decision-log-entry`. Two minutes. Non-negotiable. This is the rule that compounds — every other meeting ritual is optional.

---

## 6. Handling Resistance

### "This is extra work"
It redirects work you already do. You already write meeting notes. You already answer "why did we choose X?" in Slack. The Team OS puts that same effort into a place where it compounds instead of disappearing.

2 minutes on a decision log saves 25 minutes every time the question comes up again. That's 12x return.

### "I don't use Claude Code / I'm not technical"
Start with Hub and Spoke: one power user queries for everyone, shares outputs. The team benefits without anyone else touching a terminal. Adoption spreads naturally.

If someone wants to learn: the repo includes `team/onboarding-guides/github-101.md`. Five git commands. That's all they need.

### "We already have Notion/Confluence"

The Team OS adds a structured query layer for AI. Notion / Confluence keep what they're good at: long-form proposals, polished customer-facing docs, embedded multimedia. **Decide canonically what lives where, then commit to it.** Recommended split:

| Artifact | Canonical home | Why |
|----------|----------------|-----|
| Decision logs (with reasoning) | Team OS `decisions/` | Structured, queryable, AI-discoverable |
| Customer call summaries | Team OS `customers/accounts/` | PII rules + cross-account synthesis |
| Metric definitions, SQL, schemas | Team OS `analytics/` | Reproducible, version-controlled |
| RFCs, plans, bug investigations | Team OS `engineering/` | Cross-referenced from `feature-index.yaml` |
| Long-form strategy memos | Notion / Google Docs | Better collaboration UI for narrative drafting |
| Polished launch announcements | Notion + email tool | Better preview / scheduling / branding |
| Public-facing docs | Notion / docs site | Better web rendering, search, permissions |
| Meeting agendas / live notes | Notion (real-time collab) | Better multi-cursor editing |

If something exists in both places, **the Team OS version is canonical** for AI queries and the Notion version is canonical for human reading. The PR-merge rule: when a decision logs into the Team OS, link to it from any Notion doc that references it (not the other way around). One reconciliation owner per area — usually the area's PM or analyst.

### "What about sensitive data?"

Three layers of control:

1. **Policy.** Nothing goes in that you wouldn't put in a shared Google Doc with the same access permissions. PII stays in the CRM. Revenue data stays in the BI tool. Team OS stores context (decisions, patterns), not raw data.
2. **Pattern enforcement at the skill level.** The `customer-call-summary` skill applies a PII rule by default — role-only attribution for customer-side names, no revenue figures, transcript/summary separation. The skill produces compliant output without anyone remembering to redact.
3. **Repo controls.** GitHub folder-level permissions restrict access by role. CI hooks (recommended for regulated industries) scan PRs for email regexes, SSN patterns, raw revenue numbers and block before merge. Add a `.git/hooks/pre-commit` or CI lint that fails on any of those patterns — even one team member doing this is enough.

For regulated industries (healthcare, finance, regulated B2B): bundle the PII rule, the GitHub permission model, and a CI scanner for compliance review before rollout. The rule, the skill, and the scanner together are what audit-grade looks like — not just the rule.

---

## 7. If Your Team Tried and Stalled

It happens. Usually around week 2-3 when the novelty fades and the habits haven't stuck. Don't restart from scratch.

**Diagnose the stall:**
- **Nobody's checking in content?** The habits aren't established. Pick the ONE most important habit (decision logs or call summaries) and focus only on that for 2 weeks. Drop everything else.
- **People checked in content but nobody queries it?** The value isn't visible yet. Run the 15-minute demo again with fresher data. Show a query that answers a question someone actually asked in Slack this week.
- **One person does everything?** That person will burn out. Switch to explicit ownership: analyst owns analytics/, eng lead owns engineering/, each PM owns their customer accounts. Distribute the load.
- **The repo went stale?** Run /freshness-check. Block 1 hour with the team. Divide stale files. Update, archive, or confirm. Reset.

**Recovery takes one session.** Not a new initiative. Not a team offsite. One hour where everyone updates their slice of the repo.

---

## 7a. PM OS Owners Rolling Out to Their Team

If you've been running Aakash's personal PM Operating System and now want to share with your team:

- Your PM OS files stay where they are. The Team OS scaffolds *around* your existing setup.
- Run `/upgrade-to-team-os` after reading [pm-os-migration.md](../pm-os-migration.md) — it covers the two real landmines (skill-name collisions with team skills, and the competitive-research restructure from flat files to per-competitor folders).
- Your sub-agents, personal context files, and personal skills like `/prd-draft` stay personal. The team gets the 6 shared skills (`customer-call-summary`, `decision-log-entry`, `feature-launch-gate`, `freshness-check`, `weekly-synthesis`, `portfolio-pulse`) plus the onboarding agent and `/customer-call` command.
- Tag your repo before running the upgrade so you can roll back cleanly.

The migration is the path most teams in Aakash's audience will take to install the Team OS. It's also the easiest path because most of the personal context (business info, competitive intel, PRDs) is already written and just needs to land in the team folders.

## 8. Startup Mode (2-5 People)

If you're a 3-person startup, the full repo looks heavy. Here's the minimum viable path:

**Delete these folders before your first commit** (the example data is for a hypothetical larger team):

- `product-development/data-engineering/` — you don't have a data engineer
- `product-development/product/meetings/` — you don't run formal sprint planning yet
- `product-development/product/workflows/` — bi-weekly sync isn't your cadence
- `product-development/product/sales-enablement/` — re-add when you hire a salesperson
- `product-development/product/processes/` — re-add when you have processes to document
- `product-development/product/product-context/` — re-add when you have onboarding need
- `team/onboarding-guides/onboarding-{data-engineering,analytics,strategy-ops}.md` — keep `general`, `product`, `engineering`, `design`, plus `github-101.md`
- `product-development/analytics/dashboards/`, `experiments/`, `investigations/` — re-add when you have any

**Strip the worked example down.** The `billing/` example ships across 9 folders. For a startup, keep `analytics/metrics/billing/`, `analytics/queries/billing/`, and `analytics/schemas/billing/`. Delete the others (PRD, RFC, plans, dashboards, experiments, investigations, bug-investigations) — you'll add them back as you actually accumulate them, per the "When to Expand" table in `MINIMAL-SETUP.md`.

**Strip the root CLAUDE.md down.** The team table ships with 6 rows; cut to your actual roles (PM, Eng, Designer is typical for 3 people). The Slack-channel table ships with 6 channels; cut to your actual channels (often just `#general` and `#eng`). Don't pretend to scale you don't have.

**Quick-mode the customer-call skill.** The full SKILL has 7 sections. For a startup with <10 customers, the analyst-grade insight tables and follow-up-email scaffolding are overkill. Use the **Quick variant** documented in `customer-call-summary/SKILL.md` — Executive Summary + Action Items + Relationship Signal. Three sections, two minutes.

**Skip the bi-weekly workflow.** Not your cadence. The `workflows/` folder is empty for you.

The point of MINIMAL-SETUP is to *not* drown you. Aggressively delete what you don't use today. You can always re-pull from this repo when you're a 10-person team.

## 9. Multi-Team Rollout (CPO / Head-of-Product)

If you're a PM leader rolling this out across multiple teams:

**One repo per team, not a monorepo.** Each team has their own context, their own customers, their own metrics. A shared monorepo creates noise and access-control headaches.

**Start with one team.** Get them to the 4-week milestone. Use their results to pitch the next team. Internal case studies beat mandates.

**Shared skills across teams.** The shared skills (customer-call-summary, decision-log-entry, feature-launch-gate, freshness-check, weekly-synthesis, portfolio-pulse) should be identical across teams. Publish them in a central location that teams clone from. This ensures cross-team analysis is possible: customer summaries from Team A and Team B follow the same format, the same gates apply at launch, and `/portfolio-pulse` can roll up across teams without per-team format-fixing.

**Cross-team digest is the `/portfolio-pulse` skill.** Each team gets their own `/weekly-synthesis` in their own channel for repo-level changes. The exec-grade cross-team rollup (account health, top risks, expansion signals, week's decisions) is `/portfolio-pulse` reading from each team's `accounts/portfolio.yaml` plus a config file at `~/.team-os/multi-team.yaml` that lists the teams. See `.claude/skills/portfolio-pulse/SKILL.md` for the multi-team setup.

**The CPO morning ritual.** Pair `/portfolio-pulse --mode=daily` with the workflow at `product/workflows/cpo-morning-ritual/` to produce a 5-minute morning synthesis with priorities, meeting briefs, and Slack drafts. Read-only — never modifies team repos.

**Governance is light.** Naming conventions, folder structure, the `feature-index.yaml` schema, and the portfolio.yaml status enums should be consistent across teams. Everything else is team-specific. Don't over-standardize.

**Mandate the floor, encourage the ceiling.** What's worth mandating across all teams: `/feature-launch-gate` (raises floor on what ships), `customer-call-summary` PII format (compliance + cross-team synthesis), `feature-index.yaml` (predictable cross-team queries). What's *not* worth mandating: which workflows each team runs, what their cadence is, which MCPs they connect.

## 9a. ROI Framing (Take to the CFO)

Activity metrics ("files added per week") are easy to track but hard to defend at a budget review. The metrics that justify this investment:

| Metric | How to measure | Baseline → target |
|--------|----------------|-------------------|
| **Time-to-customer-context** | Time between a leader's question ("what did Acme say last call?") and an answer | 25 min Slack archaeology → 30 sec query |
| **Time-to-decision-context** | Time between "why did we choose X?" and the answer with reasoning | 25 min meeting → instant |
| **New-hire ramp time** | Days to first meaningful contribution | Industry baseline 6-7 months → measure against your prior baseline |
| **Escalations caught earlier** | At-risk customers flagged via `portfolio.yaml#status` before they churn vs. surfacing post-churn | Track quarterly |
| **Launch-gate first-pass rate** | % of launches passing `/feature-launch-gate` without remediation | 0% pre-system → target 80%+ at month 6 |
| **Repo freshness** | % of files unchanged in 90+ days (`/freshness-check`) | Target < 30% |

### ROI Calculator (run before budget review)

Plug team-specific numbers into the formula below — single-decision math is misleading without frequency. CFO-ready version:

```
Hours saved per quarter =
    (decisions logged × lookups per decision × time saved per lookup)
  - (decisions logged × time to author the log)

Example: 10-person team, 90-day quarter
  decisions logged:           ~30 (per Hannah's DoorDash baseline)
  lookups per decision:       ~4 (different team members + future-self)
  time saved per lookup:      ~20 min (vs. Slack archaeology)
  time to author the log:     ~2 min

  Saved: 30 × 4 × 20 = 2,400 min  ≈ 40 hours
  Cost:  30 × 2     =     60 min  ≈  1 hour
  Net:                          ≈ 39 hours / quarter / team

Add: customer-call lookup savings, metric-definition lookup savings,
new-hire ramp savings (compute against your historical baseline).
```

Plug your team's actual numbers in. The numbers are specific enough to defend at a budget review and concrete enough to falsify if they don't materialize.

### Sensitivity Analysis (for the CFO who pushes back)

If you cut every input in half — half the decisions, half the lookups, half the time-saved — the math still positive:

```
Half-baseline scenario:
  decisions logged:        15
  lookups per decision:     2
  time saved per lookup:   10 min
  time to author the log:   2 min

  Saved: 15 × 2 × 10 = 300 min = 5 hours
  Cost:  15 × 2     =  30 min = 0.5 hour
  Net:                       = 4.5 hours / quarter / team
```

4.5 hours per quarter is a low bar. The system breaks even unless your decisions are looked up *less than once each on average*, which would mean you didn't need to log them at all. Worst-case ROI is ~zero, not negative.

Hannah's DoorDash team uses *3% of context window* on a typical query — that's the efficiency story for engineers. The harder ROI story for finance is the time-to-context lift across the team. Pick 2-3 of the metrics above and track them.

---

## 10. Measuring Adoption

How to know if the Team OS is working:

| Metric | How to Measure | Good Signal |
|--------|---------------|-------------|
| Files added per week | Git commit count | Increasing or stable after month 1 |
| Contributors per week | Unique committers | >50% of the team contributing monthly |
| Context questions in Slack | Track manually or search | Decreasing over time |
| Queries per week | Informal check-in | Team members querying independently |
| New member ramp time | Time to first meaningful contribution | Shorter than before Team OS |
| Feature launch gate pass rate | /feature-launch-gate results | Increasing first-pass rate |

You don't need to track all of these. Pick 1-2 that matter to your team and check them monthly.

## 11. Month-3 Scorecard: Ship It or Kill It

The number-one failure mode for AI tools is "everyone's enthusiastic for two weeks, then it dies in week 5." Set a kill-line in advance so you're not stuck defending a corpse.

### Three leading indicators (check at week 6)

| Indicator | Healthy | Warning | Kill |
|-----------|---------|---------|------|
| Weekly contributors | ≥ 50% of team | 25-50% | < 25% |
| Decisions logged in last 30 days | ≥ 70% of meetings with a decision | 30-70% | < 30% |
| Customer calls summarized | ≥ 80% of calls run through `/customer-call` | 50-80% | < 50% |

If you're in the **Warning** column on 2+ at week 6: run Section 7's recovery process (one-hour team session, divide ownership, refresh stale files). Reassess at week 8.

If you're in the **Kill** column on 2+ at week 6: don't keep paying the maintenance cost. Either find one power user who runs the Team OS solo (Hub-and-Spoke per the Section 3 model in the deep-dive — the PM queries the repo and shares outputs to the team), or sunset cleanly. Tell the team you're stopping and document why in `team/retros/`.

### Three leading indicators (check at month 3)

| Indicator | Healthy | Warning | Kill |
|-----------|---------|---------|------|
| Repo freshness (`/freshness-check`) | < 30% files stale | 30-50% | > 50% |
| Cross-team queries answering successfully | > 80% answered without escalation | 50-80% | < 50% |
| Adoption velocity (new contributors) | At least 1 new contributor per month | 1 every 2 months | < 1 per quarter |

A Team OS in Kill territory at month 3 isn't worth saving with another sprint of effort. The honest move is to retire it and recover the team's time. Honesty about failure is one of the differences between this and the last 30 AI hobby projects.

### What success looks like at month 6

- Files compounding (50+ commits per month)
- 80%+ of feature launches pass `/feature-launch-gate` first-pass
- New hires onboard in measurably less time than your prior baseline
- A leader can answer *"what did Acme say last quarter?"* in 30 seconds
- The team has added 1-2 skills or workflows beyond the starter kit

If none of those are happening, the team has a different problem than the Team OS can solve.
