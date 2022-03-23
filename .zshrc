## -------- MODIFICATIONS

# Environment Variables
export PATH=$HOME/bin:/usr/local/bin:/usr/local/go/bin:$HOME/go/bin:$HOME/.cargo/bin:$PATH
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export EDITOR='vim'
export GPG_TTY='9419D26F44E34957'


# Themes
ZSH_THEME="smt"

# Plugins
plugins=(aws command-not-found docker git fasd golang yarn zsh-nvm zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

# Extended history (http://zsh.sourceforge.net/Doc/Release/Options.html)
setopt HIST_IGNORE_DUPS # ignore duplicates in history
setopt HIST_IGNORE_SPACE # ignore spaces in history
setopt INC_APPEND_HISTORY # append into history file
export HISTSIZE=50000 # set history file size
export SAVEHIST=10000 # save history after logout
export HISTFILE=~/.zhistory # history file location
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# Vi mode
bindkey -v


## -------- FUNCTIONS

# Quickly traverse up "n" # of directories
# usage: u 4
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

# TMux
alias a='tmux a #';

# Wireguard
alias cloak='sudo wg-quick up wg0'
alias reveal='sudo wg-quick down wg0'


## -------- INITIALIZE
neofetch

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
