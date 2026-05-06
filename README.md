# Product Growth Team OS Starter Kit

Your team's shared knowledge base. Built for AI-native product teams of any size.

Created by [Aakash Gupta](https://www.news.aakashg.com/) and [Hannah Stulberg](https://hannahstulberg.substack.com/), based on Hannah's implementation at DoorDash and patterns from [Dave Killeen](https://www.linkedin.com/in/davekilleen/) (Pendo) and [Gabor Meyer](https://www.linkedin.com/in/gabormayer/) (Google).

This repo extends [Hannah's open-source Team OS example repo](https://github.com/in-the-weeds-hannah-stulberg/team-os-example-repo) (CC BY-NC 4.0) with shared skills, analytics templates, adoption tools, and a PM-OS migration path.

## Quick Start

### Small team (2-5 people)

Read [MINIMAL-SETUP.md](MINIMAL-SETUP.md). You need 3 folders and 5 files. Start there.

### Full setup (new to Team OS)

1. Edit [CLAUDE.md](CLAUDE.md) — add your team roster, Slack channels, and product context
2. Replace the `billing/` placeholder with your actual product areas across PRDs, plans, RFCs, analytics
3. Stub `feature-index.yaml` and `analytics/data-catalog.yaml` with your real features and tables (the file headers show the format)
4. Push to GitHub
5. Show one teammate three queries on Monday — see [team/adoption-playbook.md](team/adoption-playbook.md)

### Upgrading from Aakash's PM OS

Run `/upgrade-to-team-os` in Claude Code. Scaffolds the team structure around your existing setup in ~2 minutes without overwriting any personal files. See [pm-os-migration.md](pm-os-migration.md).

## What's Inside

```
team-os/
├── CLAUDE.md                                    ← root routing table (loaded every session)
├── LICENSE                                      ← CC BY-NC 4.0, attributing Hannah's source repo
├── MINIMAL-SETUP.md                             ← lightweight guide for small teams
├── pm-os-migration.md                           ← guide for PM OS owners
├── .gitignore
├── .github/
│   └── pull_request_template.md
├── .claude/
│   ├── team-learnings.md                        ← accumulated patterns and PII rules
│   ├── agents/onboarding.md                     ← walks new hires through onboarding
│   ├── commands/
│   │   ├── customer-call.md                     ← orchestrator that invokes the call-summary skill
│   │   └── upgrade-to-team-os.md
│   ├── hooks/session-start.md
│   └── skills/                                  ← SKILL.md folder convention with frontmatter
│       ├── customer-call-summary/
│       │   ├── SKILL.md
│       │   └── examples/example-2026-01-27.md
│       ├── decision-log-entry/SKILL.md
│       ├── feature-launch-gate/SKILL.md
│       ├── freshness-check/SKILL.md
│       └── weekly-synthesis/SKILL.md
├── product-development/
│   ├── feature-index.yaml                       ← master feature → artifacts lookup
│   ├── CLAUDE.md
│   ├── product/
│   │   ├── PRDs/{area}/                         ← PRDs by product area
│   │   ├── customers/accounts/{customer}/       ← context, calls/summaries, calls/transcripts
│   │   ├── competitive-research/competitors/{competitor}/
│   │   ├── strategy/{roadmaps,vision,business-context}/
│   │   ├── decisions/                           ← non-architectural decisions
│   │   ├── meetings/{standup,sprint-planning,team-bi-weekly}/
│   │   ├── workflows/bi-weekly-update/          ← worked example: spec, steps, reference
│   │   ├── launch-emails/
│   │   ├── sales-enablement/
│   │   ├── processes/
│   │   └── product-context/
│   ├── engineering/
│   │   ├── plans/{area}/
│   │   ├── rfcs/{area}/
│   │   └── bug-investigations/{area}/bug-{date}-{slug}/
│   ├── data-engineering/
│   │   ├── plans/{area}/
│   │   └── rfcs/{area}/
│   ├── analytics/                               ← type-first / area-second
│   │   ├── data-catalog.yaml                    ← warehouse table registry
│   │   ├── metrics/{area}/
│   │   ├── queries/{area}/
│   │   ├── schemas/{area}/
│   │   ├── dashboards/{area}/
│   │   ├── experiments/{area}/
│   │   ├── investigations/{area}/
│   │   └── playbooks/                           ← cross-area playbooks
│   └── design/                                  ← rationale (artifacts live in Figma)
└── team/
    ├── CLAUDE.md
    ├── adoption-playbook.md
    ├── onboarding-guides/                       ← general + 6 role-specific files
    │   ├── onboarding-general.md
    │   ├── onboarding-product.md
    │   ├── onboarding-engineering.md
    │   ├── onboarding-design.md
    │   ├── onboarding-analytics.md
    │   ├── onboarding-data-engineering.md
    │   ├── onboarding-strategy-ops.md           ← non-technical contributors
    │   └── github-101.md
    └── retros/
```

## The 5 Shared Skills

| Skill | What It Does |
|-------|--------------|
| `/customer-call-summary` (paired with `/customer-call` command) | Structured call summary with insight + feature-request tables, follow-up email, Slack draft. PII-safe by default |
| `/decision-log-entry` | Decision record with reasoning. Full + quick variants |
| `/feature-launch-gate` | Pre-launch repo completeness check across PRD, RFC, metrics, queries, schemas, feature-index entry |
| `/freshness-check` | Scan for stale and broken files with stable-reference exceptions |
| `/weekly-synthesis` | Weekly summary of repo changes, Slack-ready |

## Two Registries That Carry the System

- `product-development/feature-index.yaml` — every feature mapped to its PRD, RFC, plan, schema, dashboard, experiments, tickets. Check this first when looking up artifacts for a specific feature.
- `product-development/analytics/data-catalog.yaml` — warehouse table registry: owner, refresh cadence, upstream source, used-by.

These two files are the single biggest "make AI find things in one hop" lever in the repo.

## Works With

The architecture is tool-agnostic. Examples use Claude Code, but the structure works with:

- **Cursor** (`.cursor/skills/` equivalent — same SKILL.md folder convention)
- **GitHub Copilot** (`.github/copilot-instructions.md`)
- **OpenAI Codex** (`AGENTS.md` at the same root level as `CLAUDE.md`)
- **Any tool that reads markdown files in a repo**

## Portability (If You Switch AI Vendors)

**The repo is plain markdown and YAML in folders.** Nothing about the team's institutional knowledge depends on Anthropic, Claude, or any specific harness. If you switch from Claude Code to Cursor, OpenAI Codex, GitHub Copilot, or a future entrant: the only file that needs renaming is `CLAUDE.md` → the new tool's equivalent (`AGENTS.md`, `.cursor/...`, `.github/copilot-instructions.md`). The skills convert in an afternoon — the SKILL.md folder pattern is the cross-tool standard. Your decisions, customer summaries, metrics, schemas, and PRDs survive untouched.

The harness is swappable. The institutional memory isn't.

## Credits and License

- Structure: [Hannah Stulberg's open-source Team OS](https://github.com/in-the-weeds-hannah-stulberg/team-os-example-repo) — `feature-index.yaml`, `data-catalog.yaml`, product-area subfoldering, SKILL.md folder convention, role-specific onboarding, customer-call workflow
- Agent patterns inspired by: [Gabor Meyer's PM agents](https://github.com/gabormayer/pm)
- Living-files concept: [Dave Killeen's DEX system](https://github.com/davekilleen/dex)
- Harness engineering: [OpenAI's published methodology](https://openai.com/index/harness-engineering/)
- Aakash extensions: 5 shared skills (freshness-check, weekly-synthesis, feature-launch-gate, decision-log-entry, customer-call-summary), PII rules, MINIMAL-SETUP path, PM-OS migration, adoption playbook

License: CC BY-NC 4.0. See [LICENSE](LICENSE).

## Deep Dive

Read the full guide: [How to Build a Team OS](https://www.news.aakashg.com/) (Product Growth Newsletter)
