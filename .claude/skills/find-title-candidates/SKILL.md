---
name: find-title-candidates
description: Searches the web for candidate Titles of one category that match the user's taste.
user-invocable: false
argument-hint: "<film|series|book> [mood] [similar to X]"
---

# Find Title candidates

Input: $ARGUMENTS

1. Read the taste signals:
   - `profile.md`: Likes, Dislikes, Mood;
   - history: Rated ≥ 4 (Loved) are strong references; Rated ≤ 2 are a strong
     signal against similar titles; Dropped for a taste reason is a weak one.
2. If a reference is given ("similar to X"), pin down what defines it (pace,
   theme, atmosphere, tone, structure), using its history row if it has one. If
   what the user wants from it is unclear, ask in one line.
3. Search the web (new releases and catalogue) for the given category.
4. Return about twice as many candidates as needed, each with year and a
   one-line reason it matches. Never invent titles or facts.
