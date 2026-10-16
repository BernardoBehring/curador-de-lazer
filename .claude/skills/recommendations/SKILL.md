---
name: recommendations
description: Produces a round of suggestions across films, series, books and events, with a Highlight. Use when the user asks for general suggestions.
argument-hint: "[with Companion] [in Location] [categories] [events window] [no-email]"
---

# Recommendations round

Request: $ARGUMENTS — orchestration only, no rules here.

Categories: those given in the request, otherwise film, series, book, events.
Events window: the one given, otherwise 14 days. Skip every step for a category
that isn't requested.

1. For each requested Title category: `find-title-candidates`.
2. For each candidate: `check-eligibility`; drop the ineligible.
3. `filter-by-companions` with the request's Companions.
4. Films and series: `check-streaming-availability`. Books: `check-book-availability`.
5. `find-events` for the location (Request location or Home), today → events
   window; then `check-eligibility` and `filter-by-companions` on them.
6. `apply-margin` on the events.
7. For each category: `choose-stretch-pick`.
8. `localize-title` for each Title.
9. `format-title-line` / `format-event-line` for each item.
10. `choose-highlight`.
11. `format-round` with the categories and events window, and show it.
12. `log-suggestion` for each item shown.
13. Unless "no-email": `email-suggestions` with type Recommendations.
