#!/bin/bash
# Agent context file setup script
# Run from the repo root: ./setup-agents.sh
#
# Creates CLAUDE.md and GEMINI.md pointer files that direct those tools
# to read AGENTS.md. AGENTS.md is the shared standard read by Codex, Copilot,
# Cursor, Windsurf, Amp, Devin, and others.
#
# Customize the DIRS list below to match your project's component directories.

set -e

# Add your component directories here
DIRS="."
# Example for a monorepo:
# DIRS=". frontend backend api worker"

for dir in $DIRS; do
  if [ -f "$dir/AGENTS.md" ]; then
    echo "Creating pointer files in $dir/"
    echo "Read and follow all instructions in ./AGENTS.md" > "$dir/CLAUDE.md"
    echo "Read and follow all instructions in ./AGENTS.md" > "$dir/GEMINI.md"
    echo "  done"
  else
    echo "WARNING: $dir/AGENTS.md not found, skipping"
  fi
done

echo ""
echo "Agent context files configured."
echo "  AGENTS.md  — Codex CLI, GitHub Copilot, Cursor, Windsurf, Amp, Devin"
echo "  CLAUDE.md  — Claude Code (pointer to AGENTS.md)"
echo "  GEMINI.md  — Gemini CLI (pointer to AGENTS.md)"
