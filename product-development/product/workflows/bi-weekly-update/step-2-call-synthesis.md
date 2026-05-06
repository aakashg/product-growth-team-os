# Step 2: Customer Call Synthesis

Synthesizes the last 2 weeks of customer call summaries into a "Customer Calls" section.

## Inputs

- All summaries in `customers/accounts/{customer}/calls/summaries/{YYYY-MM-DD}.md` modified in the last 14 days
- `customers/CLAUDE.md` — for segment categorization

## Process

1. List every summary file modified in the last 14 days, grouped by customer
2. For each customer, extract:
   - Their category (Paying / Pilot / Pipeline / Free tier)
   - The 1-2 highest-signal insights from the most recent call
   - Any feature requests new this cycle
   - Any escalations or risks
3. Identify cross-customer patterns: gaps mentioned by 2+ customers, hypotheses being validated/invalidated, themes
4. Write the "Customer Calls" section

## Output Section Shape

```markdown
## Customer Calls (Apr 28 - May 11)

| Customer | Category | Date | Top Signal |
|----------|----------|------|------------|
| Customer A | Paying | 05/04 | [One-line takeaway with role-attributed quote] |
| Customer B | Pilot | 05/06 | [...] |
| Customer C | Pipeline | 05/09 | [...] |

### What We're Hearing

[2-3 short paragraphs on the cross-cutting themes — what showed up across multiple calls, what's validating or invalidating active hypotheses, where the noise is.]

### Feature Requests Surfaced This Cycle

| Feature | Customers Asking | Notes |
|---------|------------------|-------|
| [Feature] | A, C | [Pattern] |
```

## PII Reminder

Customer-side names never appear in the synthesis (or in the source summaries it pulls from). Role-attributed quotes only.
