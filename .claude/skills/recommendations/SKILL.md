---
name: recommendations
description: Produces a full round of films, series, books, events and a Highlight. Use when the user asks for general suggestions.
argument-hint: "[with Companion] [in Location]"
---

# Recommendations round

Request: $ARGUMENTS — orchestration only, no rules here.

1. For each of film, series, book: `find-title-candidates`.
2. For each candidate: `check-eligibility`; drop the ineligible.
3. `filter-by-companions` with the request's Companions.
4. Films and series: `check-streaming-availability`. Books: `check-book-availability`.
5. `find-events` for the location (Request location or Home), today → +14 days;
   then `check-eligibility` and `filter-by-companions` on them.
6. `apply-margin` on the events.
7. For each category: `choose-stretch-pick`.
8. `localize-title` for each Title.
9. `format-title-line` / `format-event-line` for each item.
10. `choose-highlight`.
11. `format-round` and show it.
12. `log-suggestion` for each item shown.
13. `email-suggestions` with type Recommendations.
