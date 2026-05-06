---
name: customer-call-summary
description: Process a customer call transcript or notes into a structured summary, insight tables by topic, feature requests by area, action items, follow-up email, and Slack message. PII-safe by default.
---

# Customer Call Summary

Use this skill after every customer call. Pick a variant based on team size.

> **Note:** anything in `{curly-braces}` is a placeholder — replace with your actual value (so `{customer}` → `acme-corp`, `{YYYY-MM-DD}` → `2026-04-28`).

## Start Here: Quick Variant (most teams want this)

If you have under ~10 active customers, **use the Quick variant**. Three sections, two minutes:

```markdown
# {Customer} — Call Summary {YYYY-MM-DD}

**Attendees:** {Our names. Customer side: roles only}
**Call type:** {Discovery / Check-in / Escalation / Renewal / Demo}

## Executive Summary

{2-3 paragraphs covering: status updates, what was discussed, key takeaways. Weave in 1-2 italicized verbatim quotes (role-attributed): *"quote" — Their VP of Eng*. Note any implied product gaps.}

## Action Items

- [Action] — Owner: {Name from team roster} — Due: {YYYY-MM-DD}

## Relationship Signal

{One sentence: healthy / at risk / expanding, with evidence.}
```

That's the whole thing. PII rule (no customer-side personal names) still applies. This is enough for a 3-person team with 5 customers and a 10-person team with 8 customers.

**Save the file at:** `product-development/product/customers/accounts/{customer}/calls/summaries/{YYYY-MM-DD}.md` (replace `{customer}` with the customer slug like `acme-corp`, replace `{YYYY-MM-DD}` with the call date).

If the customer folder doesn't exist, create it with a CLAUDE.md and an `account-context.md` (see `accounts/CLAUDE.md` for the template).

## When to Use

After every customer call, sales call, support escalation, or user research session. Run immediately while the conversation is fresh.

## Input

Provide ONE of:
- A transcript file (from Granola, Otter, Zoom, Fireflies, etc.)
- A voice dictation of your key takeaways
- Paste the raw notes you took during the call
- If you have NOTHING written: the skill will ask you 5 short questions and generate from the answers

If no transcript is available, the skill asks:
1. Who was on the call? (Customer name, attendees, roles)
2. What's the one thing you most want to remember from this call?
3. Were they happy, frustrated, or neutral overall?
4. Did they ask for anything specific?
5. Any competitors mentioned?

Also: customer name, attendees and their roles, date of call.

## Two Output Files

Save **two paired files**:

- Summary: `accounts/{customer}/calls/summaries/{YYYY-MM-DD}.md`
- Transcript: `accounts/{customer}/calls/transcripts/{YYYY-MM-DD}.md`

**Switch to the Full variant** below when:
- You have 10+ active customers and you're synthesizing across calls
- Cross-customer pattern detection is the main payoff (e.g., "what are 5+ customers asking for that we don't ship?")
- You're producing the bi-weekly customer-call-synthesis section in `workflows/bi-weekly-update/`

The Full variant has 7 sections (Executive Summary, Insights tables, Feature Requests tables, Next Steps, Follow-up Email, Slack Summary, Relationship Signal) and is what scales for a team like Hannah's.

---

## Full Variant

### Full Variant Structure

Every Full-variant customer call summary should include these sections in order:

### 1. Executive Summary

Detailed overview that orients the reader and captures the key takeaways.

**Quotes:** Always weave verbatim quotes directly into the executive summary paragraphs as italicized inline quotes (e.g., *"We are digging it." — Their VP of Eng*). The exec summary is the most-read section. Quotes bring it to life.

**Opening paragraph:** Status updates and quick wins / progress since last meeting.

**Second paragraph:** "This call focused on X areas: (1) [topic], and (2) [topic]." — orient the reader.

**Topic sections:** For each major topic discussed, add a bold inline header and detailed paragraph (e.g., `**Templates for Batch Projects**` — context, decisions, blockers).

**How [Customer] is Using [Feature/Workflow]:** Scope this to the specific features discussed on *this* call, not a comprehensive product-usage overview.

**Opportunity Areas:** Paragraph or numbered list. Tie back to their workflows.

**Strategy / Hypothesis Validation** *(when applicable):* When the call provides evidence that validates or invalidates a product hypothesis, add a dedicated section with quotes as evidence.

**UX Findings** *(when applicable):* If the customer surfaced UX issues — confusing flows, missing affordances, unclear error states, friction in routine tasks — capture them as a dedicated subsection. Designers will filter on this when synthesizing across calls. Format:

```markdown
**UX Findings**
- **[Surface / flow]:** [Specific friction observed or described]<br><br>*"[Quote if available]" — [Their role]*
```

**Key Product Gaps:** Bullet list. Actively identify *implied* gaps — things they're working around, doing manually, or switching tools for. Don't just capture explicit requests.

```markdown
**Key Product Gaps**
- **[Gap 1]:** [Specific description with context]
- **[Gap 2]:** [Specific description with context]
```

### 2. Insights / Learnings

Organize by topic. For each topic:

```markdown
### [Topic Name]

[1-2 sentence summary of what we learned in this topic area]

| Insight | Details |
|---------|---------|
| **[Insight headline]** | [Detailed description with specific examples from the call]<br><br>*"[Verbatim quote]" — [Speaker role]* |
```

Include enough context that someone who wasn't on the call understands the *why* behind the insight, not just the *what*.

### 3. Feature Requests

Organize by area. For each area:

```markdown
### [Area Name] (e.g., "Data Export & Sharing", "Filtering & Search")

[Description of this feature area and the underlying need]

**Blocker:** [If applicable — what's blocking progress and any dependencies]

| Feature | Details |
|---------|---------|
| **[Feature name]** | [Detailed description]<br><br>*"[Verbatim quote]" — [Speaker role]* |
```

### 4. Next Steps

```markdown
## Next Steps

### [Category] (e.g., "Onboarding", "Template Configuration")
- [Action item] — Owner: [Name from team roster] — Due: [YYYY-MM-DD]
```

Every action item must have an owner from the team roster and a due date.

### 5. Follow-up Email

Draft a follow-up email to send to the customer:

```markdown
## Follow-up Email

**To:** [Customer contact role] (first name allowed in salutation only — see PII rules below)
**Subject:** [Meeting Topic] Recap + Action Items

Hi [first-name-or-"there"],

Thanks for the great discussion today! Here's a quick recap:

**What we covered:**
- [Key topic 1]
- [Key topic 2]

**Action items for you:**
- [ ] [Item 1]
- [ ] [Item 2]

**From our side:**
- [Item 1]
- [Item 2]

Let me know if I missed anything!

Best,
[PM name]
```

### 6. Slack Summary

Ready-to-post Slack message for internal stakeholders.

**Format:**
- Opening: "Great [frequency] sync with [Customer] today! Full recap here: [link]"
- Bold topic headers per major area
- Detailed paragraphs with inline customer quotes
- Numbered lists for fixes/action items
- End with "Issues to come for all items raised above." when applicable

**Content:** hit ALL key takeaways with specifics. Include quotes capturing enthusiasm, frustration, or key feedback. Note when the customer is already taking action (e.g., assigning internal owners).

### 7. Relationship Signal

```markdown
## Relationship Signal

[One sentence: is this account healthy, at risk, or expanding? What evidence supports this?]
```

This is our addition to Hannah's format. Pair it with the customer's `account-context.md` so that a single query can surface every at-risk account across the portfolio.

## Action Item Management

Action items live at the **top of the summary file**, split into Open and Completed tables. Each meeting:

1. Review existing Open items against what was discussed
2. Ask user about unclear status — "Was [action item] completed?"
3. Move completed items to Completed (add completion date)
4. Add new items from this meeting

```markdown
## Open Action Items

| Action Item | Owner | From Meeting |
|-------------|-------|--------------|

## Completed Action Items

| Action Item | Owner | From Meeting | Completed |
|-------------|-------|--------------|-----------|
```

## PII and Privacy Rules

This is our most important addition to Hannah's format:

1. **Never include customer-side personal names in summaries.** Use role titles only — "Their VP of Engineering," "Their Head of Product," "Their Champion." Our team members' names are fine.
2. **Quotes:** attribute by role, not name — *"We are digging it." — Their VP of Eng*.
3. **The transcript file may contain raw names** because it's a faithful record. The summary file (which gets shared and synthesized) must not.
4. **No revenue figures, salary info, or PII** beyond role and company. Those live in the CRM, not here.
5. **Outgoing-email exception.** The follow-up email is the one section where a customer-side first name is allowed — but only in the salutation line (`Hi Sam,`). Email body, subject, and `To:` field still follow role-only attribution. The salutation is the only line sent verbatim to the customer; everything else is read internally. If the first name is unknown, write `Hi there,` — never produce a literal `[Name]` placeholder.

If you're tempted to write a name, write the role instead. If unsure of the role, write "Their attendee."

## Verbatim Guidelines

1. **Always italicize** with role attribution: *"Quote text" — Their VP of Eng*
2. **Put quotes on separate lines** in tables using `<br><br>` before the quote in the cell
3. **Choose quotes that are** specific and actionable, particularly revealing of customer needs, or supporting evidence for key insights
4. **Keep quotes concise** — trim to the essential part if needed
5. **Preserve exact wording** — don't paraphrase within quotes
6. **Multiple quotes** when they add different perspectives

## Quality Checklist

Before finalizing:

- [ ] Executive Summary has opening status paragraph + topic-focus paragraph
- [ ] Executive Summary includes inline italicized quotes
- [ ] "Key Product Gaps" identifies *implied* gaps, not just explicit requests
- [ ] Hypothesis-validation section included when call provides evidence
- [ ] Insights organized by topic with summary paragraphs + table format
- [ ] Feature Requests organized by area with summary paragraphs + table format
- [ ] Blockers noted where applicable
- [ ] Next Steps organized by category, every item has owner + due date
- [ ] Follow-up Email drafted with checkbox action items
- [ ] Slack Summary drafted, hits all takeaways with specifics
- [ ] Relationship Signal: one sentence, evidence-backed
- [ ] PII rule satisfied — no customer-side personal names anywhere in the summary
- [ ] Action item tables at file top updated (completed moved, new added)
- [ ] If transcript exists, transcript file saved to `transcripts/{YYYY-MM-DD}.md` with cross-reference link
- [ ] `account-context.md` updated with any new context worth carrying forward

## Related

- **Multi-step orchestrator:** `.claude/commands/customer-call.md` walks through transcript intake, file checks, generation, and writes — invokes this skill mid-flow
- **Account folder template:** `product-development/product/customers/accounts/CLAUDE.md`
- **Insights aggregation:** `freshness-check` skill flags accounts that haven't had a logged call in 90+ days
