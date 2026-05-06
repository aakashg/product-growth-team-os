# Product Growth Team OS Starter Kit

Your team's shared knowledge base. Built for AI-native product teams of any size.

Created by [Aakash Gupta](https://www.news.aakashg.com/) based on implementations by [Hannah Stulberg](https://hannahstulberg.substack.com/) (DoorDash), [Dave Killeen](https://www.linkedin.com/in/davekilleen/) (Pendo), and [Gabor Meyer](https://www.linkedin.com/in/gabormayer/) (Google).

Extends Hannah's [open-source Team OS example repo](https://github.com/in-the-weeds-hannah-stulberg/team-os-example-repo) with shared skills, analytics templates, and adoption tools.

## Quick Start

### Small team (2-5 people)
Read **MINIMAL-SETUP.md**. You need 3 folders and 5 files. Start there.

### Full setup (new to Team OS)
1. Edit CLAUDE.md: add your team roster, channels, and product context
2. Check in 10 documents your team asks about most
3. Push to GitHub
4. Show a teammate a query on Monday

### Upgrading from PM OS
Run `/upgrade-to-team-os` in Claude Code. Scaffolds the team structure around your existing setup in ~2 minutes. See pm-os-migration.md for details.

## What's Inside

```
team-os/
├── CLAUDE.md                      ← Root routing table (loaded every session)
├── MINIMAL-SETUP.md               ← Lightweight guide for small teams
├── pm-os-migration.md             ← Guide for PM OS owners
├── .gitignore                     ← Keeps secrets and junk out of the repo
├── .github/
│   └── pull_request_template.md   ← Standardized PR descriptions
├── .claude/
│   ├── team-learnings.md          ← Accumulated patterns and mistakes
│   ├── commands/
│   │   └── upgrade-to-team-os.md  ← One-command PM OS upgrade
│   ├── hooks/
│   │   └── session-start.md       ← Auto-inject team context every session
│   └── skills/
│       ├── customer-call-summary.md    ← Consistent call summaries (with PII rules)
│       ├── decision-log-entry.md       ← Full + quick entry variants
│       ├── feature-launch-gate.md      ← Full + lightweight modes
│       ├── freshness-check.md          ← With stable file exceptions
│       └── weekly-synthesis.md         ← With empty-week handling
├── product-development/
│   ├── CLAUDE.md
│   ├── product/
│   │   ├── CLAUDE.md              ← Includes design artifact guidance
│   │   ├── customers/             ← Customer accounts + call summaries
│   │   ├── competitive-research/
│   │   ├── PRDs/
│   │   ├── strategy/
│   │   │   └── current-quarter.md
│   │   ├── decisions/             ← With example entry + quick variant
│   │   ├── launch-emails/
│   │   └── workflows/
│   ├── analytics/
│   │   ├── CLAUDE.md
│   │   ├── billing/               ← Full example: metrics, SQL (multi-warehouse), schemas, playbooks
│   │   └── onboarding/            ← Metrics template
│   └── engineering/
│       ├── CLAUDE.md              ← With bug template and naming conventions
│       ├── bugs/
│       └── rfcs/
└── team/
    ├── CLAUDE.md
    ├── adoption-playbook.md       ← Slack pitch, demo script, rituals, multi-team, failure recovery
    ├── onboarding/
    │   ├── new-member-guide.md    ← Technical + non-technical paths, FAQ
    │   └── github-101.md          ← 5 commands, HTTPS/SSH troubleshooting, common errors
    └── retros/
```

## The 5 Shared Skills

| Skill | What It Does | Variants |
|-------|-------------|----------|
| /customer-call-summary | Structured call summary with PII protection | Works with transcript, dictation, or guided prompts |
| /decision-log-entry | Decision record with reasoning | Full entry (debated decisions) + Quick entry (fast decisions) |
| /feature-launch-gate | Pre-launch repo completeness check | Full gate (major launches) + Lightweight (small changes) |
| /freshness-check | Scan for stale and broken files | With stable-file exceptions and recovery guidance |
| /weekly-synthesis | Weekly summary of all repo changes | With empty-week handling and contributor celebration |

## Works With

The architecture is tool-agnostic. Examples use Claude Code, but the structure works with:
- **Cursor** (.cursor/skills/ equivalent)
- **GitHub Copilot** (.github/copilot-instructions.md)
- **OpenAI Codex** (AGENTS.md)
- **Any tool that reads markdown files in a repo**

## Credits

- Structure: [Hannah Stulberg's Team OS example repo](https://github.com/in-the-weeds-hannah-stulberg/team-os-example-repo)
- Agent patterns: [Gabor Meyer's PM agents](https://github.com/gabormayer/pm)
- Living files concept: [Dave Killeen's DEX system](https://github.com/davekilleen/dex)
- Harness engineering: [OpenAI's published methodology](https://openai.com/index/harness-engineering/)

## Deep Dive

Read the full guide: [How to Build a Team OS](https://www.news.aakashg.com/) (Product Growth Newsletter)
