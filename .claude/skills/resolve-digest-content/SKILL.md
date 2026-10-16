---
name: resolve-digest-content
description: Decides which categories the weekly email contains for this user.
user-invocable: false
---

# Resolve the weekly digest content

Read **Weekly digest** in `profile.md` (Context section).

- Valid categories: films · series · books · events (any subset, any order;
  accept the equivalent words in the user's Language).
- Missing, empty or unreadable → all four.
- Events in the weekly email cover the **next 7 days** (until the next send).

Output: the list of categories, and the events window (7 days) if events are
included.
