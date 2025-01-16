#!/usr/bin/env bash
#
# bootstrap installs things.

# cd "$(dirname "$0")/.."
# DOTFILES_ROOT=$(pwd -P)

# set -e

info () {
  printf "\r  [\033[00;34mINFO\033[0m] $1\n"
}

user () {
  printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success () {
  printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail () {
  printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
  echo ''
  exit 1
}

ask_for_char () {
    echo
    user "$1"
    read -r -n 1 -d '' -p "  > "
    if [[ "$REPLY" == $'\r' || "$REPLY" == $'\n' ]]
    then
       return 0 # ENTER/RETURN pressed
    else
       return 1 # Any other key pressed
    fi
}
