#!/usr/bin/env bash
# ============================================================================
# NOVA BUILD — CODESPACE BOOTSTRAP (paste into the Codespace terminal, 1 block)
# What it does: installs Hermes on REAL Linux (working Node/Chromium), pulls the
# build, and runs `hermes setup` to enable browser + web_search.
# After it finishes, open a Hermes chat and say:
#   "read ~/ai_influencer/CONTINUITY.md and continue — working browser now."
# ============================================================================
set -euo pipefail

# If you created the codespace FROM the repo, the build is already here.
# If you created a BLANK codespace, set this and the script clones it:
#   export REPO_URL="git@github.com:<you>/<repo>.git"
BUILD_DIR="$HOME/ai_influencer"

echo "== [1/5] system deps =="
sudo apt-get update -y
sudo apt-get install -y python3 python3-pip python3-venv nodejs npm git curl
echo "node: $(node --version)  (expect v18/v20 — no Android V8 crash here)"

echo "== [2/5] install Hermes =="
pip3 install --upgrade pip
pip3 install hermes-agent
hermes --version

echo "== [3/5] bring the build over =="
if [ -d "$BUILD_DIR" ]; then
  echo "build already present at $BUILD_DIR — skipping clone."
else
  if [ -n "${REPO_URL:-}" ]; then
    git clone "$REPO_URL" "$BUILD_DIR"
  else
    echo "WARNING: no $BUILD_DIR and REPO_URL not set."
    echo "Create the codespace FROM the repo, or re-run with: export REPO_URL=..."
    echo "Continuing Hermes setup anyway."
  fi
fi

echo "== [4/5] Hermes tool setup (browser + web_search) =="
hermes setup tools || hermes setup

echo "== [5/5] DONE =="
echo "Open a new Hermes chat in this Codespace and say:"
echo "  read ~/ai_influencer/CONTINUITY.md and continue — working browser now"
