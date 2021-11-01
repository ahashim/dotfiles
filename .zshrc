## -------- MODIFICATIONS

# Environment Variables
export PATH=$HOME/bin:/usr/local/bin:/usr/local/go/bin:$HOME/go/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR='vim'
export GPG_TTY='9419D26F44E34957'


# Themes
ZSH_THEME="smt"

# Plugins
plugins=(aws autojump command-not-found docker git fasd golang yarn zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Extended history (http://zsh.sourceforge.net/Doc/Release/Options.html)
setopt HIST_IGNORE_DUPS # ignore duplicates in history
setopt HIST_IGNORE_SPACE # ignore spaces in history
setopt INC_APPEND_HISTORY #append into history file
export HISTSIZE=50000 #set history size
export SAVEHIST=10000 #save history after logout
export HISTFILE=~/.zhistory #history file
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S " # add timestamp

# Vi mode
bindkey -v


## -------- FUNCTIONS

# Quickly traverse up a directory path
function u() {
  cd $(printf "%0.0s../" $(seq 1 $1));
}

# Exponential backoff: retries a command upon failure, scaling up the delay between retries.
# Example: "expbackoff my_command --with --some --args --maybe"
# Source: https://gist.github.com/nathforge/62456d9b18e276954f58eb61bf234c17
expbackoff() {
    local MAX_RETRIES=${EXPBACKOFF_MAX_RETRIES:-16} # Max number of retries
    local BASE=${EXPBACKOFF_BASE:-1} # Base value for backoff calculation
    local MAX=${EXPBACKOFF_MAX:-65536} # Max value for backoff calculation (defaults to ~45.5 hours)
    local FAILURES=0
    while ! "$@"; do
        FAILURES=$(( $FAILURES + 1 ))
        if (( $FAILURES > $MAX_RETRIES )); then
            echo "$@" >&2
            echo " * Failed, max retries exceeded" >&2
            return 1
        else
            local SECONDS=$(( $BASE * 2 ** ($FAILURES - 1) ))
            if (( $SECONDS > $MAX )); then
                SECONDS=$MAX
            fi
            echo "$@" >&2
            echo " * $FAILURES failure(s), retrying in $SECONDS second(s)" >&2
            sleep $SECONDS
            echo
        fi
    done
}


## -------- ALIASES

# Unix
alias du='du -hs * | sort -h'
alias ll='ls -al'
alias tldr='tldr --theme base16'

# Neovim
alias nvim='~/.local/bin/nvim.appimage'
alias neovim=nvim
alias vim=nvim
alias vi=vim

# Wireguard
alias cloak='sudo wg-quick up wg0'
alias reveal='sudo wg-quick down wg0'


## -------- INITIALIZE
neofetch
