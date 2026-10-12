#!/usr/bin/env bash
# Launched weekly by launchd (macOS) or cron (Linux).
# Runs the Curador headless: builds the weekend suggestions and emails them.
#
# Exit codes: 0 = email sent · 2 = run finished but nothing was sent · 1 = the run failed
set -u

project="$(cd "$(dirname "$0")/.." && pwd)"
logs="$project/logs"
mkdir -p "$logs"
log="$logs/weekly-send.log"
if [ -f "$log" ] && [ "$(wc -c < "$log")" -gt 1048576 ]; then mv -f "$log" "$log.old"; fi

say() { printf '%s [%s] %s\n' "$(date '+%Y-%m-%d %H:%M:%S')" "$1" "$2" >> "$log"; }

say INFO "=== weekly send started (user $(id -un), project $project)"

# 1. Locate claude
claude="${CLAUDE_BIN:-}"
if [ -z "$claude" ]; then
  for c in "$(command -v claude 2>/dev/null)" "$HOME/.local/bin/claude" \
           /opt/homebrew/bin/claude /usr/local/bin/claude; do
    if [ -n "$c" ] && [ -x "$c" ]; then claude="$c"; break; fi
  done
fi
if [ -z "$claude" ] || [ ! -x "$claude" ]; then say ERROR "claude executable not found; set CLAUDE_BIN"; exit 1; fi
say INFO "claude: $claude ($("$claude" --version 2>/dev/null))"

# 2. Allowed tools come from .claude/settings.json and are passed on the command line,
#    because project settings are ignored until the folder is trusted interactively.
allowed="$(tr -d '\n\r' < "$project/.claude/settings.json" \
  | sed -n 's/.*"allow"[[:space:]]*:[[:space:]]*\[\([^]]*\)\].*/\1/p' \
  | tr -d '" ' | tr ',' ' ')"
if [ -z "$allowed" ]; then say ERROR "cannot read permissions.allow from .claude/settings.json"; exit 1; fi
say INFO "allowed tools: $allowed"

# 3. Run the Curador
out="$logs/last-run.json"
err="$logs/last-run.stderr.txt"
cd "$project" || exit 1
start=$(date +%s)
# shellcheck disable=SC2086
"$claude" -p "Weekly send: use the weekly-send skill." --agent curador-de-lazer \
  --permission-mode acceptEdits --output-format json --allowedTools $allowed > "$out" 2> "$err"
code=$?
say INFO "claude exited with code $code after $(( $(date +%s) - start ))s"
if [ -s "$err" ]; then say WARN "stderr: $(cat "$err")"; fi

# 4. Interpret the result (jq if available, otherwise plain text search)
if command -v jq >/dev/null 2>&1 && jq -e . "$out" >/dev/null 2>&1; then
  result="$(jq -r '.result // ""' "$out")"
  is_error="$(jq -r '.is_error' "$out")"
  denied="$(jq -r '[.permission_denials[]?.tool_name] | unique | join(", ")' "$out")"
  say INFO "turns: $(jq -r '.num_turns' "$out") · cost: $(jq -r '.total_cost_usd' "$out") USD · is_error: $is_error"
else
  result="$(cat "$out")"
  is_error="unknown"
  denied=""
  say WARN "jq not installed: logging the raw result"
fi
if [ -n "$denied" ]; then say ERROR "tools denied: $denied — add them to permissions.allow in .claude/settings.json"; fi
say INFO "result:
$result"

status="$(printf '%s\n' "$result" | grep -o 'WEEKLY-SEND: [^"\\]*' | tail -n 1)"
if [ "$code" -ne 0 ] || [ "$is_error" = "true" ]; then say ERROR "=== FAILED"; exit 1; fi
case "$status" in
  "WEEKLY-SEND: SENT"*) say INFO "=== $status"; exit 0 ;;
  "") say WARN "=== finished without a WEEKLY-SEND status line; assuming nothing was sent"; exit 2 ;;
  *) say WARN "=== $status"; exit 2 ;;
esac
