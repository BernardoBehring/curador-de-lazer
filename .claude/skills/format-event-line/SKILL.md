---
name: format-event-line
description: Formats one Event as a suggestion line.
user-invocable: false
argument-hint: "<event data> [without date]"
---

# Format an Event line

Input: $ARGUMENTS

Labels in the user's Language:
`**Name** — date, time · venue · price · distance [Margin flag] [eligibility flag]`
(flags exactly as given by `apply-margin` and `check-eligibility`)
(omit the date when the caller groups events by day). Then:
`Why it fits you: 1 sentence. <full link>`
Prefix 🧭 for a Stretch pick.
