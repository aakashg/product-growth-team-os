# Step 1: Engineering Status

Pulls workstream status from the team's tracker (Linear / Jira / Asana / GitHub Projects) plus a PM context dump, and writes the "What the Team Is Building Now" section to `output/YYYY-MM-DD.md`.

## Inputs

- The PM's verbal/typed context dump on what shipped, what's in flight, what's blocked
- The team's tracker — pulled via MCP if connected, else asked of the PM
- `feature-index.yaml` — to surface which features have artifacts vs. which are bare

## Process

1. Pull active workstreams from the tracker. Filter to ones owned by this team.
2. For each workstream, classify status: shipped / in QA / in dev / blocked / scoped not started.
3. Cross-reference each workstream against `feature-index.yaml`. Flag any active workstream that's missing a PRD, RFC, or plan.
4. Ask the PM: *"Anything I'd miss from just the tracker?"* Capture the response.
5. Write the "What the Team Is Building Now" section to the output file with workstreams grouped by OKR or by product area (your team's choice).

## Output Section Shape

```markdown
## What the Team Is Building Now

### [OKR or area name]

| Workstream | Status | Owner | Notes |
|------------|--------|-------|-------|
| [Workstream] | Shipped | [Name] | [What changed; link to launch email if customer-facing] |
| [Workstream] | In QA | [Name] | [Expected ship date; any open risks] |
| [Workstream] | Blocked | [Name] | [Blocker; what's needed to unblock] |
```

## Quality Checks Before Moving On

- [ ] Every workstream has an owner from the team roster
- [ ] Every "Shipped" entry links to its launch email or PR
- [ ] Every "Blocked" entry says what would unblock it
- [ ] Workstreams missing artifacts in `feature-index.yaml` have a `🚧 needs PRD/RFC/plan` annotation
