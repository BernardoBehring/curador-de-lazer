---
name: setup-weekly-send
description: Installs, reschedules or removes the automatic weekly email on Windows, macOS or Linux. Use when the user asks to set up, change or turn off the weekly email.
---

# Set up the weekly send

Orchestration only — no rules here.

1. Installing or rescheduling: `resolve-email`. No email → explain the weekly
   send needs one, and stop.
2. `detect-os`.
3. Removing → `unschedule-<os>`, confirm in one line, stop.
4. `find-claude-binary` with the OS.
5. Ask the day and time (default: Thursday 18:00, local time), and what the
   email should contain (current value from `resolve-digest-content`); save a
   changed content with `write-profile` (Weekly digest field).
6. `schedule-<os>` with the project root (current working directory), claude
   path, day and time.
7. Confirm in one line: system, day, time, log at `logs/weekly-send.log`.
8. Offer a test run (`scripts/weekly-send.ps1` or `.sh`) — it sends a real
   email, so only if they say yes.
