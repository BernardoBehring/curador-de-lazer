# Atomic skills: each skill does one thing

The Curador is made of many small skills, each with a single responsibility
(check eligibility, filter by Companions, format an event line…), instead of
one big skill per flow. Orchestration skills only chain other skills and hold no
business rules; the agent only routes. The number of skills is not a cost to
minimise — reuse and clarity are the goal. Same pattern as the Accounts Payable
agent.

## Consequences

- A business rule (e.g. the 6-week repeat rule, the Margin, the Companion
  filter) lives in exactly one skill; whoever needs it invokes that skill, never
  copies the rule.
- If a skill's description needs "and" to say what it does, split it.
- Atomic skills are hidden from the `/` menu (`user-invocable: false`); only
  user-facing orchestrations appear there.
- File formats live in the skill that writes the file (`write-profile`,
  `upsert-history-row`, `archive-history`); reading files is free.
