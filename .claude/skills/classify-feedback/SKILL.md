---
name: classify-feedback
description: Turns one feedback phrase, in any language, into a history state.
user-invocable: false
argument-hint: "<feedback phrase>"
---

# Classify feedback

Input: $ARGUMENTS

| The user says (or the equivalent in any language) | State | Notes |
|---|---|---|
| "saw / read / went to X, N/5" | Rated | Keep the score. N ≥ 4 = Loved. |
| "not interested in X" | Declined | |
| "I'll watch that", "I'll go", "nice" | Queued | |
| "I'm watching / reading X" | In progress | |
| "I gave up on X", "stopped halfway" | Dropped | Reason: taste or circumstance. |
| "Ana hates / loves …" | Companion info | Not a history state. |

- Missing score for "saw X" → ask for it in one line.
- Dropped with no reason → ask once whether it was taste or lack of time.

Output: item, type, state, score, reason — or Companion info.
