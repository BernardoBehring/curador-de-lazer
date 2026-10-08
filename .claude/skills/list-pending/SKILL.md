---
name: list-pending
description: Lists what is waiting for the user's input.
user-invocable: false
---

# List pending items

Read `history.md` and return each of these that applies (empty list if none):
- **check-in overdue**: `Last check-in` is 30+ days ago;
- **past events**: Queued Events whose date has passed;
- **stale queue**: items Queued for over 3 months.

Output: the items per kind, and the total count.
