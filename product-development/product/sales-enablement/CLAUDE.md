# Sales Enablement

Pitch material, talk tracks, objection handling, persona briefs, and battlecards. Sales-facing — sized to be useful 5 minutes before a call.

## Folders

| Folder | What's Here |
|--------|-------------|
| `battlecards/{competitor}.md` | Two-page battlecard per competitor: their pitch, our counter, proof points, traps to avoid |
| `talk-tracks/{stage}.md` | Talk tracks per deal stage: discovery, demo, pricing, negotiation, closing |
| `personas/{role}.md` | Buyer-persona briefs: their job, their fears, their criteria, their objections |
| `objection-handling/{topic}.md` | Top objections (price, security, integrations, "we'll build it") with one-page responses |

## Cross-References

| Source | Used Here |
|--------|-----------|
| `competitive-research/competitors/{competitor}/` | Raw intel that battlecards distill |
| `customers/case-studies/` | Permissioned testimonials and full case studies for proof points |
| `feature-index.yaml` | What's actually shipped (sales pitching unshipped features is the #1 sales ↔ PM friction) |
| `decisions/` | Why we made the choices we made (use to defuse "why don't you do X?" objections) |

## Conventions

- **One file per artifact** — battlecards / talk tracks are easiest to scan as standalone pages
- **Date the last update** at the top of every file. If it's > 90 days old, freshness-check flags it for refresh
- **Owner is the AE Lead or Head of Sales** — not the PM. PM provides input; sales owns the artifact

## When Sales Loses a Deal to Competitor X

1. Capture in `customers/win-loss/{date}-{deal-name}.md` (template below)
2. Update the battlecard at `battlecards/{competitor}.md` if the loss revealed a new attack pattern
3. Surface in the next bi-weekly to PM via `weekly-synthesis`

For onboarding, see [onboarding-sales.md](../../../team/onboarding-guides/onboarding-sales.md).
