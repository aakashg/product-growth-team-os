# CPO Morning Ritual

Daily synthesis workflow for hub-and-spoke executives — pulls calendar, runs `/portfolio-pulse`, briefs you for the first three meetings of the day, drafts Slack messages, surfaces top 3 priorities.

This is the workflow Dave Killeen described — *"I run one command in the morning, and five minutes later, I know what deals need attention, who I'm meeting, what I owe them, and what they owe me."*

## Files

| File | Purpose |
|------|---------|
| `workflow-spec.md` | Process flow, what changes daily vs. stable, MCP requirements |
| `step-1-portfolio-pulse.md` | Run `/portfolio-pulse --mode=daily` |
| `step-2-meeting-briefs.md` | Pull today's calendar; for each meeting, generate a brief from latest call summary + open loops |
| `step-3-slack-drafts.md` | Drafts for #cpo-direct-reports and customer-thread responses |
| `step-4-publish.md` | Push the synthesized output to your private Notion page or save locally |

## When to Run

- Every weekday at the start of your day, before your first meeting
- Re-run if your calendar changes mid-day

## What This Workflow Does Not Do

- It does not auto-send Slack messages — every draft goes to a review queue
- It does not modify the repo — it's read-only synthesis
- It does not replace `/weekly-synthesis` (Friday repo digest) or the bi-weekly-update workflow (team-level cadence)

## Required MCPs (Optional but Recommended)

For the full hub-and-spoke value, connect:

- Google Calendar / Outlook (today's meetings)
- Granola / Otter (latest call transcripts)
- Slack (mentions of customer names, your DMs, open threads)
- Linear / Jira / Asana (your team's active workstreams)
- CRM (deal stages and account context)
- LinkedIn (champion job changes — biggest single retention signal)

The workflow degrades gracefully — if Slack MCP isn't connected, the Slack-drafts step asks you for the threads you want briefed. The portfolio-pulse step works on the YAML alone.

## Output Lands

- `output/{YYYY-MM-DD}.md` — daily synthesis, dated
- Optional: pushed to a private Notion page or Google Doc via MCP

## Authoring

For the full pattern of how to author a workflow, see `../how-to-author-a-new-workflow.md`.
