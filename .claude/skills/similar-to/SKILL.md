---
name: similar-to
description: Three suggestions similar to a title or event, with how each one differs. Use when the user asks for "something like X" / "similar to X".
argument-hint: "<title or event>"
---

# Similar to

Reference: $ARGUMENTS

1. Read `profile.md`, `history.md` and `history-archive.md` (if it exists). If
   the reference is in the history with a score or reason, use it to understand
   what they liked.
2. Identify what defines the reference (pace, theme, atmosphere, tone,
   structure). If it's unclear what they're after, ask in one line before
   searching.
3. Search the web. The 3 suggestions may be from different categories (a book
   like a series is fine). Confirm platform/availability in their country.
4. Exclude whatever the State rules forbid.
5. Reply (labels in the user's language):
   ```
   **Title (year)** — platform/format · runtime/pages
   In common: 1 sentence. Different: 1 sentence.
   ```
   Books add "Local edition: yes/no · available locally: yes/no".
   The 3rd suggestion is a 🧭 Stretch pick (Openness scale).
6. Log all 3 in `history.md` with Origin Curador and state Suggested.
7. Email them with the `send-email` skill, type `Similar to <X>`.
