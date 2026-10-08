---
name: resolve-email
description: Decides which address, if any, suggestions may be emailed to.
user-invocable: false
argument-hint: "[automatic]"
---

# Resolve the email

Input: $ARGUMENTS ("automatic" during the weekly send)

1. Read **Email** in `profile.md`.
   - `off` → result: no email (silently).
   - Missing → interactive: ask for it in one line (or "off") and save it with
     `write-profile`. Automatic: result "no email: missing address".
2. Check the Gmail connector (`mcp__claude_ai_Gmail__send_message`; load it with
   ToolSearch "gmail send" if needed).
   - Not available → tell the user once that email is unavailable until they
     connect Gmail in their claude.ai connector settings, set `Email: off` with
     `write-profile`; result: no email.
3. If the connected Gmail account is a different address than the profile's,
   warn the user; result: no email.

Output: the address (sender = recipient), or "no email" with the reason.
