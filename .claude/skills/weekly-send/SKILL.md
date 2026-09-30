---
name: weekly-send
description: Automatic weekly run (no user present) that builds the weekend suggestions and emails them. Use only when the prompt says "Weekly send" (launched by the OS scheduler).
---

# Automatic weekly send

You're running with nobody at the terminal. **Never ask questions or wait for
answers.** Write the email in the profile's Language.

1. Read `profile.md`, `history.md` and `history-archive.md` (if it exists).
2. If there's no profile, or Email is missing or `off`, stop without sending and
   write the reason in one line (it goes to the log).
3. Don't run the check-in and don't ask how events went; instead, count what's
   pending:
   - check-in overdue (30+ days);
   - Queued Events whose date has passed;
   - items Queued for over 3 months.
4. Follow the `weekend` skill (no Companion, from Home), including logging to
   the history.
5. If anything is pending, add at the end:
   "🔔 You have N things to review (…) — open the Curador when you can."
6. Send with the `send-email` skill, type `Weekly digest`. On failure, write the
   error in one line and stop.
