---
name: update-taste
description: Updates the profile's Likes or Dislikes from one piece of feedback.
user-invocable: false
argument-hint: "<item, state, score, reason>"
---

# Update taste

Input: $ARGUMENTS

Change the profile only when the feedback reveals something about taste:
- Loved (score ≥ 4) → add what they liked under the category's "Likes".
- Score ≤ 2, or Dropped for a taste reason ("got bored") → add under "Dislikes".
- Declined, or Dropped for a circumstance ("no time") → change nothing.
- Rated Event → note the artist, venue or type preference under Events.

Write the change with `write-profile` (only the affected field). Report in one
line what was noted, or nothing if unchanged.
