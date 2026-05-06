# Meetings

Meeting docs, transcripts, and summaries — by meeting type.

## Folders

| Folder | What's Here |
|--------|-------------|
| `standup/` | Daily standup notes (`docs/`, `summaries/`) |
| `sprint-planning/` | Sprint planning agendas and outcomes (`docs/`, `summaries/`) |
| `team-bi-weekly/` | Bi-weekly team review (`docs/`, `transcripts/`, `summaries/`) |

Each meeting type has the same triad pattern Hannah uses for customer calls:

- `docs/` — agendas, prep notes, decisions made (the artifact you read into the meeting)
- `transcripts/` — raw transcripts when captured (Granola / Otter / etc.)
- `summaries/` — distilled summaries that other people read after the fact

Standups are usually too small to need transcripts — `docs/` and `summaries/` only.

## Naming

- **Docs:** `{YYYY-MM-DD}-{meeting-type}.md` (e.g., `2026-03-21-standup.md`)
- **Summaries:** `{YYYY-MM-DD}.md`
- **Transcripts:** `{YYYY-MM-DD}.md`

## When to Add a Meeting Type

Most teams need 2-3 meeting types here. Adding more usually means you should think about whether one of them belongs in `workflows/` instead (a recurring workflow like a bi-weekly update is more about the *process* than the meeting itself — see `workflows/bi-weekly-update/`).
