# Step 3: Unshipped Drafts and Untested Bets

Surface things the outgoing PM was working on but didn't ship. Strategy notes, half-drafted PRDs, hypotheses they wanted to test, things they were intentionally deferring. The successor needs visibility into both the inflight work and the ideas-on-the-shelf.

## Inputs

- The outgoing PM's local drafts (often outside the repo — Notion, Apple Notes, Google Docs)
- Any branches with PRD drafts that never merged
- The outgoing PM's memory of "things I wanted to do but didn't get to"

## Process

1. **Collect inflight drafts.** PRDs, decision drafts, RFCs. Either land them in the repo (preferred) or land a stub pointer with the draft attached.
2. **Capture untested bets** — strategic ideas the outgoing PM thought were worth testing. Land these in `strategy/vision/` as one-page notes.
3. **Capture deferred decisions** — things the outgoing PM consciously left for later. The successor needs to know which deferrals were principled vs. ran-out-of-time.
4. **Flag deprioritized work** — features that were on the roadmap and got cut. Brief the successor on why so they don't unknowingly revive them.

## Output Section (writes to handoff doc)

```markdown
## Unshipped Drafts and Untested Bets

| Artifact | Type | State | Where it lives | Successor action |
|----------|------|-------|----------------|------------------|
| {Slug} | PRD draft | 60% drafted | `PRDs/{area}/draft-{slug}.md` | Decide: ship in 30d, archive, or reassign |
| {Slug} | Untested hypothesis | Idea only | `strategy/vision/{slug}.md` | Pick up next quarter if validated by data |
| {Slug} | Deferred decision | Awaiting Q3 data | Linear/Jira #YOURPROJ-X | Revisit when data lands |

## Why Each Was Unshipped

| Slug | Reason it didn't ship | Re-engagement signal |
|------|----------------------|----------------------|

## Deprioritized Work — Don't Revive Without Asking

| Slug | When it was cut | Why | Conditions for revival |
|------|----------------|-----|------------------------|
```

## Conventions

- **Drafts** land in the repo with a `draft-` prefix in the filename. They're checked-in but not yet active.
- **Vision notes** in `strategy/vision/{slug}.md` are one-pagers — what the bet is, what would falsify it, why it's worth testing.
- **Don't pretend completeness.** "I had an idea about X but never wrote it down" is fine to log as a one-liner. Better to capture the seed than lose the idea.

## Quality Checks

- [ ] Every PRD draft is either landed in the repo or has a stub pointer
- [ ] Every "wanted to do but didn't" idea has at least a one-line entry in vision/
- [ ] Deferred decisions have explicit re-engagement triggers
