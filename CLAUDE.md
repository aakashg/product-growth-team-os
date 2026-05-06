# [Your Product] — Team OS

Your team's shared knowledge base. Every document, decision, metric definition, and customer insight lives in a structure that AI agents and humans can query.

> Replace `[Your Product]` and the bracketed placeholders below with your actual values during initial setup. Keep this file under ~150 lines — it loads every session.

## Team

| Function | Team Member | GitHub | Linear / Jira / Asana ID | Slack ID |
|----------|-------------|--------|--------------------------|----------|
| PM | [Your Name] | `[github]` | `[id]` | `[slack-id]` |
| Eng Lead | [Name] | `[github]` | `[id]` | `[slack-id]` |
| Engineer | [Name] | `[github]` | `[id]` | `[slack-id]` |
| Designer | [Name] | `[github]` | `[id]` | `[slack-id]` |
| Analytics | [Name] | `[github]` | `[id]` | `[slack-id]` |
| Strategy & Ops | [Name] | `[github]` | `[id]` | `[slack-id]` |

## Slack Channels

| Channel | ID | Visibility | Purpose |
|---------|----|--------|---------|
| `#[team]-product` | `[id]` | Private | PRD reviews, roadmap, feature prioritization |
| `#[team]-eng` | `[id]` | Private | Engineering discussion, deploys, incidents |
| `#[team]-design` | `[id]` | Private | Design critiques, asset reviews, UX research |
| `#[team]-data` | `[id]` | Private | Metrics, experiments, dashboards |
| `#[team]-launches` | `[id]` | Public | Launch coordination, GTM updates |
| `#[team]-incidents` | `[id]` | Public | Production incidents, postmortems |

## Doc Index

**When looking up artifacts for a specific feature (PRDs, RFCs, plans, schemas, dashboards, experiments, tickets), check `product-development/feature-index.yaml` first.** It maps every feature to all related artifacts in one place.

| Area | File | Description |
|------|------|-------------|
| Feature index | `product-development/feature-index.yaml` | Master lookup — every feature mapped to its PRDs, RFCs, plans, schemas, experiments, tickets |
| Data catalog | `product-development/analytics/data-catalog.yaml` | Warehouse table registry — owner, refresh, upstream, used-by |
| Product | `product-development/product/CLAUDE.md` | Product context, pillars, segments, terminology |
| PRDs | `product-development/product/PRDs/` | PRDs by product area |
| Customers | `product-development/product/customers/CLAUDE.md` | Account folders — context, calls, transcripts |
| Competitive research | `product-development/product/competitive-research/CLAUDE.md` | Competitor matrix and per-competitor teardowns |
| Strategy | `product-development/product/strategy/` | `roadmaps/`, `vision/`, `business-context/` |
| Decisions | `product-development/product/decisions/CLAUDE.md` | Non-architectural decisions (pricing, GTM, scoping) with reasoning |
| Launch emails | `product-development/product/launch-emails/` | Customer-facing launch communications |
| Sales enablement | `product-development/product/sales-enablement/` | Sales-facing docs, pitch decks, onboarding flows |
| Processes | `product-development/product/processes/` | Operational processes and checklists |
| Product context | `product-development/product/product-context/` | Reference docs for your product's systems |
| Meetings | `product-development/product/meetings/` | Standup, sprint planning, bi-weekly — docs / transcripts / summaries |
| Workflows | `product-development/product/workflows/` | Multi-step workflow specs (e.g., bi-weekly update) |
| Engineering | `product-development/engineering/CLAUDE.md` | Plans, RFCs, bug investigations — by product area |
| Data engineering | `product-development/data-engineering/CLAUDE.md` | Pipeline plans and RFCs — by product area |
| Analytics | `product-development/analytics/CLAUDE.md` | Metrics, queries, schemas, dashboards, experiments, investigations, playbooks |
| Design | `product-development/design/CLAUDE.md` | Design rationale (artifacts live in Figma, linked from feature-index) |
| Team | `team/` | Onboarding guides, retros, adoption playbook |

## Three Rules

1. **Summaries first, raw data in subfolders.** A one-hour call becomes a 500-token summary in `summaries/`. Raw transcripts sit in `transcripts/` for when the summary isn't enough. Every level of nesting is a context-saving decision.
2. **Every folder has a CLAUDE.md navigation file.** Update it when you add files. This is how Claude finds things without burning tokens searching.
3. **The repo gets updated before a feature ships.** Run `/feature-launch-gate`. No exceptions. Hannah's enforcement rule: *"The feature is not rolled out until the repository is updated."*

## Quick Start

- **New team member?** Read [team/onboarding-guides/onboarding-general.md](team/onboarding-guides/onboarding-general.md) and the role-specific guide for your function.
- **Small team (2-5 people)?** Read [MINIMAL-SETUP.md](MINIMAL-SETUP.md) — start with 3 folders and 5 files.
- **Already have Aakash's PM OS?** Run `/upgrade-to-team-os` (~2 minutes). See [pm-os-migration.md](pm-os-migration.md).
- **Never used Git before?** Read [team/onboarding-guides/github-101.md](team/onboarding-guides/github-101.md) — 5 commands, 10 minutes.

## Where Different Roles Check In Work

| Role | Primary Folders | What to Check In |
|------|----------------|------------------|
| PM | `product/decisions/`, `product/customers/accounts/`, `product/PRDs/`, `product/strategy/` | Decision logs, call summaries, PRDs, strategy |
| Engineer | `engineering/plans/`, `engineering/rfcs/`, `engineering/bug-investigations/` | Plans, RFCs, bug investigations |
| Data Engineer | `data-engineering/plans/`, `data-engineering/rfcs/`, `analytics/data-catalog.yaml`, `analytics/schemas/` | Pipeline plans, schema docs, data-catalog entries |
| Designer | `product/decisions/`, `product/customers/accounts/`, `product/PRDs/` (rationale sections) | Design rationale, UX findings, design audit results |
| Analyst | `analytics/metrics/`, `analytics/queries/`, `analytics/dashboards/`, `analytics/experiments/`, `analytics/investigations/` | Metric definitions, SQL, schemas, experiment results |
| Strategy / Ops | `product/customers/accounts/`, `product/competitive-research/`, `product/strategy/`, `product/processes/` | Call summaries, competitive intel, vision docs |

## Branch Protection (Recommended)

GitHub: Settings → Branches → Add rule for `main`:
- Require pull request reviews (at least 1 approval)
- Prevents accidental pushes and ensures review

## Credits

This repo extends [Hannah Stulberg's open-source Team OS example repo](https://github.com/in-the-weeds-hannah-stulberg/team-os-example-repo) (CC BY-NC 4.0). Hannah's structural patterns — `feature-index.yaml`, `data-catalog.yaml`, product-area subfoldering, SKILL.md folder convention, role-specific onboarding — power most of what's here. See [LICENSE](LICENSE) for the derivative-work attribution.

Skills, freshness/synthesis/launch-gate, decision log, PII rules, and the PM-OS migration path are added by [Aakash Gupta](https://www.news.aakashg.com/).
