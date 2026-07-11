#!/usr/bin/env bash
set -euo pipefail

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required before running this bootstrap script." >&2
  exit 1
fi

brew bundle --file "$HOME/.local/share/chezmoi/Brewfile"

if command -v chezmoi >/dev/null 2>&1; then
  chezmoi apply
else
  echo "chezmoi was not found after brew bundle. Check Homebrew permissions and rerun." >&2
  exit 1
fi
