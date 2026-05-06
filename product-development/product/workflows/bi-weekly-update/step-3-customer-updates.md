# Step 3: Customer Updates (Pilots and Active Launches)

Updates the pilot/launch status sections — the deep-dive narratives for accounts where there's an active customer-side workstream.

## Inputs

- Each account's `account-context.md`
- New summaries since last cycle for those accounts
- The team's launch tracker (which features are mid-rollout to which accounts)

## Process

1. List active pilots and active customer rollouts (your team's tracker, plus cross-reference with `account-context.md` files showing "active pilot" or "rolling out X")
2. For each:
   - Pull the deep-dive section from the previous cycle's output
   - Update only if new call data, escalations, or rollout milestones changed the narrative
   - If nothing changed materially, mark "No material change since [previous cycle date]" and link forward
3. Update the cross-customer summary for shared gaps or themes that the pilot section reveals

## Output Section Shape

```markdown
## Pilot Deep-Dives

### Customer A — [pilot name]

**Status:** Active pilot, week N
**Owner (our side):** [Name]
**Champion (their side):** Their VP of Engineering

[2-3 paragraphs on current state, recent calls, blockers, expansion signals.]

### Customer B — [pilot name]

[...]

## Cross-Customer Summary

[1 paragraph on gaps/themes shared by multiple pilots — feeds prioritization.]
```

## When to Skip a Pilot Section This Cycle

If there's been no call, no update, no rollout milestone, mark "No material change" and keep the previous section's content. Don't rewrite for the sake of rewriting — the file will get noisy and stale-feeling fast.
