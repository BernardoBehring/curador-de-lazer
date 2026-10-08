---
name: log-suggestion
description: Logs one item the Curador just suggested into the history.
user-invocable: false
argument-hint: "<item, type, event date?>"
---

# Log a suggestion

Input: $ARGUMENTS

Use `upsert-history-row` with Origin **Curador**, state **Suggested**, date today.
- Events: put the event date in Notes. If the event already has a row, append
  "suggested on DD/MM" to its Notes instead of replacing them.
- If the item already has a different state (e.g. Queued, In progress), leave
  its row unchanged.
