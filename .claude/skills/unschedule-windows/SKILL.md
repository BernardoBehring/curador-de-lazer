---
name: unschedule-windows
description: Removes the weekly send from Windows Task Scheduler.
user-invocable: false
---

# Unschedule on Windows

Explain the command and let the user approve it:
```powershell
Unregister-ScheduledTask -TaskName "Curador de Lazer - weekly send" -Confirm:$false
```
