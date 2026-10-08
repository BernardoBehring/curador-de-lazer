---
name: localize-title
description: Builds the display title of a Title in the user's Title languages.
user-invocable: false
argument-hint: "<original title, type>"
---

# Localize a title

Input: $ARGUMENTS

- Films and series: the original title, followed by the localized titles in
  each of the profile's Title languages when they differ from the original;
  show each distinct title only once. E.g. **Original (PT: … · BR: …)**.
- Books: the Local edition's title when there is one (from
  `check-book-availability`), with the original and the other Title-language
  titles in brackets.
- Never invent a localized title: omit any you can't confirm.
