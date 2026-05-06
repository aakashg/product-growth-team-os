# Bug Investigations

Production bug investigations, organized by product area. Each investigation lives in its own folder so artifacts (logs, attached queries, postmortem) can sit alongside the plan.

## Folder Pattern

```
bug-investigations/{area}/bug-{MM-DD-YYYY}-{slug}/
├── investigation-plan.md      # the canonical writeup (Symptoms / Steps / Root Cause / Fix / Prevention)
├── attached/                  # logs, screenshots, query outputs (optional)
└── postmortem.md              # public-facing postmortem if customer-impacting (optional)
```

## Recent Investigations

> **Add a row when you create a new investigation directory — same commit.** Append to the **bottom** of the table to avoid merge conflicts when two engineers file the same day. Older entries scroll off but stay searchable in the folder tree.

| Date | Area | Bug | Investigation |
|------|------|-----|---------------|
| 2026-03-12 | billing | Stripe webhook duplicates causing double-charge | [bug-03-12-2026-credit-double-charge/](billing/bug-03-12-2026-credit-double-charge/investigation-plan.md) |

## When You're Paged

1. Search `ls bug-investigations/{area}/` — has this fired before?
2. If yes, read the prior investigation's **Root Cause** section first
3. If no, create a new directory in real time as you investigate
4. **If the area folder doesn't exist at all** (new product area), `mkdir -p bug-investigations/{area}/{bug-folder}/` and continue — defer the rest of the [area-bootstrap checklist](../../CLAUDE.md#bootstrapping-a-new-product-area) to your postmortem
5. Read the [incident-response playbook](../playbooks/incident-response.md) if you need a refresh on the process

## Why a Folder per Bug

Investigations need attached artifacts (Stripe webhook logs, query outputs, runbook screenshots, customer support thread excerpts). A single markdown file forces you to either inline them (noisy) or paste somewhere else (unsearchable). The folder pattern lets you `cp` artifacts in, reference them from the investigation plan, and ship them as part of the historical record.

For investigations that genuinely don't need artifacts, the plan file alone is fine — just keep the folder pattern so the structure is consistent.

## Naming

- Date format: `MM-DD-YYYY` (matches Hannah's open-source repo and avoids the European/American ambiguity of `MM/DD`)
- Slug: kebab-case, descriptive enough to scan at 2 AM (`credit-double-charge`, not `bug-1`)
- Plan filename: always `investigation-plan.md` so cross-references are stable
