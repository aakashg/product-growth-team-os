# Minimal Setup (2-5 Person Teams)

The full Team OS has 28 directories. You don't need all of them. Start here.

## The 3-Folder Start

```
team-os/
├── CLAUDE.md          ← Team roster + doc index (fill this in)
├── decisions/         ← One file per decision
├── customers/         ← One file per customer call summary
└── analytics/         ← Metric definitions only
```

That's it. Three folders. One navigation file. You can add product/, engineering/, team/ later when you need them.

## The 5-File Start

1. **CLAUDE.md** — Your team roster and a 3-line doc index pointing to the three folders above
2. **decisions/[most-recent-decision].md** — Use the /decision-log-entry skill
3. **customers/[most-recent-call].md** — Use the /customer-call-summary skill
4. **analytics/key-metrics.md** — Just your top 5 metric definitions, no SQL yet
5. **One more decision or call summary** — To prove the system works for more than one file

## When to Expand

**Add product/ when:** you have 3+ PRDs and want Claude to reference them during planning.

**Add engineering/ when:** you've investigated 3+ bugs and want historical context for future investigations.

**Add team/ when:** you hire someone new and want to accelerate their onboarding.

**Split analytics/ into subfolders when:** you have 10+ metric definitions and queries are getting mixed up.

**Add .claude/skills/ when:** you want consistent formatting and your team has 3+ people contributing.

## If You Missed a Week

It happens. Don't restart from scratch. Don't feel guilty. Just:

1. Write one decision log entry for the most important thing that happened while you were away
2. Do one customer call summary for the most recent call
3. Keep going

The system tolerates gaps. Some context is always better than no context. A repo with 15 entries and a 2-week gap is infinitely more useful than no repo at all.

## Milestones

**Day 1:** Repo created, CLAUDE.md written, first file checked in.
**Week 1:** 5+ files. First query that saves you time.
**Week 2:** Second person contributing. Proof of concept.
**Month 1:** 20+ files. The system answers questions faster than Slack.
**Month 3:** The system knows things no single person remembers. New hire onboards in days, not months.
