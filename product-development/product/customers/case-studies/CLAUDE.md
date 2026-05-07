# Case Studies (Permissioned)

Customer testimonials and case studies that have **explicit named permission** to share externally. This folder is the bridge between the PII-safe internal customer summaries and the named-quote material that sales and marketing need.

## Why a Separate Folder

`customer-call-summary` SKILL applies a strict PII rule — role-only attribution, no customer-side names. That's correct for internal synthesis but useless for sales decks and marketing landing pages.

This folder is the explicit opt-in path: a customer has signed a permission form, named the spokesperson, and approved specific quotes. Everything here is public-facing.

## Folder Layout

```
case-studies/
├── {customer-slug}-{topic}.md        # Full case study (publishable)
├── permissions.yaml                  # Registry of who has signed what permissions
└── quotes/{customer-slug}.md         # Approved quote bank, lifted into decks/landing pages
```

## File: permissions.yaml

```yaml
# One entry per permissioned customer
# Tracks what we're allowed to use externally and through what date
customers:
  example-customer:
    spokesperson:
      name: Sam Lee  # named, with permission
      title: VP Engineering
      email: sam@example.com  # for re-confirmation
    permission_form_signed: 2026-04-28
    permission_expires: 2027-04-28  # annual re-confirmation
    approved_uses:
      - logo_on_website
      - case_study_publication
      - quote_in_sales_deck
      - quote_in_blog_post
    approved_quotes:
      - "We shipped 3x faster after switching." # source: 2026-04-22 call
      - "The audit logging alone justified the migration." # source: case-study interview
    do_not_use:
      - revenue_figures
      - team_size
    last_reconfirmed: 2026-04-28
```

## Case Study Template

```markdown
# Case Study: {Customer} — {Topic}

**Spokesperson:** {Name}, {Title} (with permission)
**Published:** {Date}
**Approved through:** {Expiration}

## At a Glance

- **Problem:** {1 sentence}
- **Solution:** {1 sentence}
- **Result:** {Quantified outcome}

## The Problem

{2-3 paragraphs. Their context, what was broken, why it mattered.}

## The Solution

{2-3 paragraphs. What they implemented, how long it took, what changed in their workflow.}

## The Result

{2-3 paragraphs. Quantified outcomes — only metrics they've approved for publication.}

## Quote

> "{Approved quote}"
> — **{Name}**, {Title}, {Customer}

## Use This Case Study For

- Sales deck slide: yes
- Landing page hero: yes (logo + headline metric)
- Blog post: yes (full text)
- Cold outbound: only with approved excerpt
- Trade show banner: needs additional approval
```

## Permission Re-Confirmation

Every quote / case study has an expiration. Before each major use:

1. Check `permissions.yaml#{customer}.permission_expires` — if within 30 days, re-confirm
2. Send a one-line email: *"We're using your quote in [context]. Still good with you? Reply yes/no."*
3. Update `last_reconfirmed`

If the customer's spokesperson leaves their company (champion change), retire the quote until you've re-confirmed with their successor.
