# Step 5: Final Handoff Doc

Assemble the handoff doc and walk the successor through it. The doc is the artifact; the walkthrough is where the successor's questions surface gaps.

## Inputs

- Output from Steps 1-4 (portfolio sweep, decision hindsight, drafts/bets, warm intros)
- The outgoing PM's "what I'd do differently" reflection
- The successor (or hiring manager if no successor yet)

## Process

1. **Assemble** the handoff doc per the template in `workflow-spec.md`. File goes at `team/handoffs/{outgoing-pm}-{YYYY-MM-DD}.md`.
2. **Add the reflection sections** that didn't land in earlier steps:
   - **What I'd do differently** — 2-3 paragraphs. Honest. Most valuable section.
   - **What's working — don't break** — 2-3 paragraphs. Patterns the successor should preserve.
   - **Questions the successor should ask me before I leave** — anticipate 5-10 questions. Surfaces gaps.
3. **Walk through with the successor.** Block 90 minutes. Read the doc together. The successor's questions are the gap detector — capture answers in real time.
4. **Re-run Steps 1-4 on anything the walkthrough surfaces.** This is normal. The first pass catches 70%, the walkthrough catches another 20%, post-walkthrough fixes the last 10%.
5. **Manager sign-off** — the manager reviews the doc and signs the sign-off table. Last day is contingent on this.

## Output Section (writes to handoff doc)

```markdown
## What I'd Do Differently

{2-3 paragraphs. Honest. Most valuable section.}

## What's Working — Don't Break

{2-3 paragraphs. Patterns, processes, relationships to preserve.}

## Questions the Successor Should Ask Me Before I Leave

{5-10 questions. Anticipate gaps.}

## Sign-off

| Item | Outgoing PM | Successor / Manager |
|------|-------------|---------------------|
| Read this doc | ✅ | |
| Walked through (Step 5) | ✅ | |
| All Open Loops have named owners | ✅ | |
| portfolio.yaml ownership transitioned | ✅ | |
| Manager approval | | ✅ when complete |
```

## After the Walkthrough

- Add the handoff doc to `.claude/agents/onboarding.md`'s "Successor Onboarding" branch so when the agent runs for the new PM, it loads the handoff first.
- Remove the outgoing PM from `team/CLAUDE.md` team roster on their last day.
- Archive their `team/onboarding-progress/{name}-{date}.md` file (move to `team/onboarding-progress/archive/`).
- Schedule a 30-day check-in between successor and outgoing PM (if outgoing is willing) — surface what came up that the doc missed.

## Quality Checks

- [ ] Doc walked through with successor (or manager if successor TBD)
- [ ] Sign-off table complete
- [ ] Onboarding agent updated to reference this handoff
- [ ] 30-day check-in scheduled (if applicable)
