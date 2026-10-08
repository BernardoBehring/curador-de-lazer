---
name: archive-history
description: Moves stale rows from history.md to history-archive.md.
user-invocable: false
---

# Archive the history

Move to `history-archive.md` (same table format as `upsert-history-row`, without
the check-in line), creating it if needed:
- Suggested items with no reaction for over 6 months;
- Events whose date has passed with no feedback (Suggested, or Queued after the
  user has already been asked how it went).

Never move Rated, Declined, In progress, Dropped or recently Queued items.
Report how many rows were moved.
