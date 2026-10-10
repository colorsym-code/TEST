#!/usr/bin/env bash
# Install Codex CLI and sign in with a ChatGPT account (device-code flow).
set -euo pipefail

command -v codex >/dev/null || npm install -g @openai/codex
codex --version

if codex login status >/dev/null 2>&1; then
  codex login status
else
  # Prints a URL and a one-time code: open the URL, sign in to ChatGPT, enter the code.
  codex login --device-auth
fi
