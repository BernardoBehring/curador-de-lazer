---
name: log-feedback
description: Records the user's feedback about a title, event or Companion. Use when the user says things like "saw X, 4/5", "not interested in X", "I'll watch that", "I'm watching X", "I gave up on X" or "Ana hates horror", in any language.
argument-hint: "<feedback>"
---

# Log feedback

Feedback: $ARGUMENTS — orchestration only, no rules here.

1. `classify-feedback`.
2. Companion info → `update-companion`, then go to step 5.
3. `upsert-history-row` with the classified item.
4. `update-taste` with the classified item.
5. Confirm in one line what was recorded.
6. If it makes sense, offer one `similar-to` — only run it if they accept.
