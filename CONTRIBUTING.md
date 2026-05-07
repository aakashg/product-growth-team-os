# Contributing

Thanks for considering a contribution. This repo is a starter kit — most teams will fork, customize, and never push back upstream. That's the expected use. But if you find a bug, gap, or pattern that would help other teams, contributions are welcome.

## What Belongs Upstream

- **Structural improvements** — new SKILL.md format conventions, navigation patterns, registry schema additions, workflow patterns
- **Bug fixes** — broken cross-references, dead links, math bugs in example SQL, incorrect claims
- **Documentation polish** — clearer instructions, better examples, fewer placeholders
- **New examples that teach a pattern** — if you've populated `customers/case-studies/` with a great case-study template, contribute the template (not your customer data)

## What Doesn't Belong Upstream

- **Your team's actual data** — customer names, real metrics, your strategy docs. That's *your* fork, not the upstream starter.
- **Tool-specific integrations that lock the kit to one vendor** — keep the markdown structure portable
- **Personal opinions baked into the kit** — *"all teams should use Notion"* belongs in your fork's CLAUDE.md, not the starter

## Workflow

1. Fork, branch, make changes on your branch
2. Run a sanity check: every cross-reference resolves, no `[FILL IN]` tokens remain in template files, no PII in test data
3. Open a PR with the template at `.github/pull_request_template.md`
4. One reviewer approves, then merge

## Style

- Match the existing tone — direct, terse, no marketing fluff
- Markdown over HTML
- One-sentence-per-line prose where possible (better diffs)
- Test data uses obvious-fake names (`Acme`, `Forge Labs`, `Example Customer`) — never real ones

## License

By contributing you agree your contribution is licensed under CC BY-NC 4.0, the same as the rest of the kit. See [LICENSE](LICENSE).

## Code of Conduct

Be kind, be specific, be brief. Critique the work, not the person.

## Maintainers

- [Aakash Gupta](https://www.news.aakashg.com/)
- [Hannah Stulberg](https://hannahstulberg.substack.com/)

For questions: open an issue with the question template.
