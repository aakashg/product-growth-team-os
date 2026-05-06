# Minimal Setup (2-5 Person Teams)

The full Team OS has many folders. You don't need all of them on day one. Start here.

> **For the person SETTING UP the repo, not for new hires joining a team that's already running.** If you joined a team and your manager pointed you here, **stop** — you don't want to delete folders. Open [team/onboarding-guides/onboarding-general.md](team/onboarding-guides/onboarding-general.md) instead.

## Step Zero: Delete What You Don't Use

The starter ships with example folders for a hypothetical 10-person team. Before your first commit, **delete the folders you don't need**. Re-add them later via the "When to Expand" table below.

For a 3-person team, delete these:

```
rm -rf product-development/data-engineering/                              # no data eng yet
rm -rf product-development/product/meetings/                              # no formal sprint cadence
rm -rf product-development/product/workflows/                             # bi-weekly cadence is overkill
rm -rf product-development/product/sales-enablement/                      # add when you hire sales
rm -rf product-development/product/processes/                             # add when you have processes
rm -rf product-development/product/product-context/                       # add when you onboard others
rm -rf product-development/analytics/dashboards/                          # add when you have dashboards
rm -rf product-development/analytics/experiments/                         # add when you run experiments
rm -rf product-development/analytics/investigations/                      # add when you investigate
rm team/onboarding-guides/onboarding-data-engineering.md
rm team/onboarding-guides/onboarding-analytics.md
rm team/onboarding-guides/onboarding-strategy-ops.md
```

Trim the `billing/` worked example to just the three files you'll actually consult day one — `analytics/metrics/billing/billing-metrics.md`, `analytics/queries/billing/churn_by_segment.sql`, `analytics/schemas/billing/billing_events.md`. Delete the rest of the billing example (PRD, RFC, plans, experiments, investigations, bug-investigations, dashboards) — they're enterprise scaffolding you don't need yet.

Cut the root `CLAUDE.md` team table from 6 rows to your actual roles. Cut the Slack channel table to your actual channels. Don't pretend to scale you don't have.

After this trim, you have ~15 files instead of ~95, and the repo stops looking like someone else's enterprise scaffolding.

## The 3-Folder Start

```
team-os/
├── CLAUDE.md                                    ← team roster + doc index (fill this in)
├── product-development/
│   ├── product/
│   │   ├── decisions/                           ← one file per decision
│   │   └── customers/accounts/{customer}/       ← one folder per managed customer
│   └── analytics/
│       └── metrics/{area}/                      ← metric definitions
└── .claude/
    └── skills/                                  ← the 5 shared skills (already included)
```

That's it. Three folders under `product-development/`, one CLAUDE.md, and the 5 shared skills you already have. Add more folders as you need them.

## The 5-File Start

Once the folders are in place, create these five files in your first week:

1. **CLAUDE.md** — your team roster and a doc index pointing to the three folders above
2. **product/decisions/{date}-{topic}.md** — the most recent decision your team made (use `/decision-log-entry`)
3. **product/customers/accounts/{customer}/calls/summaries/{date}.md** — the most recent customer call (use `/customer-call`)
4. **analytics/metrics/{area}/{topic}-metrics.md** — your top 5 metric definitions, no SQL yet
5. **One more decision OR call summary** — to prove the system works for more than one file

## When to Expand

| Add | When |
|-----|------|
| `product/PRDs/{area}/` | You have 3+ PRDs and want Claude to reference them during planning |
| `engineering/plans/{area}/` and `engineering/rfcs/{area}/` | You're handing implementation off to engineers |
| `engineering/bug-investigations/{area}/` | You've investigated 3+ bugs and want historical context for future investigations |
| `analytics/queries/{area}/` and `analytics/schemas/{area}/` | You have working SQL the team should share |
| `analytics/data-catalog.yaml` | You have 5+ tables your team queries |
| `feature-index.yaml` | You have 5+ features with multiple artifacts each — this is the ROI sweet spot |
| `team/onboarding-guides/` (role-specific files) | You hire someone new and want to accelerate their onboarding |
| `product/competitive-research/competitors/` | You've lost or won a deal where competitive intel mattered |
| `product/workflows/` | You run the same multi-step process every week or two |

## If You Missed a Week

It happens. Don't restart from scratch. Don't feel guilty. Just:

1. Write one decision log entry for the most important thing that happened while you were away
2. Run `/customer-call` for the most recent call
3. Keep going

The system tolerates gaps. Some context is always better than no context. A repo with 15 entries and a 2-week gap is infinitely more useful than no repo at all.

## Milestones

| | |
|---|---|
| **Day 1** | Repo created, CLAUDE.md filled in, first file checked in |
| **Week 1** | 5+ files. First query that saves you time |
| **Week 2** | Second person contributing. Proof of concept |
| **Month 1** | 20+ files. The system answers questions faster than Slack |
| **Month 3** | The system knows things no single person remembers. New hire onboards in days, not months |

## The Three Rules Still Apply

Even at minimal scale:

1. **Summaries first, raw data in subfolders.**
2. **Every folder has a CLAUDE.md navigation file.** A two-line CLAUDE.md is fine.
3. **The repo gets updated before a feature ships** — even if "before it ships" just means "before you Slack the customer."
