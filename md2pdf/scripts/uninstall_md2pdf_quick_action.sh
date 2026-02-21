#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Deepak Kothule
set -euo pipefail

if [[ "$(uname -s)" != "Darwin" ]]; then
  echo "Error: Finder Quick Action uninstaller is only supported on macOS." >&2
  exit 1
fi

WORKFLOW_NAME="${WORKFLOW_NAME:-Convert Markdown to PDF}"
WORKFLOW_DIR="$HOME/Library/Services/${WORKFLOW_NAME}.workflow"

if [[ -d "$WORKFLOW_DIR" ]]; then
  rm -rf "$WORKFLOW_DIR"
  echo "Removed Quick Action: $WORKFLOW_NAME"
  echo "Deleted: $WORKFLOW_DIR"
else
  echo "Quick Action not found: $WORKFLOW_DIR"
fi

echo
echo "Restart Finder to refresh the context menu:"
echo "  killall Finder"
