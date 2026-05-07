# PRDs

Product Requirements Documents organized by product area.

## Naming

`PRDs/{area}/{slug}-prd.md` — for example `PRDs/billing/credit-usage-dashboard-prd.md`.

Use the same product-area subfolders that `engineering/`, `data-engineering/`, and `analytics/` use, so a single feature lives at the same path across folders.

## When to Use a PRD vs. an RFC vs. a Decision Log

This is the most common routing question for new PMs. Quick rule:

| Use a... | When |
|----------|------|
| **PRD** | Building a feature. The artifact answers "what are we building, for whom, why, with what success metrics, and what's out of scope?" |
| **Engineering RFC** | Choosing an architecture. The artifact answers "what's the technical design, why this over alternatives, what risks?" Lives in `engineering/rfcs/{area}/`. |
| **Data engineering RFC** | Same, for data pipelines and warehouse schema changes. Lives in `data-engineering/rfcs/{area}/`. |
| **Decision log entry** | Anything that's neither a feature spec nor an architectural choice — pricing, GTM, scoping, vendor selection, hiring. Lives in `product/decisions/`. |

If a single change spans two: a feature with a non-trivial architectural choice usually has both a PRD (what / why / metrics) and an RFC (how). They cross-reference each other via `feature-index.yaml`.

If you're stuck: write the PRD first. If during the PRD you realize there's a real architectural choice with multiple options, fork the architectural choice into an RFC.

## When You Write a PRD

1. Save to `PRDs/{area}/{slug}-prd.md`
2. Register in `feature-index.yaml` under `{area}.{feature}`
3. Add the Figma URL to the feature-index entry, not the PRD body (so renames don't break links)
4. Cross-reference the engineering plan, RFC, and analytics docs once they exist

## PRD Structure

Use whatever structure your team has standardized on. Common starting structure:

1. **Hypothesis** (one sentence, testable, with magnitude and window)
2. **Problem** (who has it, how bad, with data)
3. **Strategic fit** (why this vs alternatives)
4. **Solution** (specifics, ranked by ship priority, with explicit non-goals)
5. **Success metrics** (numbers, plus guardrails)
6. **User stories** (table: as a / I want / so that)
7. **Edge cases** (what breaks, who hits it)
8. **Alternatives considered** (why we didn't pick them)
9. **Open questions** (what we still need to resolve)
10. **Rollout plan** (dated)
11. **Sign-off** (named reviewers per role)

For AI features, add behavior examples (15-25 input/output pairs), edge cases, and eval criteria.

## Worked Example

Study [`billing/credit-usage-dashboard-prd.md`](billing/credit-usage-dashboard-prd.md) — a fully-built worked example with inline coach notes that teach what each section is *for*. Use it as the model for your first PRD.
