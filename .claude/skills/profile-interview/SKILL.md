---
name: profile-interview
description: Interview to create or redo the Leisure Profile. Use when profile.md doesn't exist or the user asks to redo their profile.
---

# Leisure Profile interview

Conduct the whole interview in the user's language (see the agent's Language
rules).

## Before starting
- If `profile.md` exists and the request is "redo my profile", read it and use
  it as a starting point: confirm what still holds instead of asking from scratch.
- Don't recommend anything until the profile is confirmed.

## How to run it
- Relaxed tone, like a friend who knows a lot about culture — not a form.
- 1–2 questions at a time; wait for the answer.
- When they mention a title, ask what they liked about it (pace, characters,
  theme, atmosphere, ending).
- Ask for concrete examples rather than genres ("name 3 films you loved").
- Also ask what they hated and why; the "no"s matter as much as the "yes"es.
- Target length: 10–15 minutes. If answers are short or they say "enough",
  move on with what you have.

## Topics (in this order, flexibly)
1. **Context**:
   - Language to talk in, and Title languages (which localized titles they want
     to see next to the original).
   - Home (city and country), how far they're willing to travel, free time on
     weekdays and weekends.
   - **Email** for the recommendations: explain they're sent from that address
     to itself through the Gmail connector, so it must be the Gmail account
     connected to their Claude. If they don't use Gmail or don't want email,
     record `Email: off`.
   - Preferred local sources, if they have any (agendas, ticketing sites).
2. **Companions**: who they go out or watch things with, and each one's strong
   "no"s.
3. **Films**: all-time favourites, recent ones they liked, ones they gave up on.
4. **Series**: favourites, what they're watching now, preferred format
   (miniseries, long-running, short episodes), streaming platforms.
5. **Books**: favourites, authors, format (paper, e-book, audiobook), reading
   pace, reading languages, whether they use libraries (and which).
6. **Events**: what appeals (concerts, theatre, stand-up, exhibitions,
   festivals, food, sport, outdoors), budget per event, calm or lively.
7. **Mood**: what they want from leisure (switch off, laugh, think, learn, be
   moved) and whether it changes day to day.
8. **Openness**: 1–5.

## Wrap-up
1. Show the Leisure Profile in the format below (translated to their language)
   and ask them to confirm or correct it.
2. Once confirmed:
   - Write `profile.md`.
   - In `history.md`, log the titles they mentioned with Origin User and the
     right state (Rated with a score if given, Loved → score ≥ 4, Dropped with
     reason, In progress) and set `Last check-in:` to today.
3. If Email is set, offer once to set up the weekly email (`setup-weekly-send`
   skill) — only if they want it.
4. Finish with a first full round using the `recommendations` skill.

## Format of `profile.md`
Write it in the user's language; the structure is fixed:
```markdown
# Leisure Profile
_Confirmed on: YYYY-MM-DD_

## Context
- Language: …
- Title languages: …
- Home: city, country
- Maximum distance: …
- Free time: weekdays … · weekends …
- Email: … | off
- Preferred sources: …

## Films
- Likes: …
- Dislikes: …

## Series
- Likes: …
- Dislikes: …
- Preferred format: …

## Books
- Likes: …
- Dislikes: …
- Format · pace · reading languages: …
- Libraries: no / which

## Events
- Likes: …
- Dislikes: …
- Calm or lively: …

## Platforms
- …

## Budget
- Per event: … (currency) — +25% Margin applied automatically

## Mood
- …

## Openness
N/5 — what that means in practice (see the agent's Stretch picks scale).

## Companions
### Name
- Relationship: …
- Strong "no"s: …
- Shared tastes: …
```
