# Bi-Weekly Update Workflow

A multi-step workflow that produces a dated bi-weekly team-update document. Runs interactively: each step has an automated part (data gathering, drafting) and an interactive part (the PM reviews, approves, edits). Each section writes to the output file as it completes so progress is visible in real time.

> Adapted from Hannah Stulberg's open-source bi-weekly workflow. Adjust the steps to your team's cadence — some teams run weekly, some monthly.

## Files

| File | Purpose |
|------|---------|
| `workflow-spec.md` | Process flow, conventions, special cases — the "how it works" doc |
| `step-1-eng-status.md` | Pulls workstream status from Linear/Jira/Asana + PM context |
| `step-2-call-synthesis.md` | Synthesizes the last 2 weeks of customer calls |
| `step-3-customer-updates.md` | Updates pilot/launch status sections |
| `step-4-push-to-gdoc.md` | Pushes the compiled output to a shared Google Doc via MCP |
| `step-5-review.md` | PM review pass — edits, additions, publish |
| `reference/` | Canonical good-output examples to model new runs against |
| `output/` | Actual produced bi-weekly docs, dated |

## When to Run

- Friday afternoon every other week (default)
- Adjust to your team's cadence — weekly, monthly, quarterly all work with the same step pattern

## Who Owns

The PM running the team's bi-weekly cadence. Outputs land in the team's shared doc and get reviewed in the bi-weekly meeting.

## Customizing

- Replace `step-1-eng-status.md` data sources with your actual tracker (Linear, Jira, Asana, GitHub Issues)
- Replace `step-4-push-to-gdoc.md` with your output sink (Notion, Confluence, internal tool)
- Add/remove steps as needed — the only requirement is each step writes a section to the output file as it completes
