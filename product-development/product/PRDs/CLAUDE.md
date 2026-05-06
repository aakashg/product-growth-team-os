# PRDs

Product Requirements Documents organized by product area.

## Naming

`PRDs/{area}/{slug}-prd.md` — for example `PRDs/billing/credit-usage-dashboard-prd.md`.

Use the same product-area subfolders that `engineering/`, `data-engineering/`, and `analytics/` use, so a single feature lives at the same path across folders.

## When You Write a PRD

1. Save to `PRDs/{area}/{slug}-prd.md`
2. Register in `feature-index.yaml` under `{area}.{feature}`
3. Add the Figma URL to the feature-index entry, not the PRD body (so renames don't break links)
4. Cross-reference the engineering plan, RFC, and analytics docs once they exist

## PRD Structure

Use whatever structure your team has standardized on. Common starting structure:

1. **Hypothesis** (one sentence, testable)
2. **Problem** (who has it, how bad, with data)
3. **Strategic fit** (why this vs alternatives)
4. **Solution** (specifics, not vague descriptions)
5. **Success metrics** (numbers, plus guardrails)
6. **Non-goals** (what we're NOT doing)

For AI features, add behavior examples (15-25 input/output pairs), edge cases, and eval criteria.
