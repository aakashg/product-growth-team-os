# QBR Prep Workflow

Generate a customer-facing Quarterly Business Review draft for a single account in 5 minutes. CSM-owned. Pulls account context, recent calls, adoption metrics, expansion signals, and risks into a deck-ready outline.

## Files

| File | Purpose |
|------|---------|
| `workflow-spec.md` | Process flow — what changes per QBR, what's stable across quarters |
| `step-1-account-pull.md` | Pull account context, last quarter's activity, current state |
| `step-2-adoption-metrics.md` | Pull adoption / usage / health data |
| `step-3-narrative-draft.md` | Draft the QBR narrative (Highlights / Lowlights / Roadmap / Next Quarter) |
| `step-4-export.md` | Export to slides (Google Slides / Notion / etc.) |

## When to Run

- 2 weeks before each QBR
- Re-run if the account changes materially (champion turns over, escalation lands)

## Inputs

- The account slug (e.g., `example-customer`)
- The QBR date
- The CSM running the QBR

The workflow reads:
- `customers/accounts/{slug}/account-context.md`
- `customers/accounts/{slug}/calls/summaries/` (last 90 days)
- `customers/accounts/portfolio.yaml` for cross-account positioning
- `feature-index.yaml` for what shipped affecting this account

## Output

`output/{customer-slug}-qbr-{YYYY-Q}.md` — a structured outline ready to drop into slides.

## Why This Is a Workflow, Not a Skill

QBRs touch multiple sources, evolve cycle-over-cycle (last quarter's "Next Quarter" becomes this quarter's "Highlights"), and need PM/eng input on the roadmap section. A skill would over-automate; the multi-step workflow gives the CSM review points.

For the authoring pattern, see [how-to-author-a-new-workflow.md](../how-to-author-a-new-workflow.md).
