# Onboarding: Design

Setup and orientation specific to designers.

## Setup

See [General Onboarding](onboarding-general.md#setup) for shared tools.

### Design-Specific Tools

| Tool | Purpose | Access |
|------|---------|--------|
| Figma | Design system, prototypes, files | Workspace invite |
| FigJam | Whiteboard sessions, journey maps | Same workspace |
| User research repo (Dovetail / Maze / Notion) | Research synthesis | Request from research lead |
| Loom | Async design walkthroughs | Free or team license |

## Key Documents

- [Design CLAUDE.md](../../product-development/design/CLAUDE.md) — design folder structure (artifacts live in Figma; this repo holds rationale)
- [Product CLAUDE.md](../../product-development/product/CLAUDE.md) — product context, pillars
- [Customer Insights](../../product-development/product/customers/CLAUDE.md) — UX findings, frustrations, quotes
- [Decisions Log](../../product-development/product/decisions/CLAUDE.md) — design rationale entries

## Skills You'll Use

- `/decision-log-entry` — log significant design choices with reasoning
- `/customer-call` — partner with PM on user research summaries

## First Tasks

- [ ] Get Figma access and walk through the design system
- [ ] Read the three most recent PRDs to understand what's shipping
- [ ] Read the last three customer call summaries — look for UX issues
- [ ] Shadow a customer call this week and capture UX observations
- [ ] Add your first design decision log entry

## Where Your Work Lives

| Artifact | Location |
|----------|----------|
| Source design files | Figma (linked from `feature-index.yaml`) |
| Design rationale | `product/decisions/{YYYY-MM-DD}-{topic}.md` |
| User research findings | `product/customers/accounts/{customer}/account-context.md` (per-customer) or PRD (per-feature) |
| UX audits | `product/decisions/` with full audit attached |
| Design system docs | Figma library (linked from this repo's product CLAUDE.md) |

## Note on Figma vs Repo

Source-of-truth design files live in Figma. This repo holds:
- Links to Figma files (in `feature-index.yaml` under each feature)
- Design rationale (decision log entries)
- User research findings
- Cross-cutting UX audits

You don't need to mirror Figma into the repo. Just make sure every shipped feature has a Figma link in `feature-index.yaml` and any non-trivial design choice has a decision log entry.
