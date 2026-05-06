# Welcome to the Team OS

You're new here. This guide gets you productive in 30 minutes.

## What Is This?

This repo is your team's shared knowledge base. Every document, decision, metric definition, and customer insight lives here in a structure that AI coding agents (Claude Code, Cursor, etc.) can query. Instead of asking the PM "why did we choose X?" or "where's the churn query?" — you ask the repo.

Think of it as a team wiki that you can have a conversation with.

## Choose Your Path

### Path A: You use Claude Code or Cursor (Technical)

1. Clone the repo: `git clone [URL your PM gave you]`
2. Open it in Claude Code or Cursor
3. Try these queries:

   **"Who are our top customers?"** — Claude navigates to the right folder, returns a synthesis.

   **"Why did we choose [recent decision]?"** — Claude finds the decision log with full reasoning.

   **"How do we calculate churn rate? Show me the query."** — Returns the metric definition, SQL, and schema.

4. If those work, you understand 80% of the value. Start contributing (see "Your First Contribution" below).

### Path B: You don't use coding tools (Non-Technical)

That's fine. You still benefit from the Team OS in two ways:

1. **Your PM or eng lead can run queries for you.** Ask them "can you pull up why we chose X?" and they query the repo. You get the answer in seconds instead of waiting for Slack responses.

2. **You can still contribute.** Customer call summaries, meeting notes, and competitive intel don't require coding tools. Ask your PM to show you the PR process (takes 10 minutes to learn — see github-101.md in this folder) or just send your notes to the PM to check in on your behalf.

Over time, most people find that opening the terminal is less scary than they expected. But there's no pressure.

## Your First Contribution

Pick one thing you know that the repo doesn't:
- A decision you were part of → use /decision-log-entry (takes 2 minutes)
- A customer call you had → use /customer-call-summary
- A metric you own → add it to the relevant analytics/ folder
- A bug you investigated → document it in engineering/bugs/

If you use Claude Code: it handles the git commands for you. Say "check this in and put up a PR for [teammate]."

If you're using Git manually: see github-101.md in this folder.

## Two Habits to Build

1. **After meetings with decisions:** write a 3-sentence decision log entry
2. **After customer calls:** summarize using the shared skill

These small inputs compound into institutional memory that serves the whole team.

## Where to Put Things

Check the root CLAUDE.md for the "Where Different Roles Check In Work" table. It maps every role to the folders they contribute to.

## FAQ

**"Can I break anything?"**
No. You're working on a branch (a copy). Nothing touches the main repo until a teammate reviews and approves your PR. Worst case: your branch gets rejected and you try again.

**"What if I put a file in the wrong folder?"**
Your PR reviewer will catch it. Or just ask Claude: "Where should I put a customer call summary for Acme Corp?"

**"What if my contribution is incomplete or messy?"**
Check it in anyway. A rough decision log entry is infinitely better than no entry. You can always clean it up later, and it's better to have the information captured imperfectly than to lose it entirely.

**"How often should I be checking things in?"**
After every meeting with a decision, and after every customer call. That's maybe 2-3 entries per week for most people. Each one takes 2 minutes.

**"I missed a week. Should I go back and fill in everything?"**
Don't try to reconstruct everything. Just write entries for the 2-3 most important things you remember and resume the habits going forward. Some context is always better than none.
