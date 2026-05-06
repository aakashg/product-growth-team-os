# Design

Source-of-truth design files live in **Figma**, not this repo. This folder holds:

- Cross-cutting design rationale that doesn't fit a single PRD
- Design system documentation (links + decision history)
- UX audits across multiple features

For per-feature design rationale, write a decision log entry in `product/decisions/` or include it in the PRD. For per-customer UX findings, log them in `product/customers/accounts/{customer}/account-context.md`.

## Conventions

- **Figma URLs** belong in `feature-index.yaml` under each feature, not pasted into PRDs (so they survive renames).
- **Design tokens / system docs** live in Figma libraries; this folder can hold rationale for major design system changes (e.g., a redesign decision).
- **Screen captures** for documentation should be exported into the relevant PRD or decision log entry, not stored loose here.

## Folders

This folder is intentionally light — most design content lives in Figma, PRDs, decisions, or `customers/accounts/`. Add subfolders only as you accumulate cross-cutting artifacts that don't fit elsewhere.

For onboarding, see [onboarding-design.md](../../team/onboarding-guides/onboarding-design.md).
