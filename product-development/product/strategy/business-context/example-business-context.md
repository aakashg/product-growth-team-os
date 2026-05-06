# Example Business Context

> Synthetic example so Day 1 of onboarding doesn't hit an empty folder. Replace with your own once you have it.

## What We Sell

[Your Product] is an AI-powered platform that lets product teams turn ideas into shipped features faster. We sell to product/engineering teams of 10-100 people who currently rely on a fragmented toolchain (Notion + Linear + Slack + a wiki + tribal knowledge) and want a unified context layer that AI agents can query.

## Who Buys

- **Primary:** Head of Product or VP Engineering at SaaS companies $5M-$50M ARR
- **Champion:** Senior PMs or eng leads who feel the pain of context-switching daily
- **Economic buyer:** CTO or COO

## How We Make Money

Tiered SaaS:
- **Free** — single user, 5 features, capped storage
- **Pro** ($X/seat/month) — teams up to 10
- **Business** ($Y/seat/month) — teams up to 50, SSO, audit log
- **Enterprise** (custom) — usage-based component, dedicated CSM, compliance addons

Pricing rationale lives in `../../decisions/2026-02-14-usage-based-pricing.md`.

## Market

- TAM: $X billion (productivity tooling for product/eng teams)
- Closest substitutes: Notion AI, Linear AI, Coda, Glean
- Where we win: structured context model (markdown + folder convention), AI-tool agnosticism
- Where we lose: brand recognition vs. Notion at SMB scale; deep ecosystem integrations vs. Linear at scale

## Why Now

Two trends: (1) every team's documentation surface is growing faster than humans can synthesize it, (2) AI agents have become good enough to navigate structured context if it exists. Most teams have neither structure nor query tools — we provide both.

## Constraints / Risks

- **Vendor concentration risk:** if Anthropic/Cursor/etc. ship comparable native features, our differentiation narrows. Mitigation: stay tool-agnostic at the structure layer.
- **Cold-start problem:** repos take 2-4 weeks of authoring before the AI query value compounds. Mitigation: shipped templates, adoption playbook.
- **Multi-team rollout governance:** we charge per seat, but teams want one shared repo. Mitigation: per-team repos with cross-team rollup via portfolio-pulse.

## Last Updated

[Date] by [Name]. Refresh when ICP shifts, pricing changes, or competitive landscape moves materially.
