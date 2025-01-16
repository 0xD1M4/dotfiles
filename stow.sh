#!/bin/sh

stow . --target=$HOME/.config
stow zshrc --target=$HOME
stow .local --target=$HOME/.local
