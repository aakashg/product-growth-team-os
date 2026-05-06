# Customers

## Doc Index

Each customer has their own folder with:
- CLAUDE.md — Key contacts, segment, account context, relationship summary
- summaries/ — Structured call summaries (read these FIRST for any customer query)
- calls/ — Raw transcripts (only load if summaries don't answer the question)

## Customer Index

| Customer | Segment | Primary Contact | Last Call |
|----------|---------|-----------------|-----------|
| [Acme Corp] | [Enterprise] | [Jane Smith, VP Eng] | [2026-04-28] |
| [Forge Labs] | [Mid-market] | [Tom Lee, Head of Product] | [2026-04-15] |

## How to Add a New Customer

1. Create a folder: customers/[customer-name]/
2. Add a CLAUDE.md with key contacts, segment, and relationship summary
3. Create summaries/ and calls/ subfolders
4. Use the /customer-call-summary skill after every call
