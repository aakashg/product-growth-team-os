# Onboarding: Strategy & Ops (Non-Technical Path)

Welcome. This guide is for contributors whose work isn't code-heavy: strategy, operations, sales, customer success, customer experience, marketing, etc.

If you've never used GitHub or a terminal before — that's fine. Hannah Stulberg's strategy partner at DoorDash had never used GitHub two months before contributing daily. You can get there.

## Three Paths (Pick the One That Fits Today)

You can switch paths later. Many people start at Path B, move to Path C in week 2, and arrive at Path A in month 2. None of them is second-class.

### Path A — Five Git Commands (30 min to learn)

Read [github-101.md](github-101.md). The intro covers what Git, GitHub, branches, and PRs actually mean. The 5 commands at the end are the whole skill.

**You'll be productive on day 1 if:** you can copy and paste from a guide and don't bounce at one weird error message.

### Path B — Send Notes to Your PM

The Team OS works fine without you ever opening a terminal. You write in your notes app (Notion, Google Doc, Apple Notes — whatever) and hand off to your PM, who runs the skill on your behalf and lists you as the source. Many non-technical contributors stay here forever and the team functions perfectly.

**You'll be productive on day 1 if:** you can write call notes the way you already do.

### Path C — Use Claude Code in Plain English

Install [Claude Code](https://claude.com/code) (it's a free download with a guided installer). Open it in the team-os folder. Talk to it like a teammate:

> *"I just got off a call with Acme Corp. Here are my notes: [paste]. Create a summary using the customer-call skill, save it in the right place, and put up a PR for Sam to review."*

Claude runs the git commands. **You will not see a terminal.** Many non-technical contributors land here and never need github-101.md.

**You'll be productive on day 1 if:** you can install one app and type questions to a chatbot.

## Path B and Path C Detail: Day-1 Workflow

### If you're on Path B (handing off to your PM)

1. Take notes from your call in your usual notes app
2. Send them to your PM in Slack or email with: *"For the Team OS — can you run the customer-call skill on this and PR me as contributor?"*
3. The PM runs `/customer-call`, which produces the summary file and puts up a PR
4. You'll get tagged on the PR — click **Approve** when it looks right
5. The PM merges the PR. Done

### If you're on Path C (Claude Code in plain English)

1. Open Claude Code in the team-os folder
2. Tell it: *"Take these call notes [paste] and run the customer-call skill on them. The customer is Acme. Save it in the right folder and put up a PR for Sam to review."*
3. It does everything. You'll see a confirmation with the PR URL
4. Click the URL, scan the summary, click **Approve**

Both paths produce the same outcome: a checked-in summary with you as the contributor. The PII rule (no customer-side personal names) is applied automatically by the skill regardless of path.

## What You'll Most Likely Contribute

- Customer call summaries from sales / CS / CX calls
- Competitive intel from sales conversations or market research
- Decision log entries from cross-functional meetings you were in
- Process documentation (e.g., a customer-onboarding checklist)
- Strategy documents (vision drafts, business-context updates)

## Key Documents

- [Customer Insights](../../product-development/product/customers/CLAUDE.md) — call summaries, account context
- [Competitive Research](../../product-development/product/competitive-research/CLAUDE.md) — competitor intel
- [Decisions Log](../../product-development/product/decisions/CLAUDE.md) — every cross-functional decision
- [Strategy](../../product-development/product/strategy/) — roadmaps, vision, business context

## Skills You'll Use

- `/customer-call` — ask your PM to run this on a transcript or your notes
- `/decision-log-entry` — capture a decision in 2 minutes; PM can check it in if you don't want to

## First Tasks

Pick the checklist matching your path. None of them is second-class.

### Path A checklist
- [ ] Read [github-101.md](github-101.md) end-to-end
- [ ] Clone the repo
- [ ] Read three recent customer call summaries to learn the format
- [ ] Make a tiny PR — fix a typo or add a missing comma — to practice the workflow
- [ ] On your next customer call: take notes, run the customer-call skill, put up a real PR

### Path B checklist (no terminal)
- [ ] Read three recent customer call summaries to learn the format (link in `customers/CLAUDE.md`)
- [ ] Identify your next customer call
- [ ] After the call, send your notes to your PM with the request: *"please run /customer-call on this and PR me"*
- [ ] When the PR comes in, review and approve it
- [ ] Identify one decision your team made recently — draft it in your notes app and hand to PM for `/decision-log-entry`

### Path C checklist (Claude Code, no terminal)
- [ ] Install [Claude Code](https://claude.com/code) (free guided installer)
- [ ] Open Claude Code in the team-os folder
- [ ] Read three recent customer call summaries by asking Claude: *"show me the last three customer call summaries"*
- [ ] After your next customer call, hand the notes to Claude with: *"create a customer-call summary from these notes for [customer] and put up a PR for [reviewer]"*
- [ ] Approve the PR when it lands

## Where Your Work Lives

| Artifact | Location |
|----------|----------|
| Customer call summaries | `product/customers/accounts/{customer}/calls/summaries/{date}.md` |
| Account context | `product/customers/accounts/{customer}/account-context.md` |
| Competitive intel | `product/competitive-research/competitors/{competitor}/` |
| Decision log entries | `product/decisions/{YYYY-MM-DD}-{topic}.md` |
| Process docs | `product/processes/` |
| Sales enablement | `product/sales-enablement/` |
| Vision / business context | `product/strategy/vision/` or `product/strategy/business-context/` |

## How to Read a CLAUDE.md File

Every folder has a `CLAUDE.md`. It's a 1-page index of what's in the folder. When you're not sure where something goes, open the nearest CLAUDE.md.

When you're really not sure, just ask the PM or open Claude Code and type *"Where should I put a customer call summary for [customer]?"*

## What If I Make a Mistake?

You can't break anything. Branches and PRs are designed so nothing reaches `main` until a teammate reviews. If something looks wrong, the reviewer will leave a comment and you (or they) fix it. Worst case you learn something. Most teams find non-technical contributors make fewer mistakes than engineers because they're more careful.
