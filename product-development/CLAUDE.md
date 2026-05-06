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

## Bootstrapping a New Product Area

When a new product area emerges (often during an incident — a bug fires in `auth/` and you don't have an `auth/` folder yet), bootstrap the scaffolding so artifacts have a consistent home. **Checklist:**

```sh
# 1. Create the area folders across every parent folder that uses product-area subfolders
AREA=auth
mkdir -p \
  product-development/engineering/{plans,rfcs,bug-investigations}/$AREA \
  product-development/data-engineering/{plans,rfcs}/$AREA \
  product-development/analytics/{metrics,queries,schemas,dashboards,experiments,investigations}/$AREA \
  product-development/product/PRDs/$AREA
```

```yaml
# 2. Add a top-level key in product-development/feature-index.yaml
auth:
  # features get added below as they're scoped
```

```markdown
# 3. Add a row to the Product Areas table in:
#    - product-development/engineering/CLAUDE.md
#    - (and analytics CLAUDE.md if you use a per-area row there)
| Auth | `auth/` | Sessions, tokens, SSO, MFA |
```

Optional but recommended once the area has 2+ artifacts:
- Drop a 5-line `CLAUDE.md` in each subfolder (`engineering/plans/auth/CLAUDE.md` etc.) describing what's there
- Update `accounts/portfolio.yaml` if any account is meaningfully impacted

**Mid-incident shortcut:** if you're scaffolding under pressure, do step 1 only. Defer steps 2-3 to the postmortem (`incident-response.md` Step 5 covers this).
