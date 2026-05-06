# Design System

Rationale, version history, and contribution guide for the design system. The component library itself lives in Figma; this folder holds the *why* and the change log.

## Files

| File | Purpose |
|------|---------|
| `changelog.md` | Dated entries for component additions, deprecations, breaking changes |
| `components/{name}.md` | Per-component rationale — when to use, when not to use, accessibility notes |
| `tokens.md` | Design token rationale (color, type, spacing scales — *why* these values, not the values themselves) |

## Conventions

- **Source files in Figma**, linked at the top of every component doc
- **Breaking changes get a decision log entry** in `product/decisions/` so the migration story is preserved
- **Deprecations stay in the doc** — annotate with `**Status: deprecated 2026-Q2 — replace with [link]**` rather than deleting

## Naming

- Component docs: `components/{kebab-case-name}.md` (e.g., `components/tier-modal.md`)
- Token docs: `tokens.md` (single file)
- Changelog: `changelog.md` (single file, reverse-chronological)

> Add real component and token docs here as your system grows. Don't seed with fakes — empty is fine until you have content.
