## -------- CORE

# Environment Variables
export ARCHFLAGS="-arch x86_64"
export CARGO="$HOME/.cargo"
export EDITOR='vim'
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export GPG_TTY='2E746699667C1969'
export LANG=en_US.UTF-8
export LOCAL="$HOME/.local"
export PNPM_HOME="$LOCAL/share/pnpm"
export PATH="$PNPM_HOME:$LOCAL/bin:$PATH:$GOROOT/bin:$GOPATH/bin:$CARGO/bin"
export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(command-not-found docker git zsh-autosuggestions zsh-nvm zsh-syntax-highlighting zsh-z)

# Theme
ZSH_THEME="smt"

# Updates
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

# Initialize
source $ZSH/oh-my-zsh.sh


## -------- FUNCTIONS

# Launch a kitty workspace session
function k() {
  session=$@

  if [[ -z $session || ! -d $HOME/Workspace/$session ]]
  then
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

# Traverse `n` directories upwards
# `u 2` == `cd ../..`
function u() {
  cd $(printf "%0.0s../" $(seq 1 $1));
}


## -------- ALIASES

# fortune
alias dinofortune='fortune | xargs -0 dinosay -r | lolcat'

# neovim
alias neovim='nvim'
alias vim='nvim'
alias vi='nvim'

# pnpm
alias npm='pnpm'
alias npx='pnpm dlx'

# ssh
alias ssh='kitty +kitten ssh $@'

# unix
alias du='du -hs * | sort -h'
alias ll='exa -aFlxTL=1 --group-directories-first --icons'
alias tldr='tldr --theme base16'


## -------- INIT
dinofortune
