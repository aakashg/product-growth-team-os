# Engineering

Engineering plans, RFCs, and bug investigations. All organized by product area.

## Folders

| Folder | What's Here |
|--------|-------------|
| `plans/{area}/` | Implementation plans for upcoming features |
| `rfcs/{area}/` | Technical design proposals and architectural decisions |
| `bug-investigations/{area}/bug-{date}-{slug}/` | Dated investigation directories for production bugs |

## Product Areas

All three folders share the same product-area subfolders. The starter template ships with `billing/` as the worked example.

| Product Area | Subfolder | What's Here |
|--------------|-----------|-------------|
| Billing | `billing/` | Subscription, payments, credit, refunds |
| [Add yours] | `[area]/` | [Description] |

## Naming Conventions

- **Plans:** `{feature-name}.md` (e.g., `credit-usage-dashboard.md`)
- **RFCs:** `{feature-name}-rfc.md` (e.g., `credit-usage-dashboard-rfc.md`)
- **Bug investigations:** `bug-{MM-DD-YYYY}-{description}/investigation-plan.md`
  - Example: `bug-investigations/billing/bug-03-12-2026-credit-double-charge/investigation-plan.md`
  - Use a folder per investigation so artifacts (logs, attached queries, postmortem) can live alongside the plan

## Plans vs RFCs vs Decision Log

| Where | Used For |
|-------|----------|
| Engineering RFC | Architectural choices — system design, framework selection, schema migrations, API contracts |
| Engineering Plan | Implementation breakdowns once architecture is settled |
| Decision Log (`product/decisions/`) | Non-architectural decisions — pricing, GTM, scoping, vendor selection |
| Bug Investigation | Production issues with root-cause analysis |

If you're not sure: architectural choices go in RFCs, business choices in the decision log, implementation work in plans.

## Bug Investigation Template

When you create a `bug-investigations/{area}/bug-{date}-{slug}/investigation-plan.md`, include:

1. **Symptoms** — what users saw or what alerts fired
2. **Investigation steps** — what you checked and in what order, with timestamps
3. **Root cause** — why it happened (not "found a bug" — the actual mechanism)
4. **Fix applied** — what changed, with PR link
5. **Prevention** — what we did (or should do) to prevent recurrence

The investigation lives in its own folder so you can drop logs, attached queries, screenshots, and the postmortem alongside the plan.

## Working With This Folder

- **Starting a feature?** Write a plan in `plans/{area}/`. Reference it from `feature-index.yaml`.
- **Significant architectural decision?** Write an RFC in `rfcs/{area}/`. Don't put it in the decision log.
- **Production bug?** Create a directory in `bug-investigations/{area}/`. Even a rough investigation prevents the next person from starting from scratch.

For onboarding, see [onboarding-engineering.md](../../team/onboarding-guides/onboarding-engineering.md).
