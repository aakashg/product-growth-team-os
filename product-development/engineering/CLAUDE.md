# Engineering

## Doc Index

- bugs/ — Bug investigation history. Each file documents: symptoms, investigation steps, root cause, fix applied, and prevention measures.
  **Check here first when investigating a recurring bug.** Bugs often recur in the same part of the product. Past investigations save hours.

- rfcs/ — Technical design documents and architecture decisions. Named by date and topic (YYYY-MM-DD-topic.md).
  Use the /decision-log-entry skill for architecture decisions that affect the product team. RFCs are for deeper technical context that engineers need.

## Naming Conventions

- Bug files: `YYYY-MM-DD-short-description.md` (e.g., `2026-04-15-billing-sync-timeout.md`)
- RFC files: `YYYY-MM-DD-topic.md` (e.g., `2026-03-01-api-rate-limiting.md`)

## Bug Investigation Template

When documenting a bug, include:
1. **Symptoms** — What users saw or what alerts fired
2. **Investigation steps** — What you checked and in what order
3. **Root cause** — Why it happened
4. **Fix applied** — What changed
5. **Prevention** — What we did (or should do) to prevent recurrence

## Ownership

Engineering lead owns this folder. All PRs adding to engineering/ should be reviewed by eng.
