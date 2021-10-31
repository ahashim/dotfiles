## -------- MODIFICATIONS

# Environment Variables
export PATH=$HOME/bin:/usr/local/bin:/usr/local/go/bin:$HOME/go/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR='vim'


# Themes
ZSH_THEME="smt"

# Plugins
plugins=(aws autojump command-not-found docker git golang yarn zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Extended history (http://zsh.sourceforge.net/Doc/Release/Options.html)
setopt HIST_IGNORE_DUPS # ignore duplicates in history
setopt HIST_IGNORE_SPACE # ignore spaces in history
setopt INC_APPEND_HISTORY #append into history file
export HISTSIZE=50000 #set history size
export SAVEHIST=10000 #save history after logout
export HISTFILE=~/.zhistory #history file
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S " # add timestamp


## -------- FUNCTIONS

# Quickly traverse up a directory path
function u() {
  cd $(printf "%0.0s../" $(seq 1 $1));
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
