# Curador de Lazer — your personal leisure curator

A [Claude Code](https://code.claude.com) agent that recommends films, series,
books and cultural events near you, tuned to your taste (and to the people you
go out with), explains why each pick fits you, and learns from your feedback.
It talks to you in your own language and works in any country.

## What you need
- Claude Code installed, and a Claude plan that includes it.
- Optional, for email: the **Gmail** connector enabled in your claude.ai
  connector settings. Without it, the Curador works in the terminal only.

## Getting started
```bash
git clone <this repository's URL> curador-de-lazer
cd curador-de-lazer
claude
```
The Curador starts automatically in this folder. The first time, it interviews
you (about 10–15 minutes) to build your Leisure Profile: language, city, what
you love and hate, platforms, budget, and who you usually go out with.

Your profile and history are saved in this folder (`profile.md`,
`history.md`) and are **git-ignored**: they never leave your computer.

## Everyday use
Just talk to it, in any language, or use the shortcuts:

| Ask | Or type |
|---|---|
| A full round of suggestions | `/recommendations` |
| Something to watch tonight | `/tonight` |
| What to do this weekend | `/weekend` |
| More like something you loved | `/similar-to Severance` |
| Tell it what you thought | "saw Severance, 5/5", "not interested in X" |
| Set up the weekly email | `/setup-weekly-send` |
| Start over | "redo my profile" |

Add a companion or a place to any request: `/weekend with Ana in Porto`.

## Weekly email (Windows, macOS, Linux)
Run `/setup-weekly-send`. The Curador detects your system and schedules a
weekly run (Task Scheduler on Windows, launchd on macOS, cron on Linux) that
emails you the weekend's suggestions. The computer must be on at that time
(on macOS and Windows, a missed run happens when the computer wakes up).
Logs go to `logs/weekly-send.log`.

## Updating
```bash
git pull
```
Your profile and history are untouched.

## How it's built
- `.claude/agents/curador-de-lazer.md` — the agent and its shared rules.
- `.claude/skills/` — one skill per flow (interview, recommendations, tonight,
  weekend, similar-to, feedback, check-in, email, weekly send, setup).
- `CONTEXT.md` — the glossary of terms the Curador uses.
- `scripts/` — the weekly-send launchers for each system.
