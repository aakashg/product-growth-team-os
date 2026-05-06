# Customer Call Summary

Generate a structured summary of a customer call in the team's standard format. Consistent formatting across every team member makes cross-customer analysis trivial.

## When to Use

After every customer call, sales call, support escalation, or user research session. Run immediately while the conversation is fresh.

## Input

Provide ONE of:
- A transcript file (from Granola, Otter, Zoom, Fireflies, etc.)
- A voice dictation of your key takeaways
- Paste the raw notes you took during the call
- If you have NOTHING written: answer the prompts below and the skill will generate the summary

If no transcript is available, ask the user these questions:
1. Who was on the call? (Customer name, attendees, roles)
2. What's the one thing you most want to remember from this call?
3. Were they happy, frustrated, or neutral overall?
4. Did they ask for anything specific?
5. Any competitors mentioned?

Also provide:
- Customer name
- Attendees and their roles
- Date of call

## Output Format

Generate a markdown file with this EXACT structure and save it to:
`product-development/product/customers/[customer-name]/summaries/[YYYY-MM-DD]-call.md`

If the customer folder doesn't exist yet, create it with a CLAUDE.md containing the customer name, segment, and primary contact.

```markdown
# [Customer Name] — Call Summary [YYYY-MM-DD]

**Attendees:** [Names and roles — OUR side: full names. CUSTOMER side: role titles only, no personal names. E.g., "Their VP of Engineering, their Head of Product"]
**Duration:** [Approximate]
**Call type:** [Discovery / Check-in / Escalation / Renewal / Demo / User Research]

## Key Takeaways (3-5 bullets)
- [Most important thing learned]
- [Second most important]
- [Third]

## What's Working for Them
- [Specific positive feedback with context]

## Pain Points
- [Specific frustrations or blockers with context]

## UX Issues Observed
- [Any usability problems mentioned or observed — confusing flows, missing affordances, error states]
- [If none observed, remove this section entirely]

## Feature Requests
- [Specific request] — Priority: [High/Medium/Low based on their emphasis]
- [Include who asked and why they need it]

## Competitive Mentions
- [Any competitor mentioned and in what context. If none, remove this section.]

## Action Items
- [ ] [Action] — Owner: [Name from team roster] — Due: [YYYY-MM-DD]

## Quotable Moments
- "[Direct quote that captures their sentiment]" — [Their role title, not name]

## Relationship Signal
[One sentence: Is this account healthy, at risk, or expanding? What evidence supports this?]
```

## Rules

1. Keep the summary under 500 tokens. Extract signal, don't compress transcripts.
2. **PII rule: Never include customer-side personal names in summaries.** Use role titles only (e.g., "Their VP of Engineering"). Our team members' names are fine.
3. Every action item must have an owner (from the team roster in root CLAUDE.md) and a due date.
4. If the call was in a language other than the repo's primary language, write the summary in the repo's language but note the original language and include key quotes in the original language.
5. After saving, update the customer's CLAUDE.md with the call date and any changed relationship context.
6. After saving, update customers/CLAUDE.md index table with the last call date.
7. If a section has no content (no competitive mentions, no UX issues), remove that section rather than writing "None."
