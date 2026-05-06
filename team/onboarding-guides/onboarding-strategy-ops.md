# Onboarding: Strategy & Ops (Non-Technical Path)

Welcome. This guide is for contributors whose work isn't code-heavy: strategy, operations, sales, customer success, customer experience, marketing, etc.

If you've never used GitHub or a terminal before — that's fine. Hannah Stulberg's strategy partner at DoorDash had never used GitHub two months before contributing daily. You can get there.

## Two Paths

### Path A: You can spare 30 minutes to learn the basics

Read [github-101.md](github-101.md). It's 5 commands. After that, you can clone the repo, edit files, and put up PRs without anyone holding your hand. Most non-technical contributors say the terminal was less scary than they expected.

### Path B: You don't want to touch a terminal — that's also fine

You still benefit from the Team OS:

1. **Your PM or eng partner runs queries for you.** Ask them *"Can you pull up why we chose X?"* — they query the repo and have an answer in seconds.
2. **You contribute by sending notes to the PM** (Slack, email, doc). They check it in on your behalf — your name shows up as the source.
3. **Customer call summaries don't require code.** You write them in your notes app, send to the PM, they run `/customer-call` on your behalf.

Over time most non-technical folks pick up Path A naturally. No pressure.

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

- [ ] Read [github-101.md](github-101.md) — even if you choose Path B, skim it so you know what's being asked of you
- [ ] Read three recent customer call summaries to learn the format
- [ ] Identify the next customer call where you'll trial-run the summary skill
- [ ] Identify one decision your team made recently that should be in the log — draft it in your notes app and hand to PM
- [ ] Make your first PR (or have the PM make it for you, listing you as the contributor)

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
