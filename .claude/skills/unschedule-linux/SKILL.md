---
name: unschedule-linux
description: Removes the weekly send from the user's crontab on Linux.
user-invocable: false
---

# Unschedule on Linux

Explain the command and let the user approve it:
```bash
crontab -l | grep -v '# curador-de-lazer' | crontab -
```
