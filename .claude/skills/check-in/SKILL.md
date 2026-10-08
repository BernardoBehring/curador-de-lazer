---
name: check-in
description: Reviews the Leisure Profile with a few questions. Use when the check-in is overdue or the user asks to review (not redo) their profile.
---

# Check-in

Orchestration only — no rules here.

1. `compute-hit-rate` and show the line (if any).
2. `list-pending`.
3. `ask-check-in-questions` with the hit rate and pending items.
4. Profile changes from the answers → `write-profile`.
   Item feedback from the answers → `log-feedback` for each.
5. `archive-history`.
6. `upsert-history-row` to set the check-in date to today.
7. Carry on with the original request, if any.
