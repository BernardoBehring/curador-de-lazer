---
name: tonight
description: Suggests one film or episode to watch right now. Use when the user asks for "tonight" or something to watch now.
argument-hint: "[mood] [with Companion]"
---

# Tonight

Request: $ARGUMENTS — orchestration only, no rules here.

1. If mood or available time isn't in the request, ask in one line.
2. Candidates, in this order, stopping at the first that fits mood and time:
   1. Queued Titles from `history.md`;
   2. the next episode of an In progress series;
   3. `find-title-candidates` (film or series, with the mood), then
      `check-eligibility` on each.
3. `filter-by-companions` with the request's Companions.
4. `check-streaming-availability`.
5. `localize-title`, then `format-tonight` and show it.
6. If it came from step 2.3: `log-suggestion`.
7. `email-suggestions` with type Tonight.
