---
name: weekend
description: Suggests cultural events from Friday to Sunday. Use when the user asks about the weekend.
argument-hint: "[with Companion] [in Location] [no-email]"
---

# Weekend

Request: $ARGUMENTS — orchestration only, no rules here.

1. Dates: the coming Friday to Sunday (if it's already the weekend, the days
   left).
2. `find-events` for the location (Request location or Home) and those dates.
3. `check-eligibility` on each event.
4. `filter-by-companions` with the request's Companions.
5. `apply-margin`.
6. `choose-stretch-pick` (events).
7. `format-event-line` for each event.
8. `choose-highlight`.
9. `format-weekend` and show it.
10. `log-suggestion` for each event shown.
11. Unless "no-email": `email-suggestions` with type Weekend.
