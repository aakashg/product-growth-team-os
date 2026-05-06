# Analytics

Metrics, queries, schemas, dashboards, experiments, investigations, and playbooks.

## Folder Structure

This folder is **type-first, area-second**. Each top-level folder holds a content type; product-area subfolders sit inside.

| Folder/File | Description |
|-------------|-------------|
| `data-catalog.yaml` | Warehouse table registry — owner, refresh, upstream, used-by |
| `metrics/{area}/` | Metric definitions per product area |
| `queries/{area}/` | SQL query patterns per product area |
| `schemas/{area}/` | Column-level table docs per product area |
| `dashboards/{area}/` | Dashboard docs per product area (links to Sigma / Mode / Looker / Tableau) |
| `experiments/{area}/` | Experiment design and results per product area |
| `investigations/{area}/` | Ad-hoc investigations per product area |
| `playbooks/` | Repeatable analysis playbooks (flat — playbooks are cross-area) |

## Why This Shape

- **Looking up "where's the SQL for billing?"** → `queries/billing/`. One folder, scoped to type.
- **Looking up "everything we know about billing?"** → check `feature-index.yaml#billing`, follow the links.
- **Cross-area metric like activation?** Goes under whichever area owns it (likely `onboarding/` or `growth/`).

The starter template ships with `billing/` as a worked example: a metrics file, a SQL query, a schema doc, and a churn investigation playbook. Use it as a pattern when adding your own areas.

## Data Sources

Replace this table with your team's actual data sources:

| Source | Description | Access |
|--------|-------------|--------|
| Snowflake / BigQuery / Redshift | Primary data warehouse | SQL via warehouse connector |
| Segment / Rudderstack | Event tracking — user actions, feature usage | Workspace access |
| Amplitude / Mixpanel / Heap | Product analytics — funnels, retention | Dashboard access |
| Stripe | Billing data — plan tiers, revenue, churn | Stripe dashboard + warehouse sync |

## Core Metrics

Replace this table with your team's actual core metrics:

| Metric | Definition | Target |
|--------|------------|--------|
| Activation Rate | % of new users who complete the activation event within 7 days | > 40% |
| 7-day Retention | % of new users who return within 7 days | > 45% |
| Net Revenue Retention | (Beginning MRR + expansion - churn - contraction) / Beginning MRR | > 110% |

## Working With This Folder

- **New metric?** Add to `metrics/{area}/{topic}-metrics.md`, register in feature-index.yaml.
- **New SQL query?** Save to `queries/{area}/{name}.sql` with a header comment explaining purpose, owner, and last verification date.
- **New table from data engineering?** Register in `data-catalog.yaml` and add the schema doc to `schemas/{area}/{table}.md`.
- **Running an experiment?** Drop the design + results in `experiments/{area}/{name}-{date}-experiment-results.md`.
- **One-off investigation?** Save to `investigations/{area}/{date}-{topic}.md` so the next person doesn't redo the work.

For onboarding, see [onboarding-analytics.md](../../team/onboarding-guides/onboarding-analytics.md).
