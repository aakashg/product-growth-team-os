# Feature Launch Gate

Verify the Team OS repo is updated before a feature ships. Two modes: full gate for major launches, lightweight for small changes.

## When to Use

Before any feature launch: /feature-launch-gate [feature-name]

For small changes (bug fixes, copy updates): /feature-launch-gate [feature-name] --lightweight

## Full Gate Checklist

### Product Context
- [ ] PRD exists in product-development/product/PRDs/ for this feature
- [ ] Decisions made during development are logged in product-development/product/decisions/

### Design (if applicable)
- [ ] UX research findings checked in (if user research was conducted)
- [ ] Design rationale documented in a decision log entry (if significant design choices were made)

### Analytics
- [ ] Metric definitions for this feature checked into the relevant analytics/[area]/metrics.md
- [ ] SQL queries for key metrics verified by analyst and saved in analytics/[area]/queries/
- [ ] Table schemas for any new tables documented in analytics/[area]/schemas/
- [ ] Dashboard link added (if applicable)

### Engineering
- [ ] New technical decisions documented in engineering/rfcs/ (if applicable)
- [ ] Known limitations or edge cases documented

### Navigation
- [ ] All new files have entries in their folder's CLAUDE.md
- [ ] product-development/CLAUDE.md updated if new folders were created

## Lightweight Gate Checklist

For small changes that don't add new metrics or tables:

- [ ] If a decision was made, it's logged
- [ ] If a new metric was added, it's defined
- [ ] Relevant CLAUDE.md files are updated

## Output Format

```
## Feature Launch Gate: [Feature Name]
## Mode: [Full / Lightweight]

### PASSED (X/Y)
- ✅ PRD exists: product-development/product/PRDs/[file]
- ✅ Metric definitions updated: analytics/billing/metrics.md
- ...

### FAILED (X/Y)
- ❌ No SQL queries found for new metrics. Expected in: analytics/billing/queries/
- ❌ Dashboard link not added
- ...

### NOT APPLICABLE (X/Y)
- ➖ No new tables created — schema check skipped
- ➖ No UX research conducted — design check skipped
- ...

### VERDICT: [PASS / BLOCKED]
[If BLOCKED: list specific files that need creation or updates]
```

## Rules

1. Full gate: if ANY analytics item fails, the feature is BLOCKED. Other items are warnings.
2. Lightweight gate: advisory only. List what's missing but don't block.
3. Be specific about what's missing and where it should go.
4. The PM owns resolving failures. They can delegate but own completion.
5. Items that genuinely don't apply (no new tables = no schema needed) should be marked NOT APPLICABLE, not FAILED.
