#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Deepak Kothule
# Simple standalone utility for local use from this repo checkout.
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

exec "$PROJECT_ROOT/bin/md2pdf" "$@"
