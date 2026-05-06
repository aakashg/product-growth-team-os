# Design

Source-of-truth design files live in **Figma**, but design is a first-class function in this repo with native artifacts of its own — UX audits, research syntheses, design-review logs, and design-system rationale.

## Folders

| Folder | What's Here |
|--------|-------------|
| `audits/` | UX audits — cross-feature usability reviews and competitive design teardowns |
| `research-syntheses/` | Cross-call user-research syntheses (the "what we're learning across customers" doc) |
| `reviews/` | Design-review logs — feedback captured at design-review time, with decisions tracked back to PRD or decision log |
| `design-system/` | Design-system rationale, version history, contribution guide. Source library lives in Figma; this folder holds the *why* |

## What Lives Where

| Question | Location |
|----------|----------|
| "Where's the source design for feature X?" | `feature-index.yaml#area.feature` → linked Figma URLs |
| "Why did we decide on bottom-nav vs hamburger?" | `product/decisions/{date}-{topic}.md` |
| "What did Customer A say about the upload flow?" | `product/customers/accounts/{customer}/calls/summaries/{date}.md` (UX Findings section) |
| "What patterns are we seeing across customers in the prototyping flow?" | `design/research-syntheses/{topic}.md` |
| "What's the audit history for our pricing page?" | `design/audits/{topic}.md` |
| "What changed in the design system in Q1?" | `design/design-system/changelog.md` |

## Figma URL Stability

**Use Figma file IDs, not display names.** A Figma URL like `https://figma.com/file/abc123/Pricing-Redesign-v3` keeps working when the file is renamed because `abc123` is the stable identifier. The slug after the ID is decorative. When linking from `feature-index.yaml`, you can drop the slug entirely: `https://figma.com/file/abc123/`.

For specific frames or components, use node IDs: `https://figma.com/file/abc123/?node-id=42:128`. These survive frame renames within the file.

For prototypes, use `https://figma.com/proto/abc123/?node-id=42:128`. Note: `figma.com/file/...` and `figma.com/proto/...` are different URLs for the same content.

## Naming

- Audits: `audits/{date}-{topic}.md` (e.g., `2026-04-15-pricing-page-audit.md`)
- Research syntheses: `research-syntheses/{topic}-{quarter}.md` (e.g., `prototyping-flow-q2-2026.md`)
- Reviews: `reviews/{date}-{feature-or-topic}.md`
- Design-system entries: `design-system/{component-or-topic}.md`

For onboarding, see [onboarding-design.md](../../team/onboarding-guides/onboarding-design.md).
