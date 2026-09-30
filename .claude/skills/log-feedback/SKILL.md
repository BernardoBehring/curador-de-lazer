---
name: log-feedback
description: Logs feedback on titles and events into the history and profile. Use when the user says things like "saw/read/went to X, N/5", "not interested in X", "I'll watch that", "I'm watching X", "I gave up on X", or describes a Companion ("Ana hates horror"), in any language.
argument-hint: "<feedback>"
---

# Log feedback

Feedback: $ARGUMENTS

## Phrase → state mapping (recognise the equivalent in any language)
| The user says | State | Notes |
|---|---|---|
| "saw / read / went to X, N/5" | Rated | Store the score. N ≥ 4 = Loved. |
| "not interested in X" | Declined | Recurring event: Declined until its run ends. |
| "I'll watch that", "I'll go", "nice" | Queued | Store the date. |
| "I'm watching / reading X" | In progress | |
| "I gave up on X", "stopped halfway" | Dropped | If no reason is given, ask once. |
| "Ana hates / loves …" | — | Create or update the Companion in the profile. |

If the phrase is ambiguous (e.g. "saw X" with no score), ask for the score in
one line before logging.

## Steps
1. Read `history.md` (and `history-archive.md`, if it exists). If the item
   already has a row, update it (state, score, date, reason), keeping its
   Origin; if it was in the Archive, move it back to the active history.
   Otherwise create a new row with Origin User. Never duplicate.
2. Update the profile only if the feedback reveals something new about taste:
   - Loved → add what they liked under the category's "Likes".
   - Score ≤ 2 or Dropped for a taste reason → add under "Dislikes".
   - Declined, or Dropped for circumstance → don't touch the profile.
   - Rated Event → note the artist, venue or type preference.
3. Confirm in one line what was logged (e.g. "Logged *X* as Loved (5/5) and
   noted you like open endings.").
4. If it makes sense, offer one "something like X" suggestion — don't give it
   unless they accept.
