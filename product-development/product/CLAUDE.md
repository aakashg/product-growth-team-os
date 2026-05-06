# Product

Product context, customer insights, strategy, decisions, PRDs, and supporting collateral.

## Folder Structure

```
product/
├── PRDs/                  # PRDs by product area
├── strategy/              # roadmaps, vision, business-context
├── customers/             # accounts/{customer}/ — context, calls, transcripts
├── competitive-research/  # competitor matrix + per-competitor folders
├── decisions/             # non-architectural decisions with reasoning
├── meetings/              # standup, sprint-planning, team-bi-weekly — docs/transcripts/summaries
├── workflows/             # multi-step workflow specs (e.g. bi-weekly-update)
├── launch-emails/         # customer-facing launch communications
├── sales-enablement/      # sales-facing docs, pitch decks, onboarding flows
├── processes/             # operational processes and checklists
└── product-context/       # reference docs for your product's systems
```

Each folder has its own CLAUDE.md. Architectural docs live in `engineering/` and `data-engineering/` (siblings of `product/`).

## Key Context

Replace these placeholders during initial setup:

- **Product:** [Your Product] — [one-sentence description]
- **North Star:** [what your team is optimizing for]
- **Primary persona:** [who you're building for]
- **Key differentiator:** [why customers choose you]

## Current Quarter Priorities

1. [Priority 1]
2. [Priority 2]
3. [Priority 3]

Pull these from [`strategy/roadmaps/current-quarter.md`](strategy/roadmaps/current-quarter.md).

## Key Documents

| Purpose | Path |
|---------|------|
| Roadmap | `strategy/roadmaps/current-quarter.md` |
| Vision | `strategy/vision/` |
| Business context | `strategy/business-context/` |
| Competitive matrix | `competitive-research/competitors/competitive-matrix.md` |
| Customer accounts | `customers/CLAUDE.md` |
| PRDs | `PRDs/` (organized by product area) |
| Decisions | `decisions/CLAUDE.md` |

## Terminology

Replace this table with your team's product terminology so Claude uses your team's vocabulary in summaries:

| Term | Definition |
|------|------------|
| [Term] | [Definition] |
| [Term] | [Definition] |

## Where Design Artifacts Live

Source-of-truth design files live in **Figma**, linked from `feature-index.yaml` under each feature. This repo holds:

- **Per-feature design rationale** → in the PRD or as a decision log entry
- **Per-customer UX findings** → in `customers/accounts/{customer}/account-context.md` or call summaries
- **Cross-cutting design decisions** → `decisions/`
- **Design system rationale** → `../design/CLAUDE.md` (sibling of product/)
