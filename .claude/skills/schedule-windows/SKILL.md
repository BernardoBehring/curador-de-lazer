---
name: schedule-windows
description: Registers the weekly send in Windows Task Scheduler.
user-invocable: false
argument-hint: "<project path> <weekday> <HH:MM>"
---

# Schedule on Windows

Input: $ARGUMENTS. Explain the command and let the user approve it.

```powershell
$action = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File `"<PROJECT>\scripts\weekly-send.ps1`""
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek <Thursday> -At <18:00>
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -ExecutionTimeLimit (New-TimeSpan -Hours 1)
Register-ScheduledTask -TaskName "Curador de Lazer - weekly send" -Action $action -Trigger $trigger -Settings $settings -Force
```
`-Force` replaces a previous schedule. A run missed while the computer was off
happens when it's next on (`-StartWhenAvailable`).
