# Team Learnings

Accumulated patterns and mistakes. This file is loaded at session start via the session hook. Add entries whenever the team discovers something Claude consistently gets wrong, or a working pattern that should persist.

## Things Claude Gets Wrong in This Repo

- *Example:* When asked about churn, Claude defaults to overall churn. Always specify: by segment or by tier.
- *Example:* Claude sometimes confuses the `billing_events` table with the legacy `billing_log` table. Always use `billing_events` for data after 2025-06-01.
- [Add more as you discover them]

## Working Preferences

- **PII rule for customer summaries:** never include customer-side personal names. Use role titles only (*"Their VP of Engineering"*). Quotes attribute by role: *"[quote]" — Their Head of Product*. Our team members' names are fine. The transcript file may contain raw names because it's a faithful record; the summary file (which gets shared and synthesized) must not.
- **Decision log tense:** past tense. *"Chose Model B"* not *"Choosing Model B"*.
- **SQL queries:** always include the verified-by header comment, owner, last verification date, and warehouse variant.
- **Architectural decisions go in RFCs**, not the decisions log. The decisions log is for pricing, GTM, scoping, and vendor selection.
- **Feature-index first:** when looking up artifacts for a specific feature, check `product-development/feature-index.yaml` first. It maps every feature to its PRD, RFC, plan, schema, dashboard, experiments, tickets.

## Things That Worked Well

- **Type-first / area-second analytics structure** (`analytics/metrics/{area}/`, `analytics/queries/{area}/`) makes type-level browsing fast while keeping product-area scoping. Cuts context usage on type queries by ~60% vs. flat structure.
- **Customer call summary + transcript pair** (under `accounts/{customer}/calls/{summaries,transcripts}/`) keeps PII-safe summaries readable for the whole team while preserving raw data when summaries aren't enough.
- **SKILL.md folder convention** (`.claude/skills/{name}/SKILL.md` with frontmatter) plays well with Claude Code's progressive disclosure and lets each skill ship with `examples/`.
- [Add more as you discover them]
