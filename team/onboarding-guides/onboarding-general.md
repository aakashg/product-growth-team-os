# Onboarding: General

This guide covers setup and orientation common to every new team member. Role-specific guides are linked at the bottom.

## What Is This Repo?

Your team's shared knowledge base. Every document, decision, metric definition, and customer insight lives here in a structure that AI agents (Claude Code, Cursor, etc.) and humans can query. Instead of asking the PM "why did we choose X?" or "where's the churn query?" — you ask the repo.

Think of it as a team wiki you can have a conversation with.

## Setup

### Shared Tools (everyone gets these)

| Tool | Purpose | Access |
|------|---------|--------|
| GitHub | Code, PRs, this repo | Org invite from your manager |
| Linear / Jira / Asana | Issue tracking | Team invite |
| Slack | Communication | Workspace invite |
| Google Workspace | Docs, email, calendar | Auto-provisioned |
| Claude Code or Cursor | AI agent that queries this repo | [claude.com/code](https://claude.com/code) — install instructions in [github-101.md](github-101.md) |

### Repos

| Repo | Description |
|------|-------------|
| `[your-team-os-repo]` | This repo — product docs, PRDs, decisions, customer insights, analytics |
| `[your-app-repo]` | Main application code |
| `[your-infra-repo]` | Infrastructure, CI/CD |

> Update this table with your actual repo names during initial setup.

### Environment Setup

1. Get laptop and accounts provisioned (your manager / IT will help)
2. Accept invitations to GitHub, Linear / Jira / Asana, Slack, Google Workspace
3. Clone this repo and open it in Claude Code or Cursor
4. Run a starter query — see "First Day Queries" below

If you've never used git before, read [github-101.md](github-101.md) before step 3. It's 5 commands and takes 10 minutes.

## First Day Queries

Try these to get a feel for the repo:

- *"Who are our top customers?"* — Claude reads `product/customers/accounts/` and returns a synthesis.
- *"Why did we choose [recent decision]?"* — Claude finds the decision log entry with full reasoning.
- *"How do we calculate [key metric]? Show me the query."* — Returns metric definition, SQL, and schema.
- *"What's our current strategy?"* — Returns the roadmap and business context.

If those return useful answers, you understand 80% of the value.

## Slack Channels

| Channel | Purpose |
|---------|---------|
| `#[team]-general` | Team-wide announcements |
| `#[team]-product` | Product discussions, customer feedback, roadmap |
| `#[team]-eng` | Engineering decisions and PRs |
| `#[team]-design` | Design reviews and UX research |
| `#[team]-data` | Metrics, dashboards, experiments |
| `#[team]-launches` | Launch coordination |

> Update this table with your actual channel names.

## People to Meet

Your manager will pair you with an onboarding buddy on day one. Beyond that, the team roster in the [root CLAUDE.md](../../CLAUDE.md) lists everyone with their Slack and GitHub handles.

## Your First Contribution

Pick one thing you know that the repo doesn't:

- A decision you were part of → use `/decision-log-entry` (2 minutes)
- A customer call you had → use `/customer-call`
- A metric you own → add it to `product-development/analytics/metrics/{area}/`
- A bug you investigated → document it in `product-development/engineering/bug-investigations/{area}/`

If you use Claude Code, it handles the git commands. Say "check this in and put up a PR for [teammate]."

If you're using git manually, see [github-101.md](github-101.md).

## Two Habits to Build

1. **After meetings with decisions:** write a 3-sentence decision log entry
2. **After customer calls:** summarize using `/customer-call`

These small inputs compound into institutional memory.

## First Tasks

- [ ] Accept tool invitations and verify access
- [ ] Join all Slack channels listed above
- [ ] Read the root CLAUDE.md and your role-specific onboarding guide
- [ ] Run all four First Day Queries
- [ ] Meet your onboarding buddy
- [ ] Make your first PR — even if it's a typo fix

## Role-Specific Guides

Pick the one that matches your function:

- [Product](onboarding-product.md) — PMs
- [Engineering](onboarding-engineering.md) — engineers
- [Design](onboarding-design.md) — designers
- [Analytics](onboarding-analytics.md) — analysts and data scientists
- [Data Engineering](onboarding-data-engineering.md) — data engineers
- [Strategy & Ops](onboarding-strategy-ops.md) — non-technical contributors (strategy, ops, sales, CX)

## FAQ

**"Can I break anything?"**
No. You work on a branch (a copy). Nothing touches `main` until a teammate reviews and approves your PR. Worst case your branch gets rejected and you try again.

**"What if I put a file in the wrong folder?"**
Your PR reviewer will catch it. Or just ask Claude: *"Where should I put a customer call summary for Acme Corp?"*

**"What if my contribution is incomplete or messy?"**
Check it in anyway. A rough decision log entry is infinitely better than no entry. Clean it up later if needed — better to capture imperfectly than to lose the information.

**"How often should I be checking things in?"**
After every meeting with a decision and after every customer call. That's 2-3 entries per week for most people, two minutes each.

**"I missed a week. Should I go back and fill in everything?"**
Don't try to reconstruct everything. Write entries for the 2-3 most important things you remember and resume the habit going forward. Some context is always better than none.

**"What if I'm non-technical?"**
Read [onboarding-strategy-ops.md](onboarding-strategy-ops.md). The Team OS works without a terminal — your PM or eng partner can run queries on your behalf, and contributing summaries doesn't require code.
