# Decision Log Entry

Record a team decision with full reasoning. Takes ~2 minutes. Saves ~25 minutes every time someone asks "why did we choose X?"

## When to Use

After any meeting where the team made a decision. If someone might ask "why did we do it this way?" in three months, log it.

Two variants:

**Full entry** — for decisions the team debated with multiple options. Use the full template below.

**Quick entry** — for fast decisions that didn't involve formal deliberation. Use the quick template.

## Input

Provide:
- What was decided
- What other options were considered (if any)
- Why this option won
- What you gave up by choosing it
- Who was in the room

Can be dictated, typed, or extracted from meeting notes/transcript.

## Full Entry Format

Save to: `product-development/product/decisions/[YYYY-MM-DD]-[topic-slug].md`

```markdown
# [Decision Title — verb + noun, e.g., "Chose Usage-Based Pricing"]

**Date:** [YYYY-MM-DD]
**Decided by:** [Names]
**Status:** Active | Superseded by [link] | Reversed on [date]

## Options Considered

1. **[Option A]** — [One sentence: what it involved and why it was attractive]
2. **[Option B]** — [One sentence: what it involved and why it was attractive]

## Decision

[Option chosen]. [One sentence on why.]

## Reasoning

[2-3 sentences expanding on the why. Include data, customer feedback, or technical constraints if available.]

## Tradeoff Accepted

[What you gave up. Be specific.]

## Revisit Conditions

[Under what circumstances should this decision be reconsidered? E.g., "If churn exceeds 5%" or "When we expand to enterprise."]

## Related

- [Link to relevant PRD, metric, or other file in the repo]
```

## Quick Entry Format

For decisions made quickly without formal deliberation:

```markdown
# [Decision Title]

**Date:** [YYYY-MM-DD]
**Decided by:** [Names]
**Status:** Active

**Decision:** [What was decided and why, in 2-3 sentences.]

**Context:** [What prompted this decision. One sentence.]
```

## Rules

1. Full entries: under 200 words. Quick entries: under 75 words. This is a log, not a doc.
2. Always include at least 2 options in full entries. If the team didn't consider alternatives, note: "No alternatives formally considered — fast decision based on [reason]." Or use the quick entry format.
3. After saving, update product-development/product/decisions/CLAUDE.md with the new entry.
4. The "Reasoning" section must answer WHY, not WHAT. "We chose X" is not reasoning. "We chose X because our cost ratio is 22x" is reasoning.
5. When a decision is reversed or superseded, don't delete the old entry. Update its Status field to "Superseded by [link to new decision]" or "Reversed on [date] — see [link]". The history of why we changed our minds is as valuable as the original decision.
6. Use the team roster from root CLAUDE.md for the "Decided by" field. If someone not on the roster was involved, add their role: "[Name], VP Sales (not on core team)."
