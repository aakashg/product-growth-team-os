# PM Handoff Workflow Spec

## Goal

Reduce the "everything was in the PM's head" failure mode of role transitions. The outgoing PM's responsibility: every load-bearing thought is in the repo. The workflow forces it.

## Process Flow

```
1. Create dated handoff doc at team/handoffs/{pm-slug}-{YYYY-MM-DD}.md
2. Step 1: Portfolio sweep      → transition account ownership, update Open Loops
3. Step 2: Decision revisit     → add hindsight notes to recent decisions
4. Step 3: Drafts and bets      → surface unshipped work to strategy/vision/
5. Step 4: Warm intros          → list people who need intros before the PM leaves
6. Step 5: Final doc            → assemble handoff doc, walk through with successor
```

## What Changes vs. What's Stable

This is a one-time workflow per departure — it's all "changes." But within it:

- **Mechanical sweep** (portfolio.yaml, account-context Open Loops) is fast
- **Judgment work** (decision hindsight notes, what's worth carrying forward in strategy) is slow

## Output Section Shape

```markdown
# PM Handoff: {Outgoing PM} → {Successor or "TBD"}

**Last day:** {YYYY-MM-DD}
**Successor:** {Name or "Hiring in progress"}
**Walked through with successor on:** {Date}

## Portfolio Transition

| Account | Previous owner | New owner | Status | Notes |
|---------|----------------|-----------|--------|-------|

## Open Loops Inventory

(Sweep across every account-context.md Open Loops section. Every loop must have a named successor owner.)

| Account | Loop | New owner | Notes |
|---------|------|-----------|-------|

## Decisions With Hindsight Notes

(Recent decisions that the outgoing PM would re-evaluate. Append to each decision file's Status / Reasoning section. Listed here as a pointer.)

| Decision | Hindsight note |
|----------|----------------|
| 2026-XX-XX-{topic}.md | "Watched this for N months — the assumption that X is starting to break. Revisit by 2026-Q3." |

## Unshipped Drafts and Untested Bets

(Surface to strategy/vision/. Drafts the outgoing PM started but didn't ship. Untested bets that should be in the next PM's planning cycle.)

| Artifact | Status | Where it lives |
|----------|--------|----------------|

## Warm Intros Needed

| Person | Their role | Why successor needs them | Intro by |
|--------|-----------|--------------------------|----------|

## What I'd Do Differently

(2-3 paragraphs from the outgoing PM. Honest. The most valuable section.)

## What's Working — Don't Break

(2-3 paragraphs. Patterns, processes, relationships that the new PM should preserve.)

## Questions the Successor Should Ask Me Before I Leave

(List 5-10 questions the outgoing PM expects the successor to have. Surfaces gaps.)

## Sign-off

| Item | Outgoing PM | Successor / Manager |
|------|-------------|---------------------|
| Read this doc | ✅ | |
| Walked through with successor | ✅ | |
| All Open Loops have named owners | ✅ | |
| portfolio.yaml ownership transitioned | ✅ | |
| Manager approval | | |
```

## Sign-Off Criteria

The outgoing PM's last day is contingent (per team norms) on:

- [ ] Every account in `portfolio.yaml` has a current `account_owner` (no `[outgoing-pm]` left)
- [ ] Every Open Loop in every `account-context.md` has a named owner
- [ ] At least 80% of recent decisions have a hindsight note (or "no hindsight to add")
- [ ] Unshipped drafts have either landed in `strategy/vision/` or been formally retired
- [ ] Successor (or hiring manager if no successor yet) has read and signed off on the handoff doc

## Patterns to Watch

- **Account ownership re-concentration risk**: don't transition all 8 accounts to one CSM/PM. Distribute.
- **Decision hindsight bias**: outgoing PMs sometimes minimize their misses. Manager should review.
- **Departure-driven escalations**: customers sometimes use PM departure as renewal-renegotiation leverage. Brief the successor on which accounts are likely to use this.
