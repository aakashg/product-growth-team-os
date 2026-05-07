# Step 4: Warm Intros

People the successor needs to meet before the outgoing PM leaves. Trust transfers slowly through humans, fast through warm intros — schedule them while the outgoing PM still has standing.

## Inputs

- Team roster (internal stakeholders the successor needs)
- `customers/accounts/portfolio.yaml` (customer champions per account)
- The outgoing PM's mental list of "people who matter for this role"

## Process

1. **Map the trust graph.** Who does the outgoing PM rely on for fast-yes, fast-no, and sanity-check? Capture in three buckets:
   - **Customer champions** — the named external contacts whose trust the role depends on
   - **Internal partners** — eng leads, designers, analysts, CSMs, ops who enable the work
   - **Cross-functional gatekeepers** — finance approvers, legal, security review, IT
2. **Draft intro emails / Slack DMs** for each person. Format:

```
Subject: Intro: {successor} taking over from {outgoing}

Hi {Name},

Quick intro — {successor} is picking up the {role/product area} from me starting {date}. They've been at {company} for {context}, and they'll be the right person to talk to about {topic}.

I'd love to do a 15-min handoff call with the three of us before {last day}. Does {time} work?

{outgoing}
```

3. **Schedule the calls.** Aim for 15-minute three-way calls, not async intros — synchronous handoffs build trust faster.
4. **For customers**: prioritize accounts with renewal in next 90 days, accounts at-risk, accounts where the relationship is mostly outgoing-PM-personal. Skip accounts where the relationship is durable across people.
5. **Track completion** — `intro_status: complete` in `portfolio.yaml` after each customer intro.

## Output Section (writes to handoff doc)

```markdown
## Warm Intros — Customers

| Account | Champion role | Why critical | Intro by | Status |
|---------|--------------|--------------|----------|--------|
| {Customer} | Their VP of Eng | Renewal in 60 days | 2026-05-12 | scheduled |

## Warm Intros — Internal

| Person | Role | Why successor needs them | Intro by |
|--------|------|--------------------------|----------|

## Warm Intros — Cross-Functional

| Person | Role | When successor will need them |
|--------|------|------------------------------|
```

## Conventions

- **Intros default to three-way calls.** Async intros work for low-stakes; high-stakes relationships need a real handoff.
- **Don't cc the customer on internal intros.** Two separate intro tracks.
- **Prioritize.** A 15-person warm-intro list is unrealistic for a 2-week notice. Pick the 5 most critical for customers, 5 for internal.

## Quality Checks

- [ ] Every customer with renewal < 90 days has a scheduled intro
- [ ] Every internal partner the outgoing PM relied on weekly has a scheduled intro
- [ ] At-risk accounts have customer + internal intros done before last day, not after
