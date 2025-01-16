#!/usr/bin/env bash

source bootstrap.sh

# -- SETTING VARS --

user "Enter work username:"
read  -p "  > " -r WORK_NAME

echo 
user "Enter work email:"
read  -p "  > " -r WORK_EMAIL

echo 
user "Enter personal username:"
read  -p "  > " -r PERSONAL_NAME

echo 
user "Enter personal email:"
read  -p "  > " -r PERSONAL_EMAIL


# -- GIT --

echo
info "Setting up ~/.gitconfig"

echo "[http]
  postBuffer = 262144000
  # roughly 250 MB

#[commit]
  #gpgsign = true
  # see GPG config in Tools section

[apply]
  whitespace = nowarn

[init]
  defaultBranch = main

[push]
  autoSetupRemote = true


[pull]
  rebase = true

# https://git-scm.com/docs/merge-options
[merge]
  ff = no
  commit = no

# -- UI --

[pager]
  status = false
  branch = false

[color]
  diff = true
  status = true
  branch = true
  interactive = true
  ui = true

# https://github.com/so-fancy/diff-so-fancy#improved-colors-for-the-highlighted-bits
[color \"diff\"]
  meta = 11
  frag = magenta bold
  commit = yellow bold
  old = red bold
  new = green bold
  whitespace = red reverse

[color \"diff-highlight\"]
  oldNormal = red bold
  oldHighlight = red bold 52
  newNormal = green bold
  newHighlight = green bold 22

[includeIf \"gitdir/i:~/personal/\"]
  path = ~/personal/.gitconfig

[includeIf \"gitdir/i:~/work/\"]
  path = ~/work/.gitconfig

" > $HOME/.gitconfig


info "Setting up ~/work/.gitconfig"
mkdir -p $HOME/work &> /dev/null
git init $HOME/work &> /dev/null

echo "*" > $HOME/work/.gitignore
echo "[user]
  name = $WORK_NAME
  email = $WORK_EMAIL

[url \"git@github.com-work\"]
  insteadOf = git@github.com
" > $HOME/work/.gitconfig


info "Setting up ~/personal/.gitconfig"
mkdir -p $HOME/personal &> /dev/null
git init $HOME/personal &> /dev/null

echo "*" > $HOME/personal/.gitignore
echo "[user]
  name = $PERSONAL_NAME
  email = $PERSONAL_EMAIL

[url \"git@github.com-personal\"]
  insteadOf = git@github.com
" > $HOME/personal/.gitconfig


# -- SSH --

info "Appending ~/.ssh/config with git info"

mkdir -p $HOME/.ssh &> /dev/null
echo "
# personal
Host github.com-personal
  HostName github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentitiesOnly yes
  IdentityFile ~/.ssh/id_ed25519_gh_personal

# work
Host github.com-work
  HostName github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentitiesOnly yes
  IdentityFile ~/.ssh/id_ed25519_gh_work

" >> $HOME/.ssh/config

