---
name: schedule-macos
description: Registers the weekly send as a launchd agent on macOS.
user-invocable: false
argument-hint: "<project path> <claude path> <weekday 0-6> <hour>"
---

# Schedule on macOS

Input: $ARGUMENTS. Explain each command and let the user approve it.

1. `chmod +x <PROJECT>/scripts/weekly-send.sh`
2. Write `~/Library/LaunchAgents/com.curador-de-lazer.weekly-send.plist`:
```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>Label</key><string>com.curador-de-lazer.weekly-send</string>
  <key>ProgramArguments</key>
  <array><string><PROJECT>/scripts/weekly-send.sh</string></array>
  <key>EnvironmentVariables</key>
  <dict><key>CLAUDE_BIN</key><string><CLAUDE></string></dict>
  <key>StartCalendarInterval</key>
  <dict><key>Weekday</key><integer><4></integer><key>Hour</key><integer><18></integer><key>Minute</key><integer>0</integer></dict>
</dict>
</plist>
```
   (Weekday: 0 = Sunday … 4 = Thursday … 6 = Saturday.)
3. Load it (replacing any previous one):
   `launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.curador-de-lazer.weekly-send.plist 2>/dev/null; launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.curador-de-lazer.weekly-send.plist`

If the Mac is asleep at that time, launchd runs the job when it wakes.
