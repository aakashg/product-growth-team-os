# Team OS Adoption Playbook

Everything you need to roll out the Team OS to your team.

---

## 1. The Slack Pitch

Copy-paste this into your team channel when you're ready to introduce the repo:

---

Hey team — I've been building something I want to show you.

I set up a shared repo where I've been checking in our key decisions, customer call summaries, and metric definitions. Any of us can query it in natural language and get answers in seconds.

Quick examples of what it can do:
- "Why did we choose [recent decision]?" → Full reasoning in 15 seconds
- "What have customers said about [feature] this month?" → Synthesis across all call summaries
- "How do we calculate [metric]? Show me the query." → Definition + SQL + schema

I want to do a 15-minute demo this week. If it's useful, we'll start using it together. If not, no harm done. I'll keep using it personally either way.

Who's in for the demo? 🙋

---

## 2. The 15-Minute Demo Script

### Before the demo
- Make sure you have at least 10 files in the repo
- Test the three queries below to confirm they work
- Have the repo open in your coding agent, ready to go

### The three queries (in this order)

**Query 1: The Decision Lookup (3 minutes)**

"Why did we choose [a decision the whole team will recognize]?"

This demonstrates the core value: 15-second context retrieval vs. 25-minute Slack archaeology. Pick a decision the team debated. Show them the full reasoning appearing instantly.

What to say: "This took me 3 sentences to write after that meeting. Now anyone on the team can find the reasoning without asking me."

**Query 2: The Customer Synthesis (5 minutes)**

"What have customers been saying about [active feature or pain point]?"

This demonstrates cross-cutting analysis. Claude synthesizes across multiple call summaries. The audience sees patterns they didn't know existed because the data was scattered across individual PMs' notes.

What to say: "Every call summary follows the same format. That's what makes the synthesis work. One skill, applied consistently."

**Query 3: The Analytics Self-Serve (5 minutes)**

"How do we calculate [key metric]? Show me the query and the table schema."

This is the one that wins over engineers and analysts. Show that anyone on the team can find metric definitions, verified SQL, and table schemas without paging the analyst.

What to say: "Our analyst verified this query. It's the same one behind the dashboard. Now anyone can use it at 2 AM without waking anyone up."

**Close (2 minutes)**

"Here's what I'm asking from the team: after meetings where we make decisions, one person writes a 3-sentence entry. After customer calls, run the summary skill. That's it. Two habits. Everything else is optional."

### If someone asks "isn't this just Notion?"

"Notion stores documents. This stores context that an AI can query with structured navigation. We're not replacing Notion. We're adding a layer on top where anyone can ask a question and get an answer in seconds instead of searching through pages."

---

## 3. Weekly Ritual Template

### Monday (2 minutes)
Query the repo: "What decisions were made last week? What customer calls happened?"
Review the weekly synthesis (if automated) or scan recent commits.

### Daily (30 seconds per occurrence)
After a meeting with a decision → /decision-log-entry
After a customer call → /customer-call-summary

### Friday (5 minutes)
Run /weekly-synthesis (or review if automated)
Run /freshness-check monthly

### Launch day (10 minutes)
Run /feature-launch-gate before shipping
Resolve any BLOCKED items before deploy

---

## 4. Feature Launch Gate Checklist

Before any feature ships, verify:

- [ ] PRD exists in the repo
- [ ] Decisions are logged
- [ ] Metric definitions updated
- [ ] SQL queries verified by analyst and checked in
- [ ] Table schemas documented
- [ ] Dashboard link added
- [ ] CLAUDE.md navigation files updated for any new folders

Run /feature-launch-gate [feature-name] to automate this check.

---

## 5. Meeting Integration Guide

### The Team OS doesn't replace your meetings. It feeds them.

**Before standup:**
Query: "What shipped yesterday? What's blocked?"
The repo has this if the team is checking in status updates. If not, standup still works the old way.

**After standup:**
If blockers are identified, add them to engineering/bugs/ or product-development/product/decisions/ depending on whether they need investigation or a decision.

**Before sprint planning:**
Query: "What customer feedback from the last two weeks is relevant to our priorities?"
The structured call summaries make this a 30-second lookup instead of a 30-minute review.

**After retro:**
Check in the retro summary to team/retros/. Name it [YYYY-MM-DD]-sprint-retro.md.
Format: What went well, what didn't, action items with owners.

**After any meeting where a decision is made:**
Run /decision-log-entry. 2 minutes. Non-negotiable.

---

## 6. Handling Resistance

### "This is extra work"
It redirects work you already do. You already write meeting notes. You already answer "why did we choose X?" in Slack. The Team OS puts that same effort into a place where it compounds instead of disappearing.

2 minutes on a decision log saves 25 minutes every time the question comes up again. That's 12x return.

### "I don't use Claude Code / I'm not technical"
Start with Hub and Spoke: one power user queries for everyone, shares outputs. The team benefits without anyone else touching a terminal. Adoption spreads naturally.

If someone wants to learn: the repo includes team/onboarding/github-101.md. Five git commands. That's all they need.

### "We already have Notion/Confluence"
The Team OS adds a query layer on top. Notion stores documents. The Team OS stores context that AI can navigate. Both coexist. Nothing gets replaced.

### "What about sensitive data?"
Nothing goes in that you wouldn't put in a shared Google Doc with the same access permissions. PII stays in the CRM. Revenue data stays in the BI tool. The Team OS stores context about decisions and patterns. For regulated industries, use GitHub folder-level permissions to restrict access by role.

---

## 7. If Your Team Tried and Stalled

It happens. Usually around week 2-3 when the novelty fades and the habits haven't stuck. Don't restart from scratch.

**Diagnose the stall:**
- **Nobody's checking in content?** The habits aren't established. Pick the ONE most important habit (decision logs or call summaries) and focus only on that for 2 weeks. Drop everything else.
- **People checked in content but nobody queries it?** The value isn't visible yet. Run the 15-minute demo again with fresher data. Show a query that answers a question someone actually asked in Slack this week.
- **One person does everything?** That person will burn out. Switch to explicit ownership: analyst owns analytics/, eng lead owns engineering/, each PM owns their customer accounts. Distribute the load.
- **The repo went stale?** Run /freshness-check. Block 1 hour with the team. Divide stale files. Update, archive, or confirm. Reset.

**Recovery takes one session.** Not a new initiative. Not a team offsite. One hour where everyone updates their slice of the repo.

---

## 8. Multi-Team Rollout

If you're a PM leader rolling this out across multiple teams:

**One repo per team, not a monorepo.** Each team has their own context, their own customers, their own metrics. A shared monorepo creates noise and access control headaches.

**Start with one team.** Get them to the 4-week milestone. Use their results to pitch the next team. Internal case studies beat mandates.

**Shared skills across teams.** The 5 shared skills (customer-call-summary, decision-log-entry, etc.) should be consistent across teams. Publish them in a central location that teams clone from. This ensures cross-team analysis is possible: customer summaries from Team A and Team B follow the same format.

**Separate Slack channels for weekly synthesis.** Each team gets their own digest in their own channel. A cross-team digest for leadership is optional and should be a separate, lighter synthesis.

**Governance is light.** Naming conventions and folder structure should be consistent across teams. Everything else is team-specific. Don't over-standardize.

---

## 9. Measuring Adoption

How to know if the Team OS is working:

| Metric | How to Measure | Good Signal |
|--------|---------------|-------------|
| Files added per week | Git commit count | Increasing or stable after month 1 |
| Contributors per week | Unique committers | >50% of the team contributing monthly |
| Context questions in Slack | Track manually or search | Decreasing over time |
| Queries per week | Informal check-in | Team members querying independently |
| New member ramp time | Time to first meaningful contribution | Shorter than before Team OS |
| Feature launch gate pass rate | /feature-launch-gate results | Increasing first-pass rate |

You don't need to track all of these. Pick 1-2 that matter to your team and check them monthly.
