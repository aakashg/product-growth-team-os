# How to Author a New Workflow

Every workflow in `workflows/` follows the same shape so a teammate (or agent) can pick it up cold.

## When to Write a Workflow vs. a Skill

| Use a workflow when | Use a skill when |
|---|---|
| Multi-step, recurring, produces a dated artifact | Single-pass transformation (notes → summary, transcript → digest) |
| Each step is run interactively with PM review | Running it is largely automated once invoked |
| The output evolves over time and the previous run is the model for the next | The output stands alone, no continuity across runs |
| Examples: bi-weekly update, quarterly business review, monthly board prep | Examples: customer-call summary, decision log entry, freshness check |

A skill can be invoked *from* a workflow step. The bi-weekly-update workflow does this — Step 2 invokes the customer-call-summary skill on every recent call before synthesizing across them.

## Folder Layout

```
workflows/{workflow-name}/
├── CLAUDE.md             # one-pager: what this workflow does, when to run, who owns
├── workflow-spec.md      # process flow, conventions, special cases
├── step-1-{phase}.md     # first step instructions
├── step-2-{phase}.md
├── ...
├── reference/
│   └── {date}.md         # canonical good-output examples
└── output/
    └── {date}.md         # actual produced artifacts (dated)
```

## Authoring Steps

### 1. Define the artifact

Before writing any steps, write a one-sentence description of the output: *"A dated bi-weekly team-update document covering engineering status, customer call synthesis, pilot deep-dives, with a Slack-ready summary."* If you can't describe the artifact, you don't have a workflow yet — you have a meeting.

### 2. Decompose into 3-7 steps

Each step should:
- Have a clear input and output
- Be runnable in 5-15 minutes
- Either fully automate or have an obvious "PM reviews this" interactive moment
- Append its section to `output/{date}.md` so progress is visible

If you have more than 7 steps, you have two workflows. Split.

### 3. Write the workflow-spec.md

Cover: process flow, what changes every cycle vs. what's stable, formatting conventions, special cases (new entities, removing stale content), file naming.

### 4. Write each step file

Each step file is a recipe Claude follows. Structure:

- **Inputs** — what the step needs to start
- **Process** — numbered steps; this is the meat
- **Output Section Shape** — example markdown of what the step writes to the output file
- **Quality Checks** — checklist before moving on

Skip aspirational language. Write step files like a runbook — terse, ordered, every step actionable.

### 5. Add a reference example

Run the workflow once manually and save the output to `reference/{date}.md`. Future runs use this as the model. Update it when the format genuinely changes; don't update for every minor variation.

### 6. Wire up the output sink (optional)

If you push the artifact to a shared doc (Google Doc, Notion, Confluence), write `step-N-push-to-{sink}.md` covering MCP setup and a fallback for unconnected MCP. Always include the fallback — workflows without MCP are still runnable, just manual on the last mile.

## Anti-Patterns

- **Workflows that don't write to a file as they run.** If progress isn't visible until the end, you'll lose work and trust.
- **Workflows that rewrite stable sections every cycle.** Mark stable content "carried forward, not rewritten" in the spec. The bi-weekly-update spec calls this out explicitly.
- **Workflows that skip the reference example.** Without one, every run drifts a little. Set the canonical shape and point new runs at it.
- **Workflows that omit the special-case section.** New entities, departing entities, ad-hoc requests — the spec should answer how to handle them. If the spec doesn't, the workflow becomes one-person-only because only that person knows the implicit rules.

## Naming

- Workflow folder: `kebab-case` (`bi-weekly-update`, `quarterly-business-review`)
- Step files: `step-{N}-{phase}.md` — N is the step number, phase is what the step does (`step-1-eng-status.md`, not `step-1.md`)
- Output files: `{YYYY-MM-DD}.md`
- Reference files: `{YYYY-MM-DD}.md` or `example-{YYYY-MM-DD}.md`
