# Onboarding: Analytics

Setup and orientation specific to analysts and data scientists.

## Setup

See [General Onboarding](onboarding-general.md#setup) for shared tools.

### Analytics-Specific Tools

| Tool | Purpose | Access |
|------|---------|--------|
| Warehouse (Snowflake / BigQuery / Redshift) | SQL queries | Request from data eng |
| BI tool (Sigma / Mode / Looker / Tableau) | Dashboards | Request from manager |
| Product analytics (Amplitude / Mixpanel / Heap) | Funnels, retention | Request from manager |
| dbt (if used) | Transformations | Request from data eng |
| Hex / Jupyter | Notebooks for ad-hoc analysis | Request from manager |

## Key Documents

- [Analytics CLAUDE.md](../../product-development/analytics/CLAUDE.md) — folder structure: metrics, queries, schemas, dashboards, experiments, investigations, playbooks
- [Data Catalog](../../product-development/analytics/data-catalog.yaml) — every warehouse table you'll query
- [Feature Index](../../product-development/feature-index.yaml) — every feature mapped to its metrics, queries, dashboards, experiments
- [Decisions Log](../../product-development/product/decisions/CLAUDE.md) — pricing decisions, experiment outcomes

## Folder Structure

The analytics folder is organized type-first, area-second:

| Folder | What's Here |
|--------|-------------|
| `metrics/{area}/` | Metric definitions per product area |
| `queries/{area}/` | SQL queries per product area |
| `schemas/{area}/` | Column-level table docs per product area |
| `dashboards/{area}/` | Dashboard docs per product area |
| `experiments/{area}/` | Experiment design and results per product area |
| `investigations/{area}/` | Ad-hoc investigations per product area |
| `playbooks/` | Repeatable analysis playbooks (flat — playbooks are cross-area) |

## Skills You'll Use

- `/feature-launch-gate` — for analytics owners, this is your launch checklist
- `/freshness-check` — find queries that may need re-validation

## First Tasks

- [ ] Get warehouse access and run a starter query against `users` or equivalent
- [ ] Read the data-catalog.yaml end-to-end (it's short)
- [ ] Read the most recent investigation in your area (`investigations/{area}/`)
- [ ] Pick one metric from `metrics/{area}/` and audit its definition against current data
- [ ] Check in your first SQL query into `queries/{area}/` — even a one-liner

## Where Your Work Lives

| Artifact | Location |
|----------|----------|
| Metric definitions | `analytics/metrics/{area}/{topic}-metrics.md` |
| SQL queries | `analytics/queries/{area}/{name}.sql` |
| Schema docs | `analytics/schemas/{area}/{table}.md` |
| Dashboards | `analytics/dashboards/{area}/{topic}-dashboards.md` |
| Experiment design + results | `analytics/experiments/{area}/{name}-{date}-experiment-results.md` |
| Investigations | `analytics/investigations/{area}/{date}-{topic}.md` |
| New tables | Register in `data-catalog.yaml`, add schema doc, link from feature-index.yaml |

## When Something Ships

Per the launch gate: every shipped feature needs a metric definition, SQL query, and schema doc registered in `feature-index.yaml`. If you own analytics for the area, you own those files. The PM owns making sure they exist before launch.
