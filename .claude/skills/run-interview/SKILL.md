---
name: run-interview
description: Conducts the Leisure Profile interview until the user confirms the profile.
user-invocable: false
argument-hint: "[existing profile]"
---

# Run the interview

Input: $ARGUMENTS — when redoing, the existing profile: confirm what still holds
instead of asking from scratch.

## How
- In the user's language; relaxed, like a friend who knows a lot about culture —
  not a form.
- 1–2 questions at a time; wait for the answer.
- When they mention a title, ask what they liked (pace, characters, theme,
  atmosphere, ending).
- Ask for concrete examples, not genres ("name 3 films you loved").
- Ask what they hated and why; the "no"s matter as much as the "yes"es.
- 10–15 minutes. Short answers or "enough" → move on with what you have.

## Topics (in order, flexibly)
1. **Context**: language to talk in; Title languages; Home (city, country);
   maximum distance; free time on weekdays and weekends; **Email** — explain
   suggestions are sent from that address to itself through the Gmail connector,
   so it must be the Gmail account connected to their Claude (or "off");
   preferred local sources.
2. **Companions**: who they go out or watch things with, and each one's strong
   "no"s.
3. **Films**: all-time favourites, recent ones they liked, ones they gave up on.
4. **Series**: favourites, what they're watching now, preferred format,
   streaming platforms.
5. **Books**: favourites, authors, format, pace, reading languages, libraries.
6. **Events**: what appeals, budget per event, calm or lively.
7. **Mood**: what they want from leisure and whether it changes day to day.
8. **Openness**: 1–5.

## End
Show the collected profile (structure of `write-profile`) and ask them to confirm
or correct it. Output: the confirmed profile, plus every title mentioned with
its state (Rated with score, Dropped with reason, In progress).
