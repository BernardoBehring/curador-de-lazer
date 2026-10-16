# Launched weekly by Windows Task Scheduler (task "Curador de Lazer - weekly send").
# Runs the Curador headless: builds the weekly digest and emails it.
#
# Exit codes (shown as "Last Run Result" in Task Scheduler):
#   0 = email sent | 2 = run finished but nothing was sent | 1 = the run failed

$project = Split-Path -Parent $PSScriptRoot
$logs = Join-Path $project 'logs'
New-Item -ItemType Directory -Force $logs | Out-Null
$log = Join-Path $logs 'weekly-send.log'
if ((Test-Path $log) -and (Get-Item $log).Length -gt 1MB) { Move-Item -Force $log "$log.old" }

function Write-Log([string]$level, [string]$msg) {
    "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') [$level] $msg" | Out-File -Append -Encoding utf8 $log
}

Write-Log INFO "=== weekly send started (user $env:USERNAME, project $project)"

# 1. Locate claude
$claude = $env:CLAUDE_BIN
if (-not $claude) { $claude = (Get-Command claude -ErrorAction SilentlyContinue).Source }
if (-not $claude) { $claude = "$env:USERPROFILE\.local\bin\claude.exe" }
if (-not (Test-Path $claude)) { Write-Log ERROR "claude executable not found ($claude). Set CLAUDE_BIN."; exit 1 }
Write-Log INFO "claude: $claude ($(& $claude --version 2>$null))"

# 2. Allowed tools come from .claude/settings.json and are passed on the command line,
#    because project settings are ignored until the folder is trusted interactively.
try {
    $settings = Get-Content (Join-Path $project '.claude\settings.json') -Raw -Encoding UTF8 | ConvertFrom-Json
    $allowed = @($settings.permissions.allow)
} catch { Write-Log ERROR "cannot read .claude/settings.json: $_"; exit 1 }
Write-Log INFO "allowed tools: $($allowed -join ', ')"

# 3. Run the Curador
$outFile = Join-Path $logs 'last-run.json'
$errFile = Join-Path $logs 'last-run.stderr.txt'
$prompt = 'Weekly send: use the weekly-send skill.'
$argLine = "-p `"$prompt`" --agent curador-de-lazer --permission-mode acceptEdits --output-format json --allowedTools $($allowed -join ' ')"
$started = Get-Date
$proc = Start-Process -FilePath $claude -ArgumentList $argLine -WorkingDirectory $project `
    -RedirectStandardOutput $outFile -RedirectStandardError $errFile -NoNewWindow -Wait -PassThru
$secs = [int]((Get-Date) - $started).TotalSeconds
Write-Log INFO "claude exited with code $($proc.ExitCode) after ${secs}s"

$stderr = (Get-Content $errFile -Raw -Encoding UTF8 -ErrorAction SilentlyContinue)
if ($stderr -and $stderr.Trim()) { Write-Log WARN "stderr: $($stderr.Trim())" }

# 4. Interpret the result
try { $r = Get-Content $outFile -Raw -Encoding UTF8 | ConvertFrom-Json }
catch { Write-Log ERROR "no JSON result from claude (see logs\last-run.json)"; exit 1 }

Write-Log INFO "turns: $($r.num_turns) | cost: $($r.total_cost_usd) USD | is_error: $($r.is_error)"
$denied = @($r.permission_denials | ForEach-Object { $_.tool_name } | Sort-Object -Unique)
if ($denied.Count) { Write-Log ERROR "tools denied: $($denied -join ', ') - add them to permissions.allow in .claude/settings.json" }

$statusLine = ($r.result -split "`n" | Where-Object { $_ -match '^WEEKLY-SEND:' } | Select-Object -Last 1)
Write-Log INFO "result:`n$($r.result.Trim())"

if ($r.is_error -or $proc.ExitCode -ne 0) { Write-Log ERROR '=== FAILED'; exit 1 }
if ($statusLine -match '^WEEKLY-SEND: SENT') { Write-Log INFO "=== $statusLine"; exit 0 }
if ($statusLine) { Write-Log WARN "=== $statusLine"; exit 2 }
Write-Log WARN '=== finished without a WEEKLY-SEND status line; assuming nothing was sent'
exit 2
