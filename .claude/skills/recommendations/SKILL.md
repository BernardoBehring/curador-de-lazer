---
name: recommendations
description: Full round of recommendations (films, series, books, events and a Highlight) in the standard format. Use when the user asks for general suggestions, or at the end of the profile interview.
argument-hint: "[with Companion] [in Location]"
---

# Recommendations round

Request: $ARGUMENTS

## Preparation
1. Read `profile.md`, `history.md` and `history-archive.md` (if it exists).
2. If the request mentions Companions, apply their "no"s as a hard filter to
   films, series and events (never books).
3. If the request gives a Request location, use it instead of Home for this
   round only.
4. Apply the agent's State rules. Suggested Events that haven't happened yet
   may reappear, flagged "(already suggested on DD/MM)".

## Research (mandatory)
- Search the web before suggesting, using the sources for Home's country (see
  the agent's general rules): new releases, streaming catalogues, local
  cultural agendas and ticketing.
- Confirm each film/series is on the user's platforms in their country; if not,
  say where it is.
- Books: confirm whether there's a Local edition and whether it's available
  locally; if the profile lists libraries, check them too.
- Events: only the next 14 days, with confirmed date, time, place, price,
  distance and link. Apply the +25% Margin (budget and distance).
- Never invent data. Mark anything unconfirmed as unconfirmed.

## Content rules
- At least 1 🧭 Stretch pick per category, scaled by Openness.
- No spoilers.
- Titles per the agent's Titles rules.
- The Highlight is one of the round's items, promoted — not an extra. Only the
  Highlight may exceed the Margin, and only if exceptional.

## Format (exact structure; translate headings and labels to the user's language)
```
## 🎬 Films
**Title (year)** — platform · runtime
Why it fits you: 1 sentence tied to the profile.

## 📺 Series
**Title** — platform · no. of seasons / episode length
Why it fits you: 1 sentence.

## 📚 Books
**Title — Author** · pages · Local edition: yes/no · available locally: yes/no
Why it fits you: 1 sentence.

## 📍 Events nearby (next 14 days)
**Name** — date, time · venue · price · distance [⚠️ if within Margin]
Why it fits you: 1 sentence. [link]

## ⭐ Highlight
**Name of an item above** — why it's the one not to miss (1–2 sentences).
```
Quantities: Films 2–3 · Series 2–3 · Books 2 · Events 3–5.

## Wrap-up
1. Briefly ask what they thought of previous suggestions (Suggested or Queued
   in the history).
2. Log each new suggestion in `history.md` with Origin Curador and state
   Suggested, dated today (events: event date in Notes; if already present,
   add the new suggestion date in Notes).
3. Email the round with the `send-email` skill, type `Recommendations`.
