# Launch Emails

Customer-facing launch communications across the launch lifecycle — not just a single announcement.

## Folders

| Folder | Purpose | Cadence |
|--------|---------|---------|
| `announcements/` | Day-zero launch emails — the announcement of the feature | T+0 |
| `follow-ups/` | Drip sequence after the announcement — activation nudges, usage tips | T+3, T+7, T+14 |
| `case-study-spotlights/` | Customer success stories tied to a launch | T+30, T+60 |

## File Pattern

`{folder}/{feature-slug}-{stage}.md`

Examples:
- `announcements/credit-usage-dashboard-launch.md`
- `follow-ups/credit-usage-dashboard-day-7-activation.md`
- `case-study-spotlights/credit-usage-dashboard-customer-success.md`

## Email Template

Each launch email file contains:

```markdown
# {Subject Line}

**Send date:** {YYYY-MM-DD}
**Audience:** {All paying / Pro tier / Beta opt-in / etc.}
**Owner:** {Marketing lead from team roster}
**Linked feature:** feature-index.yaml#{area}.{feature}
**A/B variants:** none | A: {hook}, B: {hook}
**Linked case studies:** customers/case-studies/{file} (if any)

---

[Email body here in markdown — preview-friendly, exports cleanly to your email tool]
```

## Cross-References

| Source | Used Here |
|--------|-----------|
| `feature-index.yaml` | Source of truth for what shipped, when |
| `decisions/` | Why we made the choices being announced |
| `customers/case-studies/` | Permissioned testimonials for proof |
| `competitive-research/competitors/` | Positioning vs alternatives |

## Coordination With Launch

The `feature-launch-gate` skill checks that an announcement file exists in `announcements/` for any customer-facing feature shipping. The gate doesn't auto-send — marketing owns the calendar — but it catches features that ship without comms attached.

A launch-coordination workflow lives at `workflows/launch-coordination/` (T-14 / T-7 / T-0 / T+3 / T+7 / T+14 checklist) — recommended for any GA-tier launch.

## What Doesn't Go Here

- **Sales talk tracks** → `sales-enablement/talk-tracks/`
- **Internal launch announcements (Slack)** → not in repo, in Slack
- **Press releases** → marketing tool unless you want them archived
- **Onboarding emails for new users (lifecycle)** → separate `onboarding-emails/` if you have lifecycle marketing; not launches
