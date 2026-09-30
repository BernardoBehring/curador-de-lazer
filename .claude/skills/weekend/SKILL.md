---
name: weekend
description: Cultural events from Friday to Sunday in the user's region. Use when the user asks about the weekend or what to do this weekend.
argument-hint: "[with Companion] [in Location]"
---

# Weekend

Request: $ARGUMENTS

1. Read `profile.md`, `history.md` and `history-archive.md` (if it exists).
2. Work out the coming Friday, Saturday and Sunday from today's date (if it's
   already the weekend, use the remaining days).
3. Location: the Request location if given; otherwise Home. Apply the +25%
   Margin to maximum distance and budget.
4. If there are Companions, apply their "no"s as a hard filter.
5. Search the web using the sources for that location's country (official city
   agendas, theatres, cinemas, libraries, main ticketing platforms). Only events
   with confirmed date, time, place and price; mark anything else unconfirmed.
6. Exclude Declined or Rated events. Already Suggested events may reappear,
   flagged "(already suggested on DD/MM)".
7. Reply with 3–5 events grouped by day, including 1 🧭 Stretch pick (Openness
   scale), labels in the user's language:
   ```
   ### Friday, DD/MM
   **Name** — time · venue · price · distance [⚠️ if within Margin]
   Why it fits you: 1 sentence. [link]
   ```
   End with the ⭐ Highlight: one of the events above, promoted, in one
   sentence. Only the Highlight may exceed the Margin, and only if exceptional.
8. Log each event in `history.md` with Origin Curador and state Suggested, event
   date in Notes (if already present, add the new suggestion date in Notes).
9. Email it with the `send-email` skill, type `Weekend` (during the automatic
   weekly send, the `weekly-send` skill does the emailing — never send twice).
