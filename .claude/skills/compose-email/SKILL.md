---
name: compose-email
description: Builds the subject and body of a suggestions email.
user-invocable: false
argument-hint: "<type, reply content>"
---

# Compose the email

Input: $ARGUMENTS

In the user's Language:
- **Subject**: `Curador de Lazer · <Type> · <date in the user's locale>`.
  Types (translated): Recommendations, Tonight, Weekend, Similar to <X>,
  Weekly digest.
- **Body**: exactly the reply shown in the terminal (same titles, emojis,
  sections and order), with:
  - full links (never "[link]" without a URL);
  - dates written out where it helps ("Saturday, 4 October");
  - a closing line inviting feedback in the Curador ("saw X, N/5 · not
    interested in X · I'll watch that…").
- Simple HTML (headings, bold, lists, links) if the send tool accepts it;
  otherwise readable plain text.
