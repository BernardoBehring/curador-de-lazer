---
name: check-in
description: Short Leisure Profile review with 2–3 questions, a hit-rate summary and history tidy-up. Use at the start of a session when the last check-in was 30+ days ago, or when the user asks to review (not redo) their profile.
---

# Check-in

1. Read `profile.md`, `history.md` and `history-archive.md` (if it exists).
2. **Hit rate** — consider only items with Origin Curador whose state changed
   since the last check-in. Show one line, e.g.:
   "Since DD/MM: N of M suggestions became Loved · X Declined · Y Dropped."
   If there's a clear pattern of misses (e.g. every horror pick Declined) or
   hits, add it in one sentence. If there isn't enough data, skip this.
3. Prepare 2–3 short questions based on what changed, for example:
   - new patterns in the history (several Loved in a genre not in the profile,
     several Dropped in another, misses from the hit rate);
   - platforms, budget or free time that may have changed;
   - new Companions, or ones no longer relevant;
   - items Queued for over 3 months: still interested?
   - Queued Events whose date has passed: how did they go?
4. Ask them all at once, lightly, and say "nothing's changed" is a fine answer.
5. With the answers:
   - update `profile.md` (and its "Confirmed on" date);
   - update states in the history (following the `log-feedback` rules).
6. **Tidy-up** — move to `history-archive.md` (same table format, without the
   check-in line):
   - Suggested items with no reaction for over 6 months;
   - Events whose date has passed with no feedback (Suggested, or Queued after
     you've already asked).
   Don't touch Rated, Declined, In progress, Dropped or recent Queued items.
7. Set `Last check-in:` to today.
8. Carry on with the original request, if any.
