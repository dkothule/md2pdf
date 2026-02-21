#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Deepak Kothule
# Wrapper so pandoc can run the mermaid filter as a single executable.
# Uses PYTHON if set (e.g. path to venv python), else python3.
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
exec "${PYTHON:-python3}" "$SCRIPT_DIR/pandoc_mermaid_filter.py"
