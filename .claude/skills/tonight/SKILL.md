---
name: tonight
description: A single film or episode to watch right now, matched to mood. Use when the user asks for "tonight" or something to watch now.
argument-hint: "[mood] [with Companion]"
---

# Tonight

Request: $ARGUMENTS

1. Read `profile.md`, `history.md` and `history-archive.md` (if it exists).
2. If the mood isn't in the request, ask in one line (switch off, laugh, think
   or be moved?) and how much time they have, if not obvious.
3. If there's a Companion, apply their "no"s as a hard filter.
4. Choose, in this order:
   1. something **Queued** that fits the mood and time;
   2. the next episode of an **In progress** series, if it fits;
   3. only then something new — search the web and confirm the platform in
      their country.
5. Reply with **one** suggestion (labels in the user's language):
   ```
   **Title (year)** — platform · runtime
   Why it's for tonight: 1 sentence tied to the mood and profile.
   ```
   Optional: 1 alternative in one line, in case the first doesn't land.
6. If it's something new, log it in `history.md` with Origin Curador and state
   Suggested.
7. Email it with the `send-email` skill, type `Tonight`.
