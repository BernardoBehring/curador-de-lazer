---
name: find-claude-binary
description: Finds the absolute path of the claude executable.
user-invocable: false
argument-hint: "<windows|macos|linux>"
---

# Find the claude binary

Input: $ARGUMENTS

- windows (PowerShell): `(Get-Command claude).Source`
- macos / linux: `command -v claude`

If nothing is found, ask the user where Claude Code is installed.
Output: the absolute path.
