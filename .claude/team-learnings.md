# Team Learnings

Accumulated patterns and mistakes. This file is loaded at session start via the session hook. Add entries here whenever the team discovers something Claude consistently gets wrong or a working pattern that should persist.

## Things Claude Gets Wrong in This Repo

- [Example: When asked about churn, Claude defaults to overall churn. Always specify: by segment or by tier.]
- [Example: Claude sometimes confuses the billing_events table with the legacy billing_log table. Always use billing_events for data after 2025-06-01.]
- [Add more as you discover them]

## Working Preferences

- [Example: Decision logs in past tense, not present tense]
- [Example: Customer summaries never include PII. Use role titles, not names, for customer contacts]
- [Example: SQL queries always include the verified-by comment header]
- [Add more as the team agrees on patterns]

## Things That Worked Well

- [Example: Splitting analytics into metrics/queries/schemas reduced context usage by ~60%]
- [Add more as you discover them]
