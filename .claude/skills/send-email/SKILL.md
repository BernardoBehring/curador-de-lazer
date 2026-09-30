---
name: send-email
description: Emails a reply with Curador suggestions via Gmail, from the profile's Email to itself. Use at the end of every skill that produces suggestions (recommendations, tonight, weekend, similar-to, weekly-send).
argument-hint: "<send type>"
---

# Email the suggestions

Type: $ARGUMENTS

## Before sending
1. Read **Email** in `profile.md` (Context section).
   - `off` → don't send and say nothing.
   - Missing → ask for it in one line (or "off"), save it in the profile and
     continue. In automatic mode (weekly send), don't ask: stop without sending
     and log the reason.
2. Use the Gmail connector tools (`mcp__claude_ai_Gmail__send_message`; if they
   aren't loaded, find them with ToolSearch "gmail send").
   - If the connector isn't available at all: tell the user once that email is
     unavailable until they connect Gmail in their claude.ai connector settings,
     set `Email: off` in the profile, and stop. The terminal reply still stands.
3. Sender and recipient are the same: the profile's Email. If the Gmail account
   connected is a different address, warn the user and don't send.

## Format (in the user's Language)
- **Subject**: `Curador de Lazer · <Type> · <date in the user's locale>`
  Types (translate): `Recommendations`, `Tonight`, `Weekend`,
  `Similar to <X>`, `Weekly digest`.
- **Body**: exactly the same content you showed in the terminal (same titles,
  emojis, sections and order), with:
  - full links (never "[link]" without a URL);
  - dates written out where it helps ("Saturday, 4 October");
  - a closing line inviting feedback in the Curador ("saw X, N/5 · not
    interested in X · I'll watch that…").
- Use simple HTML (headings, bold, lists, links) if the tool accepts it;
  otherwise readable plain text.

## Send
1. Send with `send_message`.
2. If sending fails, say the error in one line. The terminal reply still
   stands; don't repeat the suggestions.
3. Confirm in one line: "📧 Sent to <email>." (in the user's Language).
