# Win-Loss

Capture every meaningful deal outcome — wins, losses, no-decisions, churns. Sales-owned, surfaced to PM via the bi-weekly synthesis.

## When to Add an Entry

- **Win** — deal closes
- **Loss to competitor** — they chose someone else (always log; this is the highest-signal data the team gets)
- **No decision** — they said no but for non-competitive reasons (timing, budget, internal priorities)
- **Churn** — paying customer cancels or downgrades to free

Entries above $X ARR (set per-team) or strategic accounts always get logged. Smaller deals can be sampled or batched.

## File Naming

`{YYYY-MM-DD}-{outcome}-{customer-slug}.md`

Examples:
- `2026-04-15-win-acme-corp.md`
- `2026-04-20-loss-competitor-a-bravo-inc.md`
- `2026-04-22-churn-charlie-systems.md`

## Template

```markdown
# {Outcome}: {Customer}

**Date:** {YYYY-MM-DD}
**Outcome:** Win | Loss to {competitor} | No-decision | Churn
**ARR:** ${amount} (or band)
**Sales owner:** {Name from team roster}
**Buyer (PII allowed if internal-only):** {Title at customer}
**Cycle length:** {N days from first call to outcome}

## Why They Did / Didn't Buy

{2-3 sentences capturing the deciding factor. Be honest — "we lost to Competitor A on price" is more useful than "they had budget concerns".}

## What Worked

- {Specific moments that moved the deal}

## What Didn't

- {Where we stumbled — especially if it's a pattern}

## Top Feature Asks (Loss / No-decision Only)

- {Feature} — link to feature-index entry if it exists, or flag as new request

## Competitive Notes (If Relevant)

- {What we learned about competitor behavior in the deal}
- Update battlecard: yes / no / partial

## What I'd Do Differently Next Time

- {1-2 sentences. The most valuable section. Skip if there's nothing.}
```

## Surfacing to PM

The `weekly-synthesis` skill scans this folder weekly and surfaces:
- Loss patterns (3+ losses to the same competitor in a quarter = pattern, escalate to PM)
- Repeated feature asks across losses (3+ deals with the same missing feature)
- Cycle length trends

PMs can request feature-index updates from this data. Sales can request battlecard updates.

## What Doesn't Go Here

- Internal reasons we didn't pursue a deal (those are in `decisions/`)
- Pipeline sentiment (that's in your CRM)
- Forecast adjustments (CRM)
- Customer pain themes that didn't lead to a sale (those are in `customer-call-summary` files via discovery calls)
