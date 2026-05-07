# Data Protection Impact Assessment (DPIA) — Team OS Adoption

> Template for teams in regulated industries (healthcare, finance, EU data subjects) evaluating whether the Team OS is fit for their data handling. Adapt to your jurisdiction.

## 1. Description of Processing

| | |
|---|---|
| **Purpose of the Team OS** | Shared knowledge base of decisions, customer summaries, metric definitions, and operational playbooks. AI agents and humans query it for context. |
| **Personal data processed** | Role attributions, role-attributed verbatim quotes, customer-organization names, account-level context. **Not** raw customer-side personal names in summaries (PII rule). Transcripts may contain raw names. |
| **Categories of data subjects** | Customer-facing employees of B2B accounts; team employees |
| **Recipients** | Internal team (via git access controls) + sub-processors (LLM vendor when queried) |
| **Sub-processors** | Anthropic (or your LLM vendor) — receives file content during queries |
| **Storage period** | Indefinite by default — define retention schedule below |

## 2. Necessity and Proportionality

| Question | Answer |
|----------|--------|
| Is the processing necessary for a legitimate interest? | Yes — institutional memory and AI-assisted retrieval reduce repeat-question burden |
| Is there a less data-intensive way to achieve the same outcome? | Possibly — could store summaries only, leave transcripts in HIPAA/GDPR-compliant systems |
| Is the data minimization principle satisfied? | Partially — PII rule helps; transcripts are the weak point |
| Are data subjects informed? | Required: yes. Update your privacy policy and customer DPAs to disclose |

## 3. Risks and Mitigations

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Customer name leaks into summary file | Medium | Medium | PII rule + pre-commit hook + CI Gitleaks scan |
| Transcript exposes Art. 9 special category | Medium | High | Don't commit transcripts to git; use a separate access-controlled store |
| LLM vendor logs retained beyond DPA terms | Low | High | Use zero-retention API endpoint; verify quarterly |
| Right-to-erasure request can't be fulfilled | High | High | Document `git filter-repo` runbook; pre-negotiate vendor deletion SLA |
| Force-push rewrites audit trail | Low | High | Branch protection disallows force push to `main` |
| New team member commits PII before learning the rules | High | Medium | Onboarding agent enforces reading PII rule on Day 1 |

## 4. Necessary Controls

| Control | Implementation Reference |
|---------|--------------------------|
| Pre-commit PII scanner | `SECURITY.md` (sample hook) |
| CI security scanner (Gitleaks + custom regexes) | `.github/workflows/security-scan.yml` (add per your tooling) |
| Branch protection on `main` | GitHub Settings → Branches |
| CODEOWNERS for sensitive folders | `.github/CODEOWNERS` (add per your team) |
| Signed commits required | GitHub branch protection setting |
| LLM vendor DPA + zero-retention endpoint | Vendor contract |
| Documented Art. 17 erasure runbook | `SECURITY.md` (Right to erasure section) |
| Retention schedule | This DPIA (Section 5) |

## 5. Retention Schedule

> Define what gets deleted when. Don't leave indefinite.

| Artifact | Retention | Deletion path |
|----------|-----------|---------------|
| Customer call summaries | 24 months after last touch | Move to `archive/` then quarterly purge |
| Customer call transcripts | 12 months after call | Should not be in git; if they are, manual delete + history rewrite |
| Departed-customer folders | Archive at churn + 1 year | Move folder; redact account-context.md to summary |
| Decision log entries | Indefinite (institutional memory) | Never delete; mark Status: Superseded |
| RFCs / engineering plans | Indefinite | Never delete; mark obsolete |
| Win-loss entries | 36 months | Quarterly purge of older than 36 months |
| Personal data of departed employees | 90 days post-departure | Remove from team roster; CODEOWNERS update |

## 6. Sign-Off

| Role | Name | Signed |
|------|------|--------|
| DPO / Privacy lead | | |
| Engineering lead | | |
| Legal | | |
| Date of DPIA | | |
| Next review | (annually) | |

## 7. Material Changes Triggering Re-Assessment

- Adding a new sub-processor (different LLM vendor)
- Storing a new category of personal data
- Significant change in customer base (e.g., expansion to EU)
- Regulatory change (new GDPR enforcement guidance, new HIPAA Security Rule revision)
