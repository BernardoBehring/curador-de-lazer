---
name: format-title-line
description: Formats one Title as a suggestion line.
user-invocable: false
argument-hint: "<title data, reason label>"
---

# Format a Title line

Input: $ARGUMENTS

Labels in the user's Language; the title comes from `localize-title`.
- Film: `**Title (year)** — platform · runtime`
- Series: `**Title** — platform · no. of seasons / episode length`
- Book: `**Title — Author** · pages · Local edition: yes/no · available locally: yes/no`
  (+ `· library: …` when given)

Then one line with the reason, using the label the caller gives (default
"Why it fits you:"). Prefix 🧭 for a Stretch pick. No spoilers.
