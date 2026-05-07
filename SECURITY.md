# Security & Privacy

The Team OS starter is plain markdown and YAML. There's no application code, no runtime, no auth surface. Most security concerns come from how *your team* uses it.

## Reporting a Security Issue in the Starter Itself

If you find a security-relevant issue in the starter (e.g., a hook example that would expose secrets, a SKILL that defaults to logging PII, a doc that recommends an unsafe practice), email the maintainer rather than filing a public issue:

- Aakash: aakashproductgrowth@gmail.com

Include: the file, the line, the issue, and the suggested fix.

## Privacy Considerations for Your Team

When you adopt the starter, the privacy surface area is *your* team's data, not the kit. Key considerations:

### PII

- The `customer-call-summary` SKILL applies a role-only attribution rule by default. Don't disable it without a reason.
- Customer-call **transcripts** can contain raw PII. Consider whether transcripts belong in git at all — for regulated data, put summaries in git and store transcripts in a separate access-controlled system.
- See `team/adoption-playbook.md` Section 6 ("Sensitive data") for the three-layer control model.

### Sub-processor disclosure (GDPR Art. 28)

When you query this repo through Claude Code (or any LLM-backed tool), the file contents are sent to a third-party LLM provider (Anthropic, OpenAI, etc.). For your customers' data, this means:

- Sign a DPA with your AI vendor before using their tools on regulated data
- Use the zero-retention API endpoint where available (Anthropic offers this)
- Consider data residency (US vs. EU regions) if you have EU data subjects
- Document your AI sub-processors in your customer DPAs

### Audit trail

Git provides commit history, signed commits (if you enable them), and branch protection. To make this audit-grade:

- Enable branch protection on `main` (require PR + 1 review minimum, no force push)
- Add `CODEOWNERS` for sensitive folders (`customers/`, `analytics/data-catalog.yaml`, etc.)
- Require signed commits if your industry needs non-repudiation
- Don't allow administrators to bypass these rules — make the rules apply to everyone

### Right to erasure (GDPR Art. 17)

If a customer requests deletion, removing files from `main` does NOT remove them from git history. To truly delete:

1. Use `git filter-repo` (or BFG Repo-Cleaner) to rewrite history
2. Force-push the rewritten history (with team coordination — every clone needs to re-clone)
3. Submit a sub-processor deletion request to your LLM vendor (Anthropic / OpenAI) for any conversation logs
4. Document the deletion in your privacy team's tracking system

This is non-trivial. For teams in regulated industries, consider whether customer-identifiable data should be in the repo at all.

### Secrets

- `.gitignore` excludes `.env`, `*.key`, `*.pem`, and `secrets/`. Don't override.
- Add a Gitleaks pre-commit hook (sample below) for defense-in-depth.

### Pre-commit Hook (Recommended)

Save as `.git/hooks/pre-commit` and `chmod +x`:

```bash
#!/usr/bin/env bash
# Block commits containing common PII patterns and secret signatures.
# Runs locally — defense in depth, not a substitute for a real CI scanner.

set -e

# Block obvious secrets
if git diff --cached --name-only | xargs grep -lE '(BEGIN [A-Z]+ PRIVATE KEY|sk_live_|api[-_]?key.*=.*[A-Za-z0-9]{20,})' 2>/dev/null; then
  echo "Possible secret detected. Review and remove before committing."
  exit 1
fi

# Block obvious PII (emails outside .gitignore patterns)
if git diff --cached --name-only --diff-filter=AM | grep -E '\.(md|yaml|yml)$' | xargs grep -lE '\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}\b' 2>/dev/null | grep -vE '(LICENSE|README|CONTRIBUTING|SECURITY)\.md$'; then
  echo "Possible PII (email) detected in tracked content. Review."
  exit 1
fi

exit 0
```

For CI-side scanning, add a workflow at `.github/workflows/security-scan.yml` running Gitleaks on every PR. (Sample left as exercise — depends on your secrets-scanning service.)

### Branch Protection (Recommended)

Settings → Branches → add a rule for `main`:

- Require pull request reviews (≥ 1 approval)
- Require status checks to pass
- Require signed commits
- Disallow force pushes
- Disallow deletions
- Apply to administrators

### Compliance Posture

The starter on its own is not SOC2 / HIPAA / GDPR / PCI compliant. Compliance comes from how you operate the repo:

- For SOC2 Type II: branch protection, CODEOWNERS, signed commits, CI security scans, documented sub-processor agreements
- For GDPR: DPA with LLM vendor, regional data residency, documented Art. 17 erasure path, expanded PII rule covering all Art. 9 special categories
- For HIPAA: separate scope — don't put PHI in this repo. Use it as the *summary* layer; PHI lives in your HIPAA-compliant systems

A DPIA template lives at `team/compliance/dpia-template.md` if you need to evaluate fitness for regulated use.
