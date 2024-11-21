# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -e

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}

# -----------------
# Zim configuration
# -----------------

# Use degit instead of git as the default tool to install and update modules.
#zstyle ':zim:zmodule' use 'degit'

# --------------------
# Module configuration
# --------------------

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
#zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Disable automatic widget re-binding on each precmd. This can be set when
# zsh-users/zsh-autosuggestions is the last module in your ~/.zimrc.
ZSH_AUTOSUGGEST_MANUAL_REBIND=1

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'

# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

zmodload -F zsh/terminfo +p:terminfo
# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
for key ('^[[A' '^P' ${terminfo[kcuu1]}) bindkey ${key} history-substring-search-up
for key ('^[[B' '^N' ${terminfo[kcud1]}) bindkey ${key} history-substring-search-down
for key ('k') bindkey -M vicmd ${key} history-substring-search-up
for key ('j') bindkey -M vicmd ${key} history-substring-search-down
unset key
# }}} End configuration added by Zim install

## -------- CORE

# Environment Variables
export AWS_PROFILE=Engineers
export BUN_INSTALL="$HOME/.bun"
export EDITOR='vim'
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export GPG_TTY='2E746699667C1969'
export LANG=en_US.UTF-8
export LOCAL="$HOME/.local"
export PLATFORM_TOOLS="$LOCAL/bin/platform-tools"
export NVM_DIR="$HOME/.nvm"
export PNPM_HOME="$LOCAL/share/pnpm"
export ZSH_HOME="$HOME/.zsh"

# Completion
zstyle ':zim:completion' dumpfile "$ZSH_HOME/completion/zcompdump"


## -------- SOURCES

# bun
source "$BUN_INSTALL/_bun"

# k8s
source <(kubectl completion zsh)

# nvm
source "$NVM_DIR/nvm.sh"
source "$NVM_DIR/bash_completion"


## -------- PATH
export PATH="$GOROOT/bin:$GOPATH/bin:$LOCAL/bin:$PNPM_HOME:$BUN_INSTALL/bin:$PLATFORM_TOOLS:$PATH:$CARGO/bin"


## -------- FUNCTIONS

# Launch a kitty workspace session
function k() {
  session=$@

  if [[ -z $session || ! -d $HOME/Workspace/$session ]]; then
    # session is null or workspace does not exist
    echo "Invalid selection. Please choose an existing session:\n"
    ls $HOME/Workspace
  else
    # launch a detached kitty session
    kitty \
      --directory $HOME/Workspace/$session \
      --session $HOME/.config/kitty/sessions/$session.conf \
      --title $session \
      --detach

    # exit current terminal to switch
    exit
  fi
}

# Search & replace a string in all files recursively from within the current
# directory.
# `s oldString newString`
function s() {
  find . \( -type d -name .git -prune \) -o -type f -print0 \
    | xargs -0 sed -i "s/$1/$2/g"
  echo "Replaced all occurrences of '$1' with '$2'"
}

# Traverse `n` directories upwards
# `u 2` == `cd ../..`
function u() {
  cd $(printf "%0.0s../" $(seq 1 $1));
}


## -------- ALIASES

# xclip
alias clip='xclip -selection clipboard'

# fortune
alias dinofortune='fortune | xargs -0 dinosay -r | lolcat'

# gist
alias gist='gh gist create -'

# images
alias icat="kitty +kitten icat"

# neovim
alias neovim='nvim'
alias vim='nvim'
alias vi='nvim'

# ssh
alias ssh='kitty +kitten ssh $@'

# unix
alias du='du -hs * | sort -h'
alias ll='eza -al --no-user'


## -------- OS OVERRIDES

if [[ `uname` == 'Linux' ]]; then
  source $ZSH_HOME/os/linux.zsh
elif [[ `uname` == 'Darwin' ]]; then
  source $ZSH_HOME/os/mac.zsh
else
  echo 'Unknown OS!'
fi


## -------- INIT

# daily wisdom
dinofortune
