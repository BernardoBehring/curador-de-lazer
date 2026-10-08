---
name: schedule-linux
description: Registers the weekly send in the user's crontab on Linux.
user-invocable: false
argument-hint: "<project path> <claude path> <weekday 0-6> <hour>"
---

# Schedule on Linux

Input: $ARGUMENTS. Explain each command and let the user approve it.

1. `chmod +x <PROJECT>/scripts/weekly-send.sh`
2. Add one crontab line, replacing any previous Curador line (marker
   `# curador-de-lazer`):
```bash
( crontab -l 2>/dev/null | grep -v '# curador-de-lazer' ; \
  echo '0 <18> * * <4> CLAUDE_BIN=<CLAUDE> <PROJECT>/scripts/weekly-send.sh # curador-de-lazer' ) | crontab -
```
   (Fields: minute hour * * weekday; weekday 0 = Sunday … 4 = Thursday.)

Tell the user cron doesn't run jobs missed while the computer was off.
