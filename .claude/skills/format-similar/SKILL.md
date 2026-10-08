---
name: format-similar
description: Lays out the three "similar to X" suggestions.
user-invocable: false
argument-hint: "<reference, three title data>"
---

# Format similar-to

Input: $ARGUMENTS

- Exactly 3 suggestions (they may be of different categories), each via
  `format-title-line`, with the reason replaced by two lines (user's Language):
  `In common: 1 sentence.` and `Different: 1 sentence.`
- The 3rd is the 🧭 Stretch pick.
