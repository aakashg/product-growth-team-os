# Customer Call

Process a customer call — transcript or notes — into a paired summary + transcript file under the customer's account folder, update the account context, and draft Slack and email follow-ups.

This command orchestrates the `customer-call-summary` skill and writes the final files. Read `.claude/skills/customer-call-summary/SKILL.md` for the formatting rules and `.claude/skills/customer-call-summary/examples/example-2026-01-27.md` for the level of detail expected.

## Step 1: Identify the Customer and Product Area

Ask the user (or infer):
- Customer name (matches `product-development/product/customers/accounts/{customer}/`)
- Product area (matches a top-level key in `feature-index.yaml`)
- Date of the call
- Attendees by role (no customer-side personal names per the PII rule)

If the customer folder doesn't exist:
1. Create `accounts/{customer}/CLAUDE.md`, `accounts/{customer}/account-context.md`, `accounts/{customer}/calls/summaries/`, `accounts/{customer}/calls/transcripts/`
2. Update `accounts/CLAUDE.md` with a row for the new customer

## Step 2: Check for Existing Files

Always check both folders before creating new ones:
- `accounts/{customer}/calls/summaries/{YYYY-MM-DD}.md`
- `accounts/{customer}/calls/transcripts/{YYYY-MM-DD}.md`

If a file for this date already exists, append rather than overwrite. If summaries exist for prior dates, review the **Open Action Items** table at the top of the most recent one and ask the user about unclear status before drafting new items.

## Step 3: Gather the Transcript

The transcript may come from:
- A pasted transcript
- A file path the user provides
- A meeting notes tool (Granola, Otter, Fireflies — check which MCP is connected)
- Spoken/typed notes from the user (no formal transcript)

If a transcript exists, save the raw text to `accounts/{customer}/calls/transcripts/{YYYY-MM-DD}.md` with a header that links back to the summary.

## Step 4: Generate the Summary

Read the skill: `.claude/skills/customer-call-summary/SKILL.md`. Read the example for the expected level of detail. Generate the summary with these sections in order:

1. Executive Summary (with inline italicized quotes)
2. Insights / Learnings (organized by topic, table format)
3. Feature Requests (organized by area, table format)
4. Next Steps (organized by category, every action has owner + due date)
5. Follow-up Email
6. Slack Summary
7. Relationship Signal

Apply the **PII rule**: no customer-side personal names anywhere in the summary. Role titles only.

## Step 5: Write Files

1. Write the summary to `accounts/{customer}/calls/summaries/{YYYY-MM-DD}.md`
2. Write the transcript (if available) to `accounts/{customer}/calls/transcripts/{YYYY-MM-DD}.md`
3. Add a cross-reference link from the summary to the transcript
4. Update `accounts/{customer}/account-context.md` if any new context is worth carrying forward (new champion, renewal date moved, new strategic risk)
5. Update `accounts/CLAUDE.md` table with the last-call date

## Step 6: Run the Quality Checklist

From SKILL.md. Don't skip. The most-skipped checks: implied feature gaps, hypothesis-validation section when warranted, role-only attribution.

## Step 7: Hand Off Slack Draft

Present the Slack summary draft for the user to review and post. If a Slack MCP is connected, offer to post it directly to the team's product channel.

## Notes

- **Why a command + a skill?** The skill is the format. The command is the process. The command can evolve (different intake sources, new MCP connections) without changing the format.
- **Large transcripts:** if pasted text exceeds ~30KB, save the transcript via repeated appends rather than a single write — see Hannah's `customer-call.md` for the Python-chunked approach.
- **Action items live at the top of the summary file**, not per-meeting. Each new meeting updates the Open / Completed tables in place.
