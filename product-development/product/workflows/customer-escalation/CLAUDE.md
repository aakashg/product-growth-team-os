# Customer Escalation Workflow

When a paying customer goes sideways — escalation lands, champion leaves, deploy fails, NPS plummets — this workflow walks the CSM through triage, save attempt, and either recovery or graceful exit.

Mirrors `engineering/playbooks/incident-response.md` in shape — designed to be readable in 30 seconds when you're under pressure.

## Step 0: Triage (5 min)

Acknowledge the escalation in your CRM and Slack. Even before you have a plan. Silent escalations grow.

## Step 1: Diagnose (15 min)

| | |
|---|---|
| **What broke?** | Product issue / champion change / pricing dispute / unmet expectation / vendor evaluation |
| **What's the financial impact?** | ARR at risk + expansion ARR foreclosed |
| **Has this customer escalated before?** | Search `customers/accounts/{slug}/account-context.md` Open Loops history |
| **Is this isolated or pattern?** | Search `weekly-synthesis` for similar escalations across accounts |

## Step 2: Save Plan (30 min, with PM/eng if needed)

| Cause | Save play |
|-------|-----------|
| Product bug | Pull eng into a triage call within 24h. Commit to a fix date in writing. Track in `bug-investigations/`. |
| Champion left | Get a warm intro to their successor within 14 days. AE leads. |
| Pricing dispute | Negotiate within authority limits. If outside, escalate to your AE Lead. Log decision in `decisions/`. |
| Unmet expectation | Re-onboard. Schedule a 60-minute working session with their team. Often resolves in one session. |
| Vendor evaluation | Rare; usually means trust is gone. Run loyalty-test conversation: "what would have to be true for you to stay?" |

## Step 3: Document the Save Attempt

Create `customers/accounts/{slug}/escalations/{date}-{topic}.md` (folder created on first escalation):

```markdown
# Escalation: {Topic}

**Date:** {YYYY-MM-DD}
**Severity:** P0 (renewal at risk) / P1 (expansion at risk) / P2 (relationship at risk)
**Cause:** {From the table above}
**ARR at risk:** ${amount}

## What Happened

{2-3 sentences. Be honest.}

## Save Plan

- {Action} — Owner: {Name} — Due: {Date}

## Status Updates

- {Date}: {What changed}

## Outcome

{Saved / Lost / Pending — fill in when resolved}

## What We Learned

{Pattern, lesson, change to product/process. The reason we write these down.}
```

## Step 4: Update `portfolio.yaml`

Set `status: at-risk`. Add the escalation to `risks:`. Update `last_updated`.

## Step 5: Track to Resolution

Daily check-in until status returns to healthy or the account churns. Don't let escalations drift — they compound.

## Escalation to AE Lead / Head of Sales

- Renewal at risk + < 30 days
- ARR > $X (set per-team)
- Champion departure with no replacement identified
- Pricing dispute outside CSM authority

## Patterns to Surface to PM

- 3+ escalations on the same product issue → patterns ticket in `feature-index.yaml`
- 3+ champion departures across accounts → relationship-management gap, surface in CS team retro

## What This Workflow Doesn't Do

- It doesn't auto-message the customer (you do that)
- It doesn't replace your CRM (it complements it with structured context)
- It doesn't make the save for you (the workflow is scaffolding for *your* judgment)
