# Environment
export EDITOR=nvim
export VISUAL=nvim
export FZF_PREVIEW_ADVANCED=1
export FZF_PREVIEW_WINDOW='right:40%:nohidden'
export FZF_DEFAULT_OPTS="--preview-window=${FZF_PREVIEW_WINDOW} --preview $HOME/.config/fzf/preview.sh\ {}"
export FZF_CTRL_T_OPTS="$FZF_DEFAULT_OPTS"
export GPG_TTY=$(tty)
export NODE_OPTIONS="--max-old-space-size=16384"
export NVM_DIR="$HOME/.nvm"
export PATH=$HOME/.opencode/bin:$PATH

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
aws-use() {
  [[ -z "$1" ]] && echo "Usage: aws-use <profile>" && return 1
  export AWS_PROFILE="$1"
  aws sts get-caller-identity --query Arn --output text
}

s() {
  [[ -z "$1" || -z "$2" ]] && echo "Usage: s <old> <new>" && return 1
  local count=$(fd --type f --hidden --exclude .git -0 | xargs -0 grep -l "$1" 2>/dev/null | wc -l)
  fd --type f --hidden --exclude .git -0 | xargs -0 sed -i "s/$1/$2/g"
  echo "Replaced '$1' with '$2' in $count files"
}

u() { cd $(printf '../%.0s' {1..${1:-1}}); }

du() { command du -hs -- "${@:-*}" | sort -h; }

# Initialize
eval "$(oh-my-posh init zsh -c $HOME/.config/ohmyposh/lambda.omp.json)"
zsh-defer eval "$(zoxide init zsh)"
zsh-defer source "$NVM_DIR/nvm.sh"
zsh-defer source "$NVM_DIR/bash_completion"
ff
