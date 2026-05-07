# Step 2: Decision Revisit

Walk recent decisions and add hindsight notes. The outgoing PM has the most calibrated view of what worked, what didn't, and what's wobbling.

## Inputs

- `product/decisions/` — last 12 months of decisions, especially ones the outgoing PM authored or co-decided
- The outgoing PM's memory (the rare resource — capture before it leaves)

## Process

1. **List decisions** — filter to the last 12 months, sort by date.
2. **For each one, ask the outgoing PM:**
   - "Was this decision right?"
   - "Are there assumptions that have started to break?"
   - "What would you re-evaluate now if you had time?"
   - "What's the single thing the successor should know about this decision that isn't in the file?"
3. **Append a `## Hindsight` section** to each decision file. Date the entry, name the outgoing PM:

```markdown
## Hindsight

- {YYYY-MM-DD} ({months in}, outgoing PM {name}): {Specific note. Be honest. "We modeled the cost ratio at 22x; settled at 18x — Tier B pricing should be re-tuned."}
```

4. **Decisions still in flight** — if a decision's revisit conditions are about to trigger, flag in the handoff doc.
5. **Decisions worth reversing** — if the outgoing PM thinks a decision should be reversed, log a *new* decision marking the original as Superseded. Don't edit the original.

## Output Section (writes to handoff doc)

```markdown
## Decisions With Hindsight Notes

| Decision | Hindsight (TL;DR) |
|----------|-------------------|
| `{date}-{topic}.md` | "{1-line note}" |

## Decisions Approaching Revisit

| Decision | Revisit condition | Trigger date | New owner |
|----------|------------------|--------------|-----------|

## Decisions the Outgoing PM Would Reverse

| Decision | Why | Recommended action |
|----------|-----|---------------------|
```

## Quality Checks

- [ ] Every decision authored by outgoing PM in last 12 months has either a hindsight note or "no hindsight to add" annotation
- [ ] Decisions approaching revisit have named successors who'll do the revisit
- [ ] Reversal recommendations have a paired new decision file (don't edit originals)
