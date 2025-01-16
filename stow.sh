#!/bin/sh

mkdir -p $HOME/.config
mkdir -p $HOME/.local/bin

stow . --target=$HOME/.config
stow zshrc --target=$HOME
stow .local --target=$HOME/.local
