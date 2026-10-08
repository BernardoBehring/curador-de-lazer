---
name: similar-to
description: Suggests three titles similar to a given one. Use when the user asks for "something like X".
argument-hint: "<title or event>"
---

# Similar to

Reference: $ARGUMENTS — orchestration only, no rules here.

1. `find-title-candidates` with "similar to <reference>" (any category).
2. `check-eligibility` on each candidate.
3. Availability: `check-streaming-availability` (films, series) or
   `check-book-availability` (books).
4. `choose-stretch-pick` for the 3rd suggestion.
5. `localize-title` for each.
6. `format-similar` and show it.
7. `log-suggestion` for each of the 3.
8. `email-suggestions` with type "Similar to <reference>".
