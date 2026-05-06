# Data Engineering

Pipeline plans and RFCs for the data platform. Mirrors `engineering/` in shape — type-first, area-second.

## Folders

| Folder | What's Here |
|--------|-------------|
| `plans/{area}/` | Pipeline implementation plans |
| `rfcs/{area}/` | Pipeline architecture proposals (new ingestion, transformation, schema migrations) |

## Product Areas

Use the same product-area subfolders that engineering and analytics use. The starter template ships with `billing/` as the worked example.

## Naming Conventions

- **Plans:** `{pipeline-name}.md`
- **RFCs:** `{pipeline-name}-rfc.md`

## Where Schema Docs Live

Schema docs (column-level table documentation) live under `analytics/schemas/{area}/` so analysts and PMs can find them where they query. The data-catalog (`analytics/data-catalog.yaml`) is the canonical registry of tables — owner, refresh cadence, upstream source.

When you ship a new table:
1. Add an entry to `analytics/data-catalog.yaml`
2. Write the schema doc at `analytics/schemas/{area}/{table}.md`
3. Reference both from your pipeline plan

## When to Write a Plan vs RFC

- **RFC:** new pipeline, schema migration, change of source-of-truth, switching warehouses
- **Plan:** implementing what an existing RFC covers, smaller scoped changes

For onboarding, see [onboarding-data-engineering.md](../../team/onboarding-guides/onboarding-data-engineering.md).
