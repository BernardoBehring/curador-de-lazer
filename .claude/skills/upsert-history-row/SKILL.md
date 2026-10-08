---
name: upsert-history-row
description: Creates or updates one item's row in history.md.
user-invocable: false
argument-hint: "<item, type, origin, state, score, reason | check-in date>"
---

# Upsert a history row

Input: $ARGUMENTS

## Format of `history.md` (and `history-archive.md`)
A top line `Last check-in: YYYY-MM-DD` (active history only), then one table:

| Title/Event | Type | Origin | State | Score | Date | Reason/Notes |
|---|---|---|---|---|---|---|

- Type: film · series · book · event.
- Origin: Curador · User.
- State: Suggested · Queued · In progress · Rated · Declined · Dropped.
- Date: date of the last state change; for events, the event date goes in Notes.
- Table content is written in the user's Language.
- Create the file with this layout if it doesn't exist.

## Rules
1. Look for the item in `history.md` and `history-archive.md`.
2. Found → update state, score, date and reason, **keeping its Origin**. If it
   was in the Archive, move the row back to `history.md`.
3. Not found → add a new row (Origin as given; default User).
4. Never create duplicates.
5. When given a check-in date, rewrite only the top line.
