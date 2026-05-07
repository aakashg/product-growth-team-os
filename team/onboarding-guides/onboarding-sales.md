# Onboarding: Sales

Setup and orientation specific to AEs and sales engineers.

> Read [onboarding-general.md](onboarding-general.md) **first** — Day 1-5 reading list and warning about under-populated repos. This guide layers sales-specifics on top.

## Setup

See [General Onboarding](onboarding-general.md#setup) for shared tools.

### Sales-Specific Tools

| Tool | Purpose | Access |
|------|---------|--------|
| CRM (Salesforce / HubSpot / Pipedrive) | Pipeline, contacts, opportunity tracking | Workspace invite |
| Gong / Chorus / Modjo | Call recording + AI insights | Team license |
| Highspot / Seismic / Showpad (or shared drive) | Polished pitch decks for prospects | Workspace invite |
| LinkedIn Sales Navigator | Prospecting + champion tracking | License from manager |

## Key Documents

- [Sales Enablement](../../product-development/product/sales-enablement/CLAUDE.md) — battlecards, talk tracks, persona briefs, objection handling
- [Competitive Research](../../product-development/product/competitive-research/CLAUDE.md) — raw competitor intel that battlecards distill
- [Case Studies](../../product-development/product/customers/case-studies/CLAUDE.md) — permissioned customer stories you can share externally
- [Win-Loss](../../product-development/product/customers/win-loss/CLAUDE.md) — what we win and lose, with patterns
- [Feature Index](../../product-development/feature-index.yaml) — what's actually shipped (don't pitch unshipped features)
- [Decisions Log](../../product-development/product/decisions/CLAUDE.md) — pricing, packaging, GTM decisions

## Skills You'll Use

- `/customer-call --quick` — summary discovery / sales calls; auto-tags feature requests
- `/battlecard-update` — when you lose to a competitor or learn new intel
- Win-loss entry after every deal outcome

## First Tasks

- [ ] Read all four battlecards in `sales-enablement/battlecards/` (replace with real ones)
- [ ] Read the 3 most recent case studies in `customers/case-studies/`
- [ ] Read the 5 most recent win-loss entries
- [ ] Shadow 3 calls before running discovery solo
- [ ] Run a discovery call solo; submit the call summary + win-loss entry within 24h

## Where Your Work Lives

| Artifact | Location |
|----------|----------|
| Battlecards | `sales-enablement/battlecards/{competitor}.md` |
| Talk tracks | `sales-enablement/talk-tracks/{stage}.md` |
| Objection handling | `sales-enablement/objection-handling/{topic}.md` |
| Win-loss entries | `customers/win-loss/{date}-{outcome}-{customer}.md` |
| Discovery call summaries | `customers/accounts/{customer}/calls/summaries/{date}.md` (Quick variant) |
| Case studies | `customers/case-studies/{customer-slug}-{topic}.md` (only after permission signed) |

## The Two Most-Asked Questions

**"Where do I find the latest competitor pricing?"**
`competitive-research/competitors/{competitor}/pricing.md`. If it's > 90 days old, the freshness check has flagged it — update before pitching.

**"Can I quote this customer in a deck?"**
Only if they appear in `customers/case-studies/permissions.yaml` with the relevant approved use. Internal customer-call summaries use role-only attribution and are NOT for external use.

## Sales Team Cadence

| Cadence | What |
|---------|------|
| Daily | Log new prospects in CRM; run discovery calls; update CRM |
| Per-deal | Win-loss entry within 48h of outcome |
| Weekly | Read `weekly-synthesis` digest for what shipped (don't pitch what wasn't) |
| Monthly | Refresh one battlecard with the latest competitor intel |
| Quarterly | Update buyer-persona briefs based on patterns from the quarter's deals |

## Surface Field Feedback to PM

When you lose a deal because we don't have a feature, the win-loss entry creates the record. The bi-weekly synthesis surfaces 3+ deals with the same missing feature to PM. You don't have to file tickets — the synthesis does it.

If you have a *strong* signal — single deal lost on a feature gap and you think it'll recur — message the PM directly with a link to your win-loss entry.
