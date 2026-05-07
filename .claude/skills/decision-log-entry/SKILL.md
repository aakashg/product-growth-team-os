---
name: decision-log-entry
description: Record a team decision with reasoning, options, and tradeoffs. Two variants — full entry for debated decisions, quick entry for fast ones. Saves ~25 minutes the next time someone asks "why did we choose X?"
---

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

Save to: `product-development/product/decisions/{YYYY-MM-DD}-{topic-slug}.md`

```markdown
# [Decision Title — verb + noun, e.g., "Chose Usage-Based Pricing"]

**Date:** [YYYY-MM-DD]
**Decided by:** [Names from team roster]
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

- [Link to relevant PRD, RFC, metric file, or feature-index entry]
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

## Relationship to RFCs and PRDs

Hannah's repo logs architectural rationale in RFCs and design rationale in PRDs. We add a decisions/ folder for decisions that don't fit either — pricing, GTM, scoping, prioritization, vendor selection. If your decision is purely architectural, log it in `engineering/rfcs/{area}/{slug}-rfc.md` instead.

## Hindsight Notes (Add as the Decision Ages)

Decisions get a `## Hindsight` section appended over time as the team learns whether the call was right. Examples:

```markdown
## Hindsight

- 2026-05-20 (3 months in): The assumption that competitor X would stay ecosystem-locked is starting to break. They shipped an open API. Revisit revisit-conditions if their adoption accelerates.
- 2026-08-01 (6 months in, outgoing PM): Watched the cost ratio settle at 18x, not the 22x we modeled. Tier B's pricing should be re-tuned. Successor should review.
```

Run the `/pm-handoff` workflow before a PM departure — it sweeps recent decisions and prompts hindsight notes.

## Same-Day Decisions

If two decisions land on the same day, file names like `2026-05-06-vendor-x.md` and `2026-05-06-launch-delay.md` don't collide because the slugs differ. **If two decisions on the same day would have overlapping slugs**, append a 2-digit sequence: `2026-05-06-pricing-01.md`, `2026-05-06-pricing-02.md`. Before writing, `ls` the decisions folder for files matching the date prefix to detect collisions.

## Forward References

If your decision cites a file that hasn't been written yet (a customer-call summary about to be filed, a PRD scoped but not started), don't fabricate the link. Use a `[PENDING:]` marker so future readers know it's intentional, not broken:

```markdown
## Related

- [PENDING: customers/accounts/acme/calls/summaries/2026-05-06.md] — call that prompted this decision
- `../PRDs/billing/example-feature-prd.md`
```

The `/freshness-check` skill flags `[PENDING:]` markers older than 14 days so they don't rot indefinitely.

## Rules

1. Full entries: under 200 words. Quick entries: under 75 words. This is a log, not a doc.
2. Always include at least 2 options in full entries. If the team didn't consider alternatives, note: "No alternatives formally considered — fast decision based on [reason]." Or use the quick entry format.
3. After saving, **append** to the bottom of the "Recent Decisions" list in `product-development/product/decisions/CLAUDE.md` (one bullet per line, one decision per bullet). Don't insert in the middle — that creates merge conflicts when two PMs file decisions the same day. If you hit a merge conflict on the index, keep both bullets and re-sort by date+sequence.
4. The "Reasoning" section must answer WHY, not WHAT. "We chose X" is not reasoning. "We chose X because our cost ratio is 22x" is reasoning.
5. When a decision is reversed or superseded, don't delete the old entry. Update its Status field to "Superseded by [link to new decision]" or "Reversed on [date] — see [link]". The history of why we changed our minds is as valuable as the original decision.
6. Use the team roster from root CLAUDE.md for the "Decided by" field. If someone not on the roster was involved, add their role: "[Name], VP Sales (not on core team)."
