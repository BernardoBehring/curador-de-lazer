---
name: check-eligibility
description: Decides whether one candidate item may be suggested now, given the history.
user-invocable: false
argument-hint: "<item, type, event date?>"
---

# Check eligibility

Input: $ARGUMENTS

Look the item up in `history.md` **and** `history-archive.md`, then apply:

| State | Title | Event |
|---|---|---|
| Not in history | eligible | eligible |
| Suggested | eligible once more, only if last suggested 6+ weeks ago | eligible until its date, flagged "(already suggested on DD/MM)" |
| Queued | not as a new suggestion | not as a new suggestion |
| In progress | not eligible | — |
| Rated | not eligible | not eligible |
| Declined | never | not until its run ends (recurring events) |
| Dropped | not eligible | — |

Output: eligible / not eligible, plus any flag to show (in the user's Language).
