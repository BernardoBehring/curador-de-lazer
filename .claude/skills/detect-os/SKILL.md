---
name: detect-os
description: Identifies the user's operating system.
user-invocable: false
---

# Detect the OS

Run `uname -s` (Bash) or read `$env:OS` (PowerShell):
- `Windows_NT` (or MINGW/MSYS/CYGWIN from `uname`) → **windows**
- `Darwin` → **macos**
- `Linux` → **linux**

Output: windows | macos | linux.
