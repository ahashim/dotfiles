# Environment
typeset -U PATH
export AWS_PROFILE="Engineers"
export BUN_INSTALL="$HOME/.bun"
export EDITOR=nvim
export VISUAL=nvim
export FZF_PREVIEW_ADVANCED=1
export FZF_DEFAULT_OPTS="--preview-window='right:33%:nohidden' --preview $HOME/.config/fzf/preview.sh\ {}"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export GPG_TTY=$(tty)
export GOPATH="$HOME/go"
export NODE_OPTIONS="--max-old-space-size=16384"
export NVM_DIR="$HOME/.nvm"
export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH=$HOME/.opencode/bin:$BUN_INSTALL/bin:$PNPM_HOME:$GOPATH/bin:$HOME/.local/bin:$PATH

# Options
setopt COMPLETE_IN_WORD
setopt AUTO_CD
setopt INTERACTIVE_COMMENTS

# History
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt appendhistory histignorealldups sharehistory

# Key bindings
bindkey -v
KEYTIMEOUT=1

# Plugins
source /usr/share/zsh/plugins/zsh-defer/zsh-defer.plugin.zsh
zsh-defer -c 'autoload -Uz compinit && compinit'
source <(fzf --zsh)
zsh-defer source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
zsh-defer source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Aliases
alias c='clear'
alias copy='wl-copy'
alias ff='fastfetch'
alias gist='gh gist create -'
alias ll='eza -al --icons=always'
alias ls='eza -a --icons=always'
alias lt='eza -a --tree --level=1 --icons=always'
alias shutdown='systemctl poweroff'
alias v="$EDITOR"
alias vi="$EDITOR"
alias vim="$EDITOR"

# Functions
u() { cd $(printf '../%.0s' {1..${1:-1}}); }

# Initialize
eval "$(oh-my-posh init zsh -c $HOME/.config/ohmyposh/lambda.omp.json)"
zsh-defer eval "$(zoxide init zsh)"
zsh-defer source "$NVM_DIR/nvm.sh"
zsh-defer source "$NVM_DIR/bash_completion"
zsh-defer source "$BUN_INSTALL/_bun"
ff
