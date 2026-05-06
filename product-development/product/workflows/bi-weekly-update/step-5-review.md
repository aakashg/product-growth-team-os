# Step 5: PM Review and Publish

Final pass before the bi-weekly meeting. PM reviews, edits, adds ad-hoc content, publishes.

## Process

1. Open the compiled `output/YYYY-MM-DD.md` and the destination doc (Google / Notion / Confluence)
2. Walk every section in order. For each: read aloud or scan, ask "would my CEO understand this in 10 seconds?"
3. Ad-hoc additions — competitive intel, strategic memos, leadership asks — get added inline here. Drop the new content into the appropriate section.
4. Edit for clarity:
   - Cut em-dashes in body text
   - Convert long paragraphs to bullets if scannable
   - Make sure every quote has a role attribution
   - Make sure every metric has a comparison point (vs. last cycle, vs. target)
5. Flag any section that's stale ("no material change since 2026-04-28") for archival next cycle if it stays stale
6. Publish — share the destination URL in the team's bi-weekly Slack channel

## Common Edits

- Replace bare metric numbers with rate-of-change ("47%" → "47%, up from 41% last cycle")
- Replace passive language ("the project was delayed") with named ownership ("Riley moved the project to next sprint to land the SSO migration first")
- Cut sections that have nothing new — link forward to the previous cycle instead

## After Publishing

- Move `output/YYYY-MM-DD.md` to the canonical reference set if this cycle's output is unusually well-shaped (good template for future cycles → copy into `reference/`)
- Note any process improvements in `team-learnings.md`
