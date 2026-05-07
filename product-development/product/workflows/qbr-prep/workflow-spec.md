# QBR Prep Workflow Spec

## Overview

A four-step workflow that produces a QBR outline for one customer. Each step writes a section to `output/{customer-slug}-qbr-{YYYY-Q}.md` so progress is visible.

## Process Flow

```
1. Create dated output file
2. Step 1: Account Pull         → "Account Context" section
3. Step 2: Adoption Metrics     → "Adoption & Health" section
4. Step 3: Narrative Draft      → "Narrative" section (Highlights / Lowlights / Roadmap)
5. Step 4: Export               → push to slides via MCP (optional)
```

## What Changes Every Quarter vs. What's Stable

### Changes every quarter

- Adoption metrics (usage, deploys, active users)
- Highlights / lowlights (last 90 days of calls and tickets)
- Open issues and escalations
- Roadmap items shipping next quarter affecting this account

### Stable across quarters (carried forward)

- Account history (signed date, original use case, contract terms)
- Champion + economic buyer (unless they changed)
- Strategic context for the relationship (their goals, our shared narrative)

## Output Section Shape

```markdown
## Account Context

| | |
|---|---|
| **Account** | {Customer Name} |
| **Champion** | {Their role} (named with permission for QBR use) |
| **Economic buyer** | {Their role} |
| **Renewal date** | {YYYY-MM-DD} |
| **ARR** | ${amount} |
| **CSM** | {Our name} |
| **Last 90 days** | {N calls, N tickets, N escalations} |

## Adoption & Health

| Metric | Last quarter | This quarter | Δ |
|--------|--------------|--------------|---|
| Active users | {N} | {N} | {+/-} |
| Deploys | {N} | {N} | {+/-} |
| Feature adoption (new this Q) | — | {N of M} | — |
| NPS / CSAT | {score} | {score} | {+/-} |

Health score: {1-5} ({trend})

## Narrative

### Highlights (last 90 days)

- {Wins, milestones, expansion signals}
- {Quotes from calls — role-attributed unless permissioned for external use}

### Lowlights (last 90 days)

- {Open escalations, stalled adoption, missed milestones}
- {Be honest — customers can tell when you're sandbagging}

### Roadmap (Next 90 days)

- {Shipping for them: features from feature-index.yaml#area.feature}
- {Pilot opportunities}
- {Things we won't ship and why}

### Asks of Customer

- {What we need from them: feedback, references, intros}

## Next Steps

- [ ] {Action} — Owner: {Name} — Due: {Date}
```

## Conventions

- **Permissioned quotes only.** Internal-summary quotes are role-attributed (PII rule). For QBR use, names require explicit permission per `customers/case-studies/permissions.yaml`. Default to role attribution if in doubt.
- **Honest lowlights.** Sandbagging the lowlights costs trust over time.
- **Asks reciprocate.** Every "us delivering" item should have a paired "you contributing" item — references, beta tester, design partner, etc.

## When the Account Has Material Risk

If the account is `at-risk` per `portfolio.yaml#status`, the workflow flags it and adds a "Risk Register" section before the Narrative. CSM should not run a QBR on an at-risk account without first running the `customer-escalation` workflow.

## Reference

After running this workflow once, save a strong example to `reference/{customer-slug}-qbr-{YYYY-Q}.md` so future runs have a template.
