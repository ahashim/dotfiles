## -------- CORE

# Environment Variables
export BUN_INSTALL="$HOME/.bun"
export CARGO="$HOME/.cargo"
export EDITOR='vim'
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
export GPG_TTY='2E746699667C1969'
export LANG=en_US.UTF-8
export LOCAL="$HOME/.local"
export PNPM_HOME="$LOCAL/share/pnpm"
export PATH="$PNPM_HOME:$LOCAL/bin:$BUN_INSTALL/bin:$PATH:$GOROOT/bin:$GOPATH/bin:$CARGO/bin"
export ZSH="$HOME/.oh-my-zsh"
export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST
export ZSH_OS="$HOME/.zsh/os"

# Plugins
plugins=(command-not-found docker git zsh-autosuggestions zsh-nvm zsh-syntax-highlighting z)

# Theme
ZSH_THEME="smt"

# Updates
zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 1

# Source
source "$BUN_INSTALL/_bun"
source "$ZSH/oh-my-zsh.sh"


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

# system update
function up() {
  sudo apt update -yqq
  sudo apt dist-upgrade -yqq
  sudo apt autoremove -yqq
}


## -------- ALIASES

# fortune
alias dinofortune='fortune | xargs -0 dinosay -r | lolcat'

# neovim
alias neovim='nvim'
alias vim='nvim'
alias vi='nvim'

# ssh
alias ssh='kitty +kitten ssh $@'

# unix
alias du='du -hs * | sort -h'
alias ll='exa -aFlxTL=1 --group-directories-first --icons'
alias tldr='tldr --theme base16'


## -------- OS OVERRIDES

if command -v apt > /dev/null; then
  source $ZSH_OS/debian.zsh
elif [[ `uname` == "Darwin" ]]; then
  source $ZSH_OS/mac.zsh
else
  echo 'Unknown OS!'
fi


## -------- INIT
dinofortune
