# Step 1: Portfolio Sweep

Walk every account, transition ownership cleanly, surface every Open Loop with a named owner.

## Inputs

- `customers/accounts/portfolio.yaml` (every account row)
- Each account's `account-context.md` (Open Loops sections)
- The team roster (for assigning new owners)

## Process

1. **List every account assigned to the outgoing PM** — filter `portfolio.yaml` where `account_owner: {outgoing-pm}`
2. **For each account, decide the new owner.** Don't centralize on one CSM/PM — distribute. Talk to the manager about load balancing.
3. **Update `portfolio.yaml`** with:
   - `account_owner: {new-owner}`
   - `previous_owner: {outgoing-pm}`
   - `transition_date: {today}`
   - `intro_status: pending`
4. **Sweep `account-context.md` Open Loops.** Every loop needs a named owner. Loops the outgoing PM was solving solo go to the new owner with explicit context.
5. **Schedule warm intros.** For each account, schedule a 15-minute call where outgoing-PM + new-owner + customer's champion are all on the line. Mark `intro_status: pending` until the intro happens, then `complete`.

## Output Section (writes to handoff doc)

```markdown
## Portfolio Transition

| Account | Previous owner | New owner | Status | Open loops | Intro scheduled |
|---------|----------------|-----------|--------|-----------|-----------------|
| {Customer} | {outgoing} | {new} | healthy / at-risk / etc. | {N} | {Date or pending} |

## Open Loops Inventory

| Account | Loop | New owner | Notes |
|---------|------|-----------|-------|
```

## Quality Checks

- [ ] Every account in `portfolio.yaml` previously owned by the outgoing PM has a new `account_owner`
- [ ] Every Open Loop in every account-context.md has a named (non-outgoing) owner
- [ ] At least one warm-intro call is scheduled per account
- [ ] At-risk accounts have their `customer-escalation` workflow already running, with the new owner cc'd
