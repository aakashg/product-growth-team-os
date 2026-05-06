# Pricing Page Audit (2026-04-15)

> Stub UX audit shipped with the starter kit. Replace with your own.

| | |
|---|---|
| **Auditor** | [Designer Name from team roster] |
| **Surface(s) audited** | Pricing page (web), Tier comparison modal, Upgrade flow |
| **Source files** | https://figma.com/file/abc123/?node-id=42:128 |
| **Method** | Heuristic review (Nielsen's 10) + 5 customer call summaries from last 30 days |
| **Related feature** | feature-index.yaml#billing.credit-usage-dashboard |

## Summary

The pricing page does well at the top of funnel (clear tier comparison) but degrades sharply when customers try to upgrade. Three cliffs: tier-switch modal hides the price delta, upgrade-confirmation has no preview, and post-upgrade has no welcome state.

## Findings

### Cliff 1 — Tier-switch modal hides price delta

When customers hover the "Upgrade to Business" CTA, the modal shows the new tier's full price but not the *change* from current tier. Three customer calls in the last month flagged confusion about whether the upgrade was incremental or a full new charge.

**Severity:** High. Directly correlated with upgrade abandonment in the funnel.
**Recommendation:** Add a `+$X / month` line under the new-tier price.

### Cliff 2 — Upgrade-confirmation has no preview

After clicking "Confirm upgrade," customers see only a loading spinner and then a generic toast. No preview of what changes (new feature unlocks, new credit balance).

**Severity:** Medium. Doesn't block conversion but contributes to post-upgrade churn — customers don't know what they got.
**Recommendation:** Add a confirmation modal listing the 3-5 most relevant unlocks plus an updated credit balance.

### Cliff 3 — Post-upgrade welcome state missing

Customers land back on the dashboard with no acknowledgement of the upgrade. We've heard "did it actually upgrade?" twice in the last 30 days.

**Severity:** Medium-low. Easily fixed.
**Recommendation:** One-time banner on the dashboard for 24 hours after upgrade, plus an email confirmation that lists the unlocks.

## Cross-References

- Customer calls referenced: see `product/customers/accounts/example-customer/calls/summaries/2026-04-22.md` and others
- Decision log: any change here should land in `product/decisions/`, with a back-link to this audit
- Design system: tier-comparison-modal lives in `design-system/components/tier-modal.md`

## Status

| Recommendation | Status | Owner | Linear ticket |
|---------------|--------|-------|---------------|
| Add price-delta to tier-switch modal | Scoped | [Designer] + [Engineer] | YOURPROJ/200 |
| Add upgrade-confirmation preview | Scoped | [Designer] + [Engineer] | YOURPROJ/201 |
| Add post-upgrade welcome state | Backlog | [Designer] | — |
