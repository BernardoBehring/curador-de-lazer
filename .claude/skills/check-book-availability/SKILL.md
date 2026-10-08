---
name: check-book-availability
description: Confirms how a book can be obtained in the user's country.
user-invocable: false
argument-hint: "<title, author>"
---

# Check book availability

Input: $ARGUMENTS

Return, confirmed on the web (labels in the user's Language):
- **Local edition**: yes/no — an edition in one of the reading languages, sold
  in Home's country (with its title and page count when yes);
- **available locally**: yes/no — easy to buy in that country in any language;
- **library**: where / not found — only if the profile says they use libraries.

Anything not confirmed → "unconfirmed".
