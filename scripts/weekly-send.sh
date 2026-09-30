#!/usr/bin/env bash
# Launched weekly by launchd (macOS) or cron (Linux).
# Runs the Curador headless: builds the weekend suggestions and emails them.
set -u

project="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$project/logs"
log="$project/logs/weekly-send.log"

claude="${CLAUDE_BIN:-}"
if [ -z "$claude" ]; then
  for c in "$(command -v claude 2>/dev/null)" "$HOME/.local/bin/claude" \
           /opt/homebrew/bin/claude /usr/local/bin/claude; do
    if [ -n "$c" ] && [ -x "$c" ]; then claude="$c"; break; fi
  done
fi

cd "$project" || exit 1
echo "=== $(date '+%Y-%m-%d %H:%M') ===" >> "$log"
if [ -z "$claude" ]; then
  echo "claude executable not found; set CLAUDE_BIN" >> "$log"
  exit 1
fi
"$claude" -p "Weekly send: use the weekly-send skill." \
  --agent curador-de-lazer --permission-mode acceptEdits >> "$log" 2>&1
