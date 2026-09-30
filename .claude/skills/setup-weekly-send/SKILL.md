---
name: setup-weekly-send
description: Installs, changes or removes the automatic weekly email on Windows, macOS or Linux. Use when the user asks to set up, change the day/time of, or turn off the weekly email.
---

# Set up the weekly send

Talk to the user in the profile's Language. Every command here changes their
system's scheduler, so explain what you'll run and let them approve it.

## Preconditions
1. `profile.md` exists and has an Email that isn't `off`. Otherwise explain
   that the weekly send needs both, and stop.
2. Find the `claude` executable's absolute path:
   - Windows (PowerShell): `(Get-Command claude).Source`
   - macOS/Linux: `command -v claude`
   If not found, ask the user where Claude Code is installed.
3. Ask the day and time (default: Thursday 18:00, local time), unless they
   asked to remove it.

## Identify the system
Run `uname -s` (Bash) or check `$env:OS` (PowerShell):
`Windows_NT` → Windows · `Darwin` → macOS · `Linux` → Linux.

The project root is the current working directory. Use its absolute path below
as `<PROJECT>`, and the claude path as `<CLAUDE>`.

## Windows — Task Scheduler
Script: `scripts/weekly-send.ps1`. Install (PowerShell):
```powershell
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"<PROJECT>\scripts\weekly-send.ps1`""
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek <Thursday> -At <18:00>
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -ExecutionTimeLimit (New-TimeSpan -Hours 1)
Register-ScheduledTask -TaskName "Curador de Lazer - weekly send" -Action $action -Trigger $trigger -Settings $settings -Force
```
Remove: `Unregister-ScheduledTask -TaskName "Curador de Lazer - weekly send" -Confirm:$false`

## macOS — launchd
Script: `scripts/weekly-send.sh` (run `chmod +x` on it first).
Write `~/Library/LaunchAgents/com.curador-de-lazer.weekly-send.plist`:
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
Load: `launchctl bootout gui/$(id -u) ~/Library/LaunchAgents/com.curador-de-lazer.weekly-send.plist 2>/dev/null; launchctl bootstrap gui/$(id -u) ~/Library/LaunchAgents/com.curador-de-lazer.weekly-send.plist`
Remove: the same `bootout`, then delete the plist.
If the Mac was asleep at that time, launchd runs the job when it wakes.

## Linux — cron
Script: `scripts/weekly-send.sh` (run `chmod +x` on it first).
Add one line to the user's crontab, replacing any previous Curador line
(identified by the `# curador-de-lazer` marker):
```bash
( crontab -l 2>/dev/null | grep -v '# curador-de-lazer' ; \
  echo '<0> <18> * * <4> CLAUDE_BIN=<CLAUDE> <PROJECT>/scripts/weekly-send.sh # curador-de-lazer' ) | crontab -
```
(Fields: minute hour * * weekday; weekday 0 = Sunday … 4 = Thursday.)
Remove: `crontab -l | grep -v '# curador-de-lazer' | crontab -`
Tell the user cron doesn't run jobs missed while the computer was off.

## After installing
1. Confirm in one line: system, day, time, and that the log is at
   `logs/weekly-send.log`.
2. Offer a test run now: execute the script directly. It sends a real email;
   run it only if they say yes.
