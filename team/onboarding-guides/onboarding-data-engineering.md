# Onboarding: Data Engineering

Setup and orientation specific to data engineers.

## Setup

See [General Onboarding](onboarding-general.md#setup) for shared tools.

### Data Engineering-Specific Tools

| Tool | Purpose | Access |
|------|---------|--------|
| Warehouse (Snowflake / BigQuery / Redshift) | Data warehouse | Admin or developer access |
| dbt | Transformations | Request from manager |
| Fivetran / Airbyte / custom Kafka | Ingestion | Admin access |
| Snowpipe / streaming infra | Real-time ingestion | Admin access |
| Airflow / Dagster / Prefect | Orchestration | Admin access |
| Terraform / Pulumi | Infra as code | Repo access |

## Key Documents

- [Data Engineering CLAUDE.md](../../product-development/data-engineering/CLAUDE.md) — pipeline plans and RFCs by product area
- [Data Catalog](../../product-development/analytics/data-catalog.yaml) — every warehouse table, owner, refresh cadence, upstream
- [Analytics CLAUDE.md](../../product-development/analytics/CLAUDE.md) — how analysts use the tables you ship

## Skills You'll Use

- `/feature-launch-gate` — verifies pipeline plan and RFC exist before a data feature ships
- `/freshness-check` — finds stale schema docs

## First Tasks

- [ ] Get warehouse admin / developer access
- [ ] Read the data-catalog.yaml end-to-end
- [ ] Read the most recent pipeline RFC in your area (`data-engineering/rfcs/{area}/`)
- [ ] Trace one production table from ingestion through transformation to dashboard
- [ ] Document one undocumented table — register in data-catalog.yaml + schema doc

## Where Your Work Lives

| Artifact | Location |
|----------|----------|
| Pipeline plans | `data-engineering/plans/{area}/{name}.md` |
| Pipeline RFCs | `data-engineering/rfcs/{area}/{name}-rfc.md` |
| New tables | Register in `analytics/data-catalog.yaml`, add `analytics/schemas/{area}/{table}.md` |
| Streaming/Snowpipe configs | Infra repo, not here — but link from the pipeline plan |

## Ownership Boundary

You own:
- Ingestion + transformation pipelines
- Warehouse schemas (DDL)
- Refresh cadence and SLAs
- The data-catalog.yaml entries

Analysts own:
- Metric definitions on top of your tables
- SQL queries
- Dashboards

If a table you produce is missing a column an analyst needs, that's a pipeline RFC, not just an analyst-side query change.
