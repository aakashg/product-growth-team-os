# Accounts

Per-customer folders for managed/named accounts.

## Account Folder Layout

Every account uses the same shape so cross-customer queries work:

```
{customer}/
├── CLAUDE.md            # one-pager: contacts, segment, current relationship state
├── account-context.md   # persistent context — goals, risks, history, strategic notes
└── calls/
    ├── summaries/       # /YYYY-MM-DD.md per call (read-first, PII-safe)
    └── transcripts/     # /YYYY-MM-DD.md per call (loaded only when summary isn't enough)
```

## When You Add an Account

1. Create the folder: `accounts/{customer-slug}/`
2. Copy the `example-customer/CLAUDE.md` and `account-context.md` as templates
3. Create `calls/summaries/` and `calls/transcripts/`
4. Add a row to `../CLAUDE.md`'s **Named Accounts** table
5. Replace the example-customer folder once you have your own pattern established

## Customer Slugs

Use lowercase-with-hyphens: `acme-corp`, `axiom-logistics`, `meridian-health`. No spaces, no caps.
