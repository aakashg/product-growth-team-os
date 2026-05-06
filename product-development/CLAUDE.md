# Product Development

All product development artifacts — product, engineering, data engineering, analytics, design.

## Doc Index

**Check `feature-index.yaml` first** when looking up artifacts for a specific feature. It maps every feature to all related artifacts in one place.

| Path | Description |
|------|-------------|
| `feature-index.yaml` | Master feature index — feature → PRD, RFC, plan, schema, dashboard, experiments, tickets |
| `analytics/data-catalog.yaml` | Warehouse table registry — owner, refresh, upstream, used-by |
| [product/CLAUDE.md](product/CLAUDE.md) | PRDs, strategy, customers, competitive research, decisions, meetings, workflows |
| [engineering/CLAUDE.md](engineering/CLAUDE.md) | Engineering plans, RFCs, bug investigations — organized by product area |
| [data-engineering/CLAUDE.md](data-engineering/CLAUDE.md) | Data pipeline plans and RFCs — organized by product area |
| [analytics/CLAUDE.md](analytics/CLAUDE.md) | Metrics, queries, schemas, dashboards, experiments, investigations, playbooks |
| [design/CLAUDE.md](design/CLAUDE.md) | Design rationale (artifacts live in Figma, linked from feature-index) |

## Product Areas

This repo organizes most artifacts (PRDs, plans, RFCs, queries, metrics, schemas, dashboards, experiments, investigations, bug investigations) into **product-area subfolders**. Pick a consistent set of areas and use them everywhere — same folder names across `product/PRDs/`, `engineering/plans/`, `analytics/metrics/`, etc.

The starter template uses `billing/` as a worked example. Replace with your team's product areas.

> Tip: Hannah's repo uses 5 areas (`billing`, `home-page`, `prototyping`, `starter-templates`, `deployment`). Most teams need 4-7. Fewer than 3 means you don't need subfoldering yet; more than 8 usually means some should merge.
