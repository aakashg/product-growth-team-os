# Incident Response Playbook

You're on-call and just got paged. This is what to do RIGHT NOW. Designed to be readable in 30 seconds.

## Step 0: Acknowledge

Acknowledge the page in PagerDuty / Opsgenie within 5 minutes. Even if you're still spinning up. Silent pages get re-paged or escalated.

## Step 1: Triage (target: 5 minutes)

Open the alert. Identify:

| | |
|---|---|
| **What broke?** | Read the alert message, click through to the dashboard |
| **What's the blast radius?** | Single customer? Single region? All customers? |
| **What's the customer impact?** | Errors / latency / data loss / silent corruption? |
| **Has this fired before?** | Search `engineering/bug-investigations/{area}/` (`ls` the area folder, scan filenames). **If the area folder doesn't exist:** this is a new product area for the repo — `mkdir -p engineering/bug-investigations/{area}/` now and continue. Defer the rest of the area-bootstrap checklist to Step 5. |

If a prior bug investigation matches, **read its Root Cause section first**. If the same fix applies, you're done in 10 minutes.

## Step 2: Investigate (target: 15 minutes)

Use the right tools in the right order:

1. **Check `analytics/data-catalog.yaml`** to find the relevant table — owner, refresh cadence, partition key, last_validated date all in one read
2. **Read the schema doc** linked from the catalog entry (`schemas/{area}/{table}.md`) for column-level questions and freshness gotchas
3. **Use a pre-built query** from `analytics/queries/{area}/` — these are warehouse-aware and analyst-verified
4. **Apply the playbook for the area** — `analytics/playbooks/{playbook}.md` if one exists for the symptom

Common starting queries:

| Symptom | Where |
|---------|-------|
| Churn spike / billing anomaly | `analytics/playbooks/churn-spike-investigation.md` |
| Webhook duplicates / payment events | `engineering/bug-investigations/billing/bug-03-12-2026-credit-double-charge/investigation-plan.md` (similar pattern) |
| [Add area-specific entries here as your team accumulates them] | |

## Step 3: Mitigate

Pick the smallest reversible action that stops customer impact:

- Roll back the latest deploy?
- Disable the feature flag?
- Increase rate limits / scale the workload?
- Manual data fix (only if you can't roll back the cause)?

**Document what you did in real time** — write into a fresh `bug-investigations/{area}/bug-{MM-DD-YYYY}-{slug}/investigation-plan.md` directory as you go. The Investigation Steps section should have timestamps.

## Step 4: Escalate If Needed

| Trigger | Action |
|---------|--------|
| Can't resolve in 30 minutes | Page Eng Lead from team roster |
| Customer-data loss confirmed or suspected | Page Eng Lead + PM immediately, regardless of duration |
| Payment-system anomaly | Eng Lead + finance contact (see team roster) |
| Security/auth incident | Eng Lead + security contact |
| External vendor (Stripe / AWS) is the suspect | Open vendor support ticket in parallel; don't wait |

Use the team roster in root `CLAUDE.md`. If your team doesn't yet have an Escalation column, add it now — name, Slack ID, phone for after-hours.

## Step 5: Postmortem (within 24 hours)

Don't skip this even when the fix is small. Complete the bug-investigation directory:

- **Symptoms** — what users / monitors saw
- **Investigation Steps** — timestamped, in order
- **Root Cause** — the actual mechanism, not "we found a bug"
- **Fix Applied** — with PR link
- **Prevention** — monitor added, RFC requirement added, code change required, etc.

Cross-reference from `feature-index.yaml` if a specific feature was involved. Update `analytics/playbooks/{playbook}.md` if this incident reveals a missing investigation pattern.

**If this incident bootstrapped a new product area** (you `mkdir`'d `bug-investigations/{area}/` in Step 1 because it didn't exist), complete the rest of the [area-bootstrap checklist](../../CLAUDE.md#bootstrapping-a-new-product-area) before closing — add the area to `feature-index.yaml`, add a row to engineering/analytics CLAUDE.md Product Areas tables, and create the sibling area folders so the next person isn't bootstrapping under pressure too.

## Common Mistakes Under Pressure

- **Investigating before triaging.** Spending 20 minutes deep-diving SQL when a deploy rollback would have fixed it in 30 seconds.
- **Skipping the prior-bug check.** If this exact thing fired before, the investigation is already written.
- **Documenting after the fact from memory.** Write timestamps into `investigation-plan.md` *as you go* — your 4 AM memory is unreliable.
- **Solo-resolving when you should escalate.** Customer-data loss → escalate immediately. Don't be a hero.
- **Missing the prevention step.** A fix without a monitor or RFC requirement means the same incident fires again next quarter.

## Related

- Engineering folder: `../CLAUDE.md`
- Bug investigations index: `../bug-investigations/CLAUDE.md`
- Data catalog: `../../analytics/data-catalog.yaml`
- Onboarding for engineers: `../../../team/onboarding-guides/onboarding-engineering.md`
