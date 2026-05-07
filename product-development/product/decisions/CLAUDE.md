# Decisions

Decision log for the team. Each file is one decision with full reasoning, options considered, and tradeoffs accepted.

Use this folder for **non-architectural** decisions: pricing, GTM, scoping, prioritization, vendor selection, partnerships. Architectural decisions go in `engineering/rfcs/{area}/`. Significant design choices typically go in the PRD or as a decision log entry.

## How to Read

For any "why did we choose X?" question, search this folder first. Files are named by date and topic: `{YYYY-MM-DD}-{topic}.md`. Same-day decisions with overlapping topics use a 2-digit sequence suffix (`{YYYY-MM-DD}-{topic}-01.md`, `-02.md`).

## Recent Decisions

> Append new decisions to the **bottom** of this list (don't insert in the middle — that creates merge conflicts when two PMs file decisions on the same day). One bullet per line, one decision per bullet. Keep the list to the most recent ~10; older decisions are still searchable but don't need to be in the index.

- [2026-02-14-usage-based-pricing.md](2026-02-14-usage-based-pricing.md) — Chose tiered pricing with usage guardrails over per-seat and credit pools (Full variant example)
- [example-2026-05-01-quick-decision.md](example-2026-05-01-quick-decision.md) — Pushed demo by 2 days so dashboard ships first (Quick variant example)

## How to Add

Use the `/decision-log-entry` skill after any meeting where a decision is made. Two minutes to write, saves ~25 minutes the next time someone asks "why did we choose this?"

Two variants:
- **Full entry** — for decisions debated with multiple options
- **Quick entry** — for fast decisions (under 75 words)

See `.claude/skills/decision-log-entry/SKILL.md` for the format.

## Lifecycle

When a decision is reversed or superseded, **don't delete the old entry**. Update its `Status` field to `Superseded by [link]` or `Reversed on [date] — see [link]`. The history of why we changed our minds is as valuable as the original decision.
