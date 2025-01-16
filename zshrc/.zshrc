# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not there
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

# Source/load zinit
source "${ZINIT_HOME}/zinit.zsh"

export STARSHIP_CONFIG=~/.config/starship/starship.toml

#####################
# PROMPT            # Example - https://gist.github.com/numToStr/53a0bf7e8ac9c5aa98d52c112980fb0f
#####################
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit light starship/starship # zinit load starship/starship

# asdf - tool version manager (node, py, lua, elixir)
zinit ice ver"f00f759" src'asdf.sh' mv'completions/_asdf -> .'
zinit light asdf-vm/asdf

# Add zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Load completions
autoload -U compinit && compinit

# Keybindings
bindkey -r '^o' # Unbinding the key
bindkey -r '^t' # Unbinding the key

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^f' fzf-file-widget 

# bindkey "^/" undo # Ctrl+/ to undo
bindkey "^[r" redo # Alt-r to redo

export KEYTIMEOUT=1 # Faster mode switching insert/normal

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space # Not adding command to history if it starts with space. Usefull for sensetive info
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color -h $realpath'
# zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --icons -a $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color -h $realpath'

# Aliases (move to different file)
source $HOME/aliases.zsh

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# export VISUAL=nvim
# export EDITOR=nvim
