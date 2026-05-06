# Bi-Weekly Update Workflow Spec

## Overview

This workflow produces a dated bi-weekly team-update document. It runs interactively — each step has an automated part (data gathering, drafting) and an interactive part (PM reviews, approves, edits). Each section writes to the output file as it completes.

## Process Flow

```
1. Create dated output file in output/YYYY-MM-DD.md
2. Step 1: Engineering Status      → writes "What the Team Is Building Now"
3. Step 2: Customer Call Synthesis → writes "Customer Calls (last 2 weeks)"
4. Step 3: Customer Updates        → writes pilot/launch status sections
5. Step 4: Push to Google Doc      → auto-push via Google Workspace MCP (if connected)
6. Step 5: Review                  → PM reviews, edits, publishes
```

Each step reads its own instruction file (`step-1-eng-status.md`, etc.) for the detailed process.

## What Changes Every Cycle vs. What's Stable

### Changes every cycle

- **Engineering status** — workstream statuses update from tracker + PM context dump
- **Customer calls section** — completely rewritten each cycle from last 2 weeks of calls
- **What we're hearing / highlights** — completely rewritten
- **Pilot/customer exec summaries** — updated only if new call data changes the narrative

### Stable across cycles (carried forward, not rewritten)

- **OKR structure and goals** — updated only when OKRs change (quarterly)
- **Customer deep-dive background** — updated only when materially new info emerges
- **Cross-customer summary** — updated when shared gaps change or new accounts are added
- **Table of contents structure** — updated when sections are added/removed

## Conventions

### Formatting

- Business-goal-led section headings (not feature-led)
- Customer quotes: *"Quote text."* — Their Role
- No em-dashes in body text
- No horizontal rules between sections
- Tables and bullets for scannable content; paragraphs for narrative

### Customer Categorization

Each customer in the call-synthesis table gets one of:

- **Paying** — signed and paying
- **Pilot** — active pilot, not yet paying
- **Pipeline** — in pipeline, being pitched
- **Free tier** — on free plan, potential upsell

### Date Ranges

- Each cycle covers exactly 2 weeks
- Section header format: "Month DD - Month DD" (e.g., "Apr 28 - May 11")
- Customer-table date format: MM/DD (e.g., 05/04)

## Handling Special Cases

### New customers (first call)

- Add to customer table with appropriate category
- If they become a pilot, create a new pilot section
- Ask the PM: *"Should we add a pilot section for [customer]?"*

### New pilots

- Create exec summary and deep dive following existing pilot format
- Add to cross-customer summary if they share gaps with existing pilots
- Add to TOC

### Ad-hoc requests

One-off content (competitive analysis, strategic memos) is handled inline during Step 5 (Review) when the PM can request additions.

### Removing stale content

If a customer hasn't been discussed in 2+ cycles, ask the PM: *"Should we keep [customer] pilot section, or archive it?"*

## File Naming

- Output files: `output/YYYY-MM-DD.md` (date of the bi-weekly meeting)

## Push to Output Sink

Step 4 auto-pushes the compiled update to the team's output sink (Google Doc / Notion / Confluence). This eliminates manual copy-paste and keeps the shared doc in sync with the source markdown. See `step-4-push-to-gdoc.md` for the wiring.

## Reference

`reference/` holds canonical good-output examples. When in doubt about format, model new runs against the most recent reference doc.
