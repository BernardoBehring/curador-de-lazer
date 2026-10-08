---
name: filter-by-companions
description: Removes candidates that clash with the requested Companions' strong "no"s.
user-invocable: false
argument-hint: "<companions, candidates>"
---

# Filter by Companions

Input: $ARGUMENTS

- No Companion in the request → the request is for the user alone; return the
  candidates unchanged.
- Otherwise read each named Companion in `profile.md` and remove every film,
  series or event that hits one of their strong "no"s. This is a hard filter.
- **Never filter books.**
- Unknown Companion name → keep the candidates and say you don't know them yet
  (the user can describe them, which triggers `log-feedback`).
