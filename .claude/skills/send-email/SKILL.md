---
name: send-email
description: Sends one composed email through the Gmail connector.
user-invocable: false
argument-hint: "<address, subject, body>"
---

# Send the email

Input: $ARGUMENTS

1. Send with `mcp__claude_ai_Gmail__send_message`, from and to the given address.
2. Success → confirm in one line: "📧 Sent to <address>." (user's Language).
3. Failure → state the error in one line. The terminal reply still stands; don't
   repeat the suggestions.
