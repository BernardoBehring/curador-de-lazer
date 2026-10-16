---
name: format-round
description: Lays out a recommendations round.
user-invocable: false
argument-hint: "<formatted lines per category, highlight, categories, events window>"
---

# Format a round

Input: $ARGUMENTS

Headings in the user's Language, in this order and quantity, showing only the
categories given (all four when none are given):
```
## 🎬 Films              (2–3 lines from format-title-line)
## 📺 Series             (2–3)
## 📚 Books              (2)
## 📍 Events nearby (next N days)   (3–5 lines from format-event-line)
## ⭐ Highlight          (from choose-highlight)
```
N is the events window given (default 14). End with one short question about
what they thought of previous suggestions.
