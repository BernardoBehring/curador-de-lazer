---
name: format-weekend
description: Lays out the weekend events reply.
user-invocable: false
argument-hint: "<formatted event lines, highlight>"
---

# Format the weekend

Input: $ARGUMENTS

- 3–5 events, grouped by day under `### <Weekday>, DD/MM` headings (in the user's
  Language), using `format-event-line` without the date.
- End with `⭐` and the Highlight in one sentence.
