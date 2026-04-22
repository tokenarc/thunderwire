#!/bin/bash

# ═══════════════════════════════════════════════════════════
#  THUNDERWIRE — Install Script
#  X Content Intelligence Protocol
#  github.com/tokenarc/thunderwire
# ═══════════════════════════════════════════════════════════

set -e

BOLD='\033[1m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
DIM='\033[2m'
NC='\033[0m'

clear

echo ""
echo -e "${CYAN}${BOLD}"
echo "  ████████╗██╗  ██╗██╗   ██╗███╗   ██╗██████╗ ███████╗██████╗ ██╗    ██╗██╗██████╗ ███████╗"
echo "     ██║   ██║  ██║██║   ██║████╗  ██║██╔══██╗██╔════╝██╔══██╗██║    ██║██║██╔══██╗██╔════╝"
echo "     ██║   ███████║██║   ██║██╔██╗ ██║██║  ██║█████╗  ██████╔╝██║ █╗ ██║██║██████╔╝█████╗  "
echo "     ██║   ██╔══██║██║   ██║██║╚██╗██║██║  ██║██╔══╝  ██╔══██╗██║███╗██║██║██╔══██╗██╔══╝  "
echo "     ██║   ██║  ██║╚██████╔╝██║ ╚████║██████╔╝███████╗██║  ██║╚███╔███╔╝██║██║  ██║███████╗"
echo "     ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚══╝╚══╝ ╚═╝╚═╝  ╚═╝╚══════╝"
echo -e "${NC}"
echo -e "${DIM}  X Content Intelligence Protocol — github.com/tokenarc/thunderwire${NC}"
echo ""
echo "  ═══════════════════════════════════════════════════════════════"
echo ""

# ── Detect tool ──────────────────────────────────────────────────────
echo -e "${BOLD}  Which AI tool are you setting up for?${NC}"
echo ""
echo "  1) Claude Code"
echo "  2) Cursor"
echo "  3) Windsurf"
echo "  4) Copy system prompt (ChatGPT, Gemini, or any other)"
echo ""
read -p "  Enter number (1-4): " TOOL_CHOICE
echo ""

# ── Claude Code ───────────────────────────────────────────────────────
if [ "$TOOL_CHOICE" = "1" ]; then
  echo -e "${BOLD}  Claude Code Setup${NC}"
  echo ""

  # Check if claude is installed
  if ! command -v claude &> /dev/null; then
    echo -e "${YELLOW}  ⚠  Claude Code not found.${NC}"
    echo ""
    echo "  Install it first:"
    echo "  npm install -g @anthropic-ai/claude-code"
    echo ""
    exit 1
  fi

  # Determine target directory
  read -p "  Where do you want your THUNDERWIRE workspace? [~/thunderwire]: " TARGET
  TARGET="${TARGET:-$HOME/thunderwire}"
  TARGET="${TARGET/#\~/$HOME}"

  mkdir -p "$TARGET"

  # Copy or check for THUNDERWIRE.md
  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  if [ -f "$SCRIPT_DIR/THUNDERWIRE.md" ]; then
    cp "$SCRIPT_DIR/THUNDERWIRE.md" "$TARGET/THUNDERWIRE.md"
    echo -e "  ${GREEN}✓${NC} THUNDERWIRE.md copied to $TARGET"
  else
    echo "  Downloading THUNDERWIRE.md from GitHub..."
    curl -s "https://raw.githubusercontent.com/tokenarc/thunderwire/main/THUNDERWIRE.md" \
      -o "$TARGET/THUNDERWIRE.md"
    echo -e "  ${GREEN}✓${NC} THUNDERWIRE.md downloaded to $TARGET"
  fi

  echo ""
  echo -e "  ${GREEN}${BOLD}✅ Done.${NC}"
  echo ""
  echo "  ─────────────────────────────────────────────"
  echo -e "  ${BOLD}  To activate:${NC}"
  echo ""
  echo "  cd $TARGET"
  echo "  claude"
  echo ""
  echo "  Then type:"
  echo "  \"My niche is [X]. Run setup.\""
  echo "  ─────────────────────────────────────────────"

# ── Cursor ────────────────────────────────────────────────────────────
elif [ "$TOOL_CHOICE" = "2" ]; then
  echo -e "${BOLD}  Cursor Setup${NC}"
  echo ""
  echo "  Where is your Cursor project folder?"
  read -p "  Project path [current directory]: " PROJECT
  PROJECT="${PROJECT:-$(pwd)}"
  PROJECT="${PROJECT/#\~/$HOME}"

  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  if [ -f "$SCRIPT_DIR/THUNDERWIRE.md" ]; then
    cp "$SCRIPT_DIR/THUNDERWIRE.md" "$PROJECT/.cursorrules"
  else
    curl -s "https://raw.githubusercontent.com/tokenarc/thunderwire/main/THUNDERWIRE.md" \
      -o "$PROJECT/.cursorrules"
  fi

  echo -e "  ${GREEN}✓${NC} THUNDERWIRE installed as .cursorrules in $PROJECT"
  echo ""
  echo -e "  ${GREEN}${BOLD}✅ Done.${NC}"
  echo ""
  echo "  Open Cursor from $PROJECT — THUNDERWIRE is active."
  echo "  First message: \"My niche is [X]. Run setup.\""

# ── Windsurf ──────────────────────────────────────────────────────────
elif [ "$TOOL_CHOICE" = "3" ]; then
  echo -e "${BOLD}  Windsurf Setup${NC}"
  echo ""
  read -p "  Project path [current directory]: " PROJECT
  PROJECT="${PROJECT:-$(pwd)}"
  PROJECT="${PROJECT/#\~/$HOME}"

  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

  if [ -f "$SCRIPT_DIR/THUNDERWIRE.md" ]; then
    cp "$SCRIPT_DIR/THUNDERWIRE.md" "$PROJECT/.windsurfrules"
  else
    curl -s "https://raw.githubusercontent.com/tokenarc/thunderwire/main/THUNDERWIRE.md" \
      -o "$PROJECT/.windsurfrules"
  fi

  echo -e "  ${GREEN}✓${NC} THUNDERWIRE installed as .windsurfrules in $PROJECT"
  echo ""
  echo -e "  ${GREEN}${BOLD}✅ Done.${NC}"
  echo ""
  echo "  Open Windsurf from $PROJECT — THUNDERWIRE is active."
  echo "  First message: \"My niche is [X]. Run setup.\""

# ── Copy to clipboard (ChatGPT, Gemini, etc.) ─────────────────────────
elif [ "$TOOL_CHOICE" = "4" ]; then
  echo -e "${BOLD}  System Prompt Copy${NC}"
  echo ""

  SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
  TW_FILE="$SCRIPT_DIR/THUNDERWIRE.md"

  if [ ! -f "$TW_FILE" ]; then
    echo "  Downloading THUNDERWIRE.md..."
    curl -s "https://raw.githubusercontent.com/tokenarc/thunderwire/main/THUNDERWIRE.md" \
      -o "/tmp/THUNDERWIRE.md"
    TW_FILE="/tmp/THUNDERWIRE.md"
  fi

  # Try to copy to clipboard
  COPIED=false
  if command -v xclip &> /dev/null; then
    cat "$TW_FILE" | xclip -selection clipboard && COPIED=true
  elif command -v xsel &> /dev/null; then
    cat "$TW_FILE" | xsel --clipboard --input && COPIED=true
  elif command -v pbcopy &> /dev/null; then
    cat "$TW_FILE" | pbcopy && COPIED=true
  elif command -v termux-clipboard-set &> /dev/null; then
    cat "$TW_FILE" | termux-clipboard-set && COPIED=true
  fi

  echo ""
  if [ "$COPIED" = true ]; then
    echo -e "  ${GREEN}✓${NC} THUNDERWIRE.md copied to clipboard."
    echo ""
    echo "  Paste it as:"
    echo "  → ChatGPT: Settings → Custom Instructions → paste"
    echo "  → Gemini:  First message of session → paste"
    echo "  → Any AI:  System prompt field → paste"
  else
    echo -e "  ${YELLOW}  Could not auto-copy. Open this file and copy manually:${NC}"
    echo ""
    echo "  $TW_FILE"
    echo ""
    echo "  Then paste it as:"
    echo "  → ChatGPT: Settings → Custom Instructions → paste"
    echo "  → Gemini:  First message of session → paste"
  fi

  echo ""
  echo "  After pasting, type: \"My niche is [X]. Run setup.\""

fi

echo ""
echo "  ═══════════════════════════════════════════════════════════════"
echo -e "  ${DIM}  Full guide: github.com/tokenarc/thunderwire/blob/main/SETUP.md${NC}"
echo "  ═══════════════════════════════════════════════════════════════"
echo ""
