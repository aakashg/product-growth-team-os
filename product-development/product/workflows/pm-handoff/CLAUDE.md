# PM Handoff Workflow

When a PM is leaving the team (different role, different company, parental leave, sabbatical), this workflow sweeps the repo for everything they know that isn't yet written down — and produces a handoff document the successor can read cold.

## When to Run

- 4 weeks before the outgoing PM's last day (gives time to fill gaps)
- 1 week before, again, to catch what's accumulated since
- The outgoing PM's last week, with the successor in the room

## Files

| File | Purpose |
|------|---------|
| `workflow-spec.md` | Process flow, sweep checklist, sign-off criteria |
| `step-1-portfolio-sweep.md` | Walk every account; transition `account_owner` and update `account-context.md` |
| `step-2-decision-revisit.md` | Walk recent decisions; add "outgoing PM's hindsight notes" |
| `step-3-drafts-and-bets.md` | Surface unshipped drafts and untested bets to `strategy/vision/` |
| `step-4-warm-intros.md` | List people the successor needs intros to before the PM leaves |
| `step-5-final-doc.md` | Produce `team/handoffs/{outgoing-pm}-{date}.md` |

## Output

`team/handoffs/{outgoing-pm}-{YYYY-MM-DD}.md` — single doc the successor reads on Day 1.

## Why a Workflow, Not a Skill

Handoffs evolve over weeks. The outgoing PM remembers different things at different times — running the workflow once produces an incomplete handoff. Re-running 1-2x catches what's surfaced since.

For the authoring pattern, see [how-to-author-a-new-workflow.md](../how-to-author-a-new-workflow.md).
