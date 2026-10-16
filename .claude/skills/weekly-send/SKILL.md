---
name: weekly-send
description: Builds and emails the weekly digest with no user present. Use only when the prompt says "Weekly send" (launched by the OS scheduler).
user-invocable: false
---

# Weekly send

Orchestration only — no rules here. Automatic mode: never ask anything.

1. No `profile.md` → write "no profile" in one line and stop.
2. `resolve-email` with "automatic". No email → write the reason in one line
   and stop.
3. `list-pending`.
4. `resolve-digest-content`.
5. `recommendations` with those categories, that events window and "no-email".
6. If pending items exist, append: "🔔 N things to review (…) — open the
   Curador when you can." (in the user's Language).
7. `compose-email` with type Weekly digest, then `send-email`.
8. End your reply with exactly one status line (in English, read by the
   launcher script):
   - `WEEKLY-SEND: SENT <address>`
   - `WEEKLY-SEND: NOT SENT — <short reason>` (no profile, no email, tool
     denied, send failed…)
