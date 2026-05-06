---
name: freshness-check
description: Scan the repo for stale and broken files. Categorizes by age tier, respects stable-reference exceptions, surfaces broken cross-references, and flags files that should have been updated but weren't.
---

# Freshness Check

Scan the Team OS repo for stale content and flag files that may need updating.

## When to Use

- Run weekly as automation (recommended)
- Run manually before quarterly planning
- Run when onboarding a new team member (clean up before they query)
- Run after a period of low activity to assess what needs catching up

## What It Does

1. Scans all files in `product-development/` and `team/` (excluding `.claude/` and files listed in `.freshness-ignore`)
2. Checks last modified date via git log
3. Categorizes files into freshness tiers
4. Checks for broken references (files that link to things that don't exist)
5. Identifies files that SHOULD have been updated but weren't (e.g., `metrics/{area}/` for a product area that shipped a feature recently per `feature-index.yaml`)

## Freshness Tiers

| Tier | Age | Label | Action |
|------|-----|-------|--------|
| Fresh | < 30 days | ✅ | No action |
| Aging | 30-90 days | 🟡 | Review if still accurate |
| Stale | 90-180 days | 🟠 | Flag to owner for update or archival |
| Archive candidate | 180+ days | 🔴 | Consider moving to `archive/` |

## Stable File Exceptions

Some files are legitimately stable and should NOT be flagged as stale:
- `analytics/schemas/` (table structures rarely change)
- `analytics/playbooks/` (investigation methodologies are stable)
- `team/onboarding-guides/` (guides don't change weekly)
- `.claude/skills/` (skills are updated intentionally, not on a schedule)
- `.claude/agents/`, `.claude/commands/`
- `LICENSE`

If a file is in one of these paths, note: "Stable reference material — verify with owner only if the underlying system changed."

To add custom exceptions, create a `.freshness-ignore` file in the repo root listing paths to skip (one per line, supports wildcards).

## Output Format

```
## Freshness Check — {Date}

### Aging (30-90 days — review if still accurate)
- product-development/product/competitive-research/competitors/lovable/tldr.md — 45 days — Owner: {from roster}
- ...

### Stale (90-180 days — needs update or archival)
- product-development/product/decisions/2025-11-pricing-v1.md — 178 days — Owner: {from roster}
- ...

### Archive Candidates (180+ days)
- {file} — {days} — Owner: {from roster}
- ...

### Broken References
- {file} references "{target}" but no matching file found
- ...

### Should-Have-Been-Updated
- analytics/metrics/billing/credit-usage-metrics.md hasn't changed in 75 days, but feature-index.yaml#billing.credit-usage-dashboard shipped 12 days ago. Likely stale.

### Recovery Suggestions (if many files are stale)
If 30%+ of files are stale, the repo needs a recovery session:
1. Block 1 hour with the team
2. Divide stale files among owners
3. Each person: update, archive, or confirm still accurate
4. Re-run freshness check to verify

### Summary
- Total: {N} | Fresh: {N} ({X}%) | Aging: {N} | Stale: {N} | Archive: {N}
- Broken references: {N}
```

## Rules

1. Never auto-delete or auto-archive. Only flag. A human decides.
2. Assign stale files to owners using the team roster from root CLAUDE.md.
3. If Slack MCP is connected, post the summary to the team channel.
4. If 50%+ of files are stale, add the recovery session suggestion prominently.
5. Cross-reference `feature-index.yaml` to find documents that should have been updated when a feature shipped.
