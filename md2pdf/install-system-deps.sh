#!/usr/bin/env bash
# SPDX-License-Identifier: MIT
# Copyright (c) 2026 Deepak Kothule
set -euo pipefail

OS="$(uname -s)"

install_macos() {
  if ! command -v brew >/dev/null 2>&1; then
    echo "Homebrew is required on macOS. Install from https://brew.sh and retry."
    exit 1
  fi

  brew update
  brew install pandoc librsvg node python

  if ! command -v xelatex >/dev/null 2>&1; then
    echo "Installing BasicTeX for xelatex..."
    brew install --cask basictex
    echo "BasicTeX installed. You may need to restart your shell before retrying."
  fi
}

install_debian_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y \
    pandoc \
    librsvg2-bin \
    nodejs \
    npm \
    python3 \
    python3-venv \
    python3-pip \
    texlive-xetex
}

if [[ "$OS" == "Darwin" ]]; then
  install_macos
elif [[ "$OS" == "Linux" ]]; then
  if [[ -f /etc/debian_version ]]; then
    install_debian_ubuntu
  else
    echo "Unsupported Linux distro by this script."
    echo "Please install: pandoc, xelatex, librsvg (rsvg-convert), node/npm, python3+venv."
    exit 1
  fi
else
  echo "Unsupported OS: $OS"
  exit 1
fi

echo "System dependencies installed."
