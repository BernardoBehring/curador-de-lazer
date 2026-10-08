---
name: apply-margin
description: Flags or drops events against the profile's budget and maximum distance.
user-invocable: false
argument-hint: "<events>"
---

# Apply the Margin

Input: $ARGUMENTS

Budget and maximum distance (from `profile.md`) get a +25% Margin:
- Within the limit → keep as is.
- Above the limit but within +25% → keep, flagged ⚠️ (over budget / further
  than usual, in the user's Language).
- Beyond +25% → drop it, unless it's exceptional: then mark it
  "Highlight-only" so `choose-highlight` may pick it.
