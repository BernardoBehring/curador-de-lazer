# Launched weekly by Windows Task Scheduler (task "Curador de Lazer - weekly send").
# Runs the Curador headless: builds the weekend suggestions and emails them.

$project = Split-Path -Parent $PSScriptRoot
$logs = Join-Path $project 'logs'
New-Item -ItemType Directory -Force $logs | Out-Null
$log = Join-Path $logs 'weekly-send.log'

$claude = $env:CLAUDE_BIN
if (-not $claude) { $claude = (Get-Command claude -ErrorAction SilentlyContinue).Source }
if (-not $claude) { $claude = "$env:USERPROFILE\.local\bin\claude.exe" }

Set-Location $project
"=== $(Get-Date -Format 'yyyy-MM-dd HH:mm') ===" | Out-File -Append -Encoding utf8 $log
& $claude -p "Weekly send: use the weekly-send skill." `
    --agent curador-de-lazer --permission-mode acceptEdits 2>&1 |
    Out-File -Append -Encoding utf8 $log
