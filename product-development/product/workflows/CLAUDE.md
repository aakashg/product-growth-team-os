# Workflows

Multi-step workflow specs your team runs on a recurring cadence.

## Why This Folder

A *meeting* is a single event. A *workflow* is a process — usually multi-step, often run with Claude or another agent — that produces a recurring artifact (a bi-weekly update doc, a launch readiness report, a quarterly business review).

Each workflow lives in its own folder with a `workflow-spec.md`, numbered step files, a `reference/` example, and an `output/` folder for the actual artifacts produced.

## Folder Layout

```
workflows/
└── {workflow-name}/
    ├── CLAUDE.md             # one-pager: what this workflow does, when to run, who owns
    ├── workflow-spec.md      # process flow, conventions, special cases
    ├── step-1-{phase}.md     # first step instructions
    ├── step-2-{phase}.md
    ├── step-3-{phase}.md
    ├── ...
    ├── reference/            # canonical examples of good output
    │   └── {date}.md
    └── output/               # actual produced artifacts (dated)
        └── {date}.md
```

## Starter Workflow

`bi-weekly-update/` ships as a worked example based on Hannah's bi-weekly cadence. Adapt or delete it — most teams either use a similar bi-weekly rhythm or replace it with their own (weekly review, monthly board update, quarterly business review).

## When to Add a New Workflow

- You run the same multi-step process every N days/weeks
- The output artifact has a recognizable shape (table, narrative, dashboard digest)
- A teammate (or agent) could pick it up cold from the spec without you in the room

## Authoring Guide

See [how-to-author-a-new-workflow.md](how-to-author-a-new-workflow.md) for the full pattern: when a workflow is appropriate vs. a skill, the 6-step authoring process, step-file structure, anti-patterns to avoid, and naming conventions.
