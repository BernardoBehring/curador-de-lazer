---
name: unschedule-macos
description: Removes the weekly send's launchd agent on macOS.
user-invocable: false
---

# Unschedule on macOS

Explain the commands and let the user approve them:
```bash
launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.curador-de-lazer.weekly-send.plist
rm ~/Library/LaunchAgents/com.curador-de-lazer.weekly-send.plist
```
