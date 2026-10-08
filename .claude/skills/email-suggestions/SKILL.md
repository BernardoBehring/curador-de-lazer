---
name: email-suggestions
description: Emails a reply with suggestions to the user. Use at the end of every skill that shows suggestions.
argument-hint: "<type, reply content>"
user-invocable: false
---

# Email the suggestions

Input: $ARGUMENTS — orchestration only, no rules here.

1. `resolve-email`. No email → stop silently (or with the one-time notice it gives).
2. `compose-email` with the type and the reply content.
3. `send-email`.
