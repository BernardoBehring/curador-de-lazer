---
name: profile-interview
description: Creates or redoes the Leisure Profile through an interview. Use when profile.md doesn't exist or the user asks to redo their profile.
---

# Profile interview

Orchestration only — no rules here.

1. `run-interview` (pass the existing `profile.md` when redoing).
2. `write-profile` with the confirmed profile.
3. `upsert-history-row` for each title mentioned (Origin User), then set the
   check-in date to today.
4. If the profile has an Email, offer once `setup-weekly-send`.
5. `recommendations`.
