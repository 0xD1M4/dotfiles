#!/bin/sh

mkdir -p $HOME/.config
mkdir -p $HOME/.local/bin
mkdir -p $HOME/.claude
mkdir -p $HOME/.codex

stow . --target=$HOME/.config
stow zshrc --target=$HOME
stow .local --target=$HOME/.local
stow .claude --target=$HOME/.claude
stow .codex --target=$HOME/.codex
