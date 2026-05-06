# Session Start Hook

Runs automatically at the start of every new Claude Code session. Injects essential context so conversations start informed.

## What Gets Injected

1. **Team roster** — From root CLAUDE.md. Enables "Slack Alex about the bug" queries.
2. **Current priorities** — From product-development/product/strategy/current-quarter.md (if exists).
3. **Recent decisions** — The 3 most recent decision log entries (by filename date).
4. **Accumulated learnings** — From .claude/team-learnings.md (if exists). Prevents recurring mistakes.
5. **Active retro items** — From the most recent file in team/retros/ (if exists).

## How to Install

### Option A: Claude Code hooks (recommended)

Add to your `.claude/settings.json`:

```json
{
  "hooks": {
    "session_start": {
      "command": "bash .claude/hooks/session-start.sh"
    }
  }
}
```

Then create `.claude/hooks/session-start.sh`:

```bash
#!/bin/bash
# Team OS session start hook
# Injects team context into every new session

echo "=== TEAM CONTEXT ==="

# Root CLAUDE.md (always exists)
cat CLAUDE.md 2>/dev/null

echo ""
echo "=== RECENT DECISIONS (last 3) ==="

# Get the 3 most recent decision files by name (YYYY-MM-DD prefix)
# Using find + sort to handle filenames with spaces safely
find product-development/product/decisions -maxdepth 1 -name "*.md" ! -name "CLAUDE.md" -print0 2>/dev/null \
  | sort -z -r \
  | head -z -n 3 \
  | xargs -0 -I {} sh -c 'echo "--- $(basename "{}")" && head -10 "{}"' 2>/dev/null \
  || echo "No decisions found yet."

echo ""
echo "=== CURRENT PRIORITIES ==="
cat product-development/product/strategy/current-quarter.md 2>/dev/null \
  || echo "No priorities file yet. Create one at product-development/product/strategy/current-quarter.md"

echo ""
echo "=== TEAM LEARNINGS ==="
cat .claude/team-learnings.md 2>/dev/null \
  || echo "No team learnings file yet. Create one at .claude/team-learnings.md"
```

Make it executable: `chmod +x .claude/hooks/session-start.sh`

### Option B: Simple (no shell script)

Just keep the root CLAUDE.md comprehensive. Claude Code loads it automatically every session. The hook adds recent decisions and priorities on top, but a good CLAUDE.md covers 80% of the value.

## Team Learnings File

Create .claude/team-learnings.md (template included in this repo). Add entries when:
- Claude consistently gets something wrong in this repo
- The team agrees on a formatting pattern
- Someone discovers a working preference that should persist

Example entries:
- "When asked about churn, always specify by-segment or by-tier. Claude defaults to overall."
- "Customer summaries never include PII. Use role titles, not personal names."
- "SQL queries always include the verified-by comment header."

This file prevents the same mistakes from recurring across sessions and across team members.

## Troubleshooting

**Hook doesn't fire:** Make sure you're running Claude Code in terminal (not Cursor). Hooks are a terminal feature.

**Hook fires but errors:** Run `bash .claude/hooks/session-start.sh` manually to see the error. Usually a missing file or wrong path.

**Too much context injected:** If the hook is loading too many tokens, reduce the `head -n 3` to `head -n 1` for decisions, or remove the priorities section if it's long.
