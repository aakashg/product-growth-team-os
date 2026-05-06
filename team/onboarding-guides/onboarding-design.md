# Onboarding: Design

Setup and orientation specific to designers.

> Read [onboarding-general.md](onboarding-general.md) **first** — Day 1-5 reading list and warning about under-populated repos. This guide layers design-specifics on top.

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

- [Design CLAUDE.md](../../product-development/design/CLAUDE.md) — design folder structure: audits, research-syntheses, reviews, design-system
- [Design System](../../product-development/design/design-system/CLAUDE.md) — component rationale, token rationale, changelog
- [UX Audit Example](../../product-development/design/audits/example-2026-04-15-pricing-page-audit.md) — model your audits on this shape
- [Product CLAUDE.md](../../product-development/product/CLAUDE.md) — product context, pillars
- [Customer Insights](../../product-development/product/customers/CLAUDE.md) — UX findings, frustrations, quotes (call summaries have a UX Findings subsection)
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
| UX audits | `design/audits/{YYYY-MM-DD}-{topic}.md` |
| Cross-call research syntheses | `design/research-syntheses/{topic}-{quarter}.md` |
| Design-review logs | `design/reviews/{YYYY-MM-DD}-{feature}.md` |
| Design system rationale | `design/design-system/components/{name}.md`, `design/design-system/tokens.md`, `design/design-system/changelog.md` |
| Per-feature design rationale | PRD (in the design rationale section) or `product/decisions/{date}-{topic}.md` |
| Per-customer UX findings | `product/customers/accounts/{customer}/account-context.md` + the **UX Findings** subsection of call summaries |

## Note on Figma vs Repo

Source-of-truth design files live in Figma. This repo holds:
- Links to Figma files in `feature-index.yaml` under each feature (use file IDs, not display names — see `design/CLAUDE.md` for the URL stability convention)
- Design rationale (PRDs and decision log entries)
- UX audits (`design/audits/`)
- Cross-call research syntheses (`design/research-syntheses/`)
- Design-system rationale and changelog (`design/design-system/`)
- Design-review logs (`design/reviews/`)

You don't need to mirror Figma into the repo. Make sure every shipped feature has a Figma link in `feature-index.yaml` and any non-trivial design choice has either a PRD section or a decision log entry.

## Figma URL Stability

Use file IDs, not display names. A URL like `figma.com/file/abc123/Pricing-Redesign-v3` keeps working when the file is renamed because `abc123` is stable. The slug after the ID is decorative. For specific frames, append `?node-id=42:128`. Full convention in [design/CLAUDE.md](../../product-development/design/CLAUDE.md#figma-url-stability).
