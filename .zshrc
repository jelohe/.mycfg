[[ $TMUX = "" ]] && export TERM="xterm-256color"

case $- in *i*)
  if [ -z "$TMUX" ]; then exec tmux; fi;;
esac

DEFAULT_USER="txus"

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

zle -N zle-line-init
zle -N zle-keymap-select

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# ZSH_THEME="gallifrey"
ZSH_THEME="minimal"

# Add wisely, as too many plugins slow down shell startup.
plugins=(vi-mode)

# Remove c-s command in the terminal
stty -ixon

# Aliases
alias -r vs='cd ~/projects/code/platform/apps/ && vagrant up && vagrant ssh'
alias -r p='cd ~/projects/code/platform/apps/payex_web && tmux rename-window payex'
alias -r ps='cd ~/projects/code/platform/apps/payschool && tmux rename-window payschool'
alias -r g='cd ~/projects/code/platform/apps/gateway && tmux rename-window gateway'
alias -r c='cd ~/projects/code/platform/apps/core && tmux rename-window core'
alias -r a='cd ~/projects/code/platform/apps/api && tmux rename-window api'
alias -r db='cd ~/projects/code/platform/infra/data_bags/apps && tmux rename-window data_bags'
alias -r o='cd ~/projects/opp-client && tmux rename-window opp'
alias -r grm='branch=$(git rev-parse --abbrev-ref HEAD) && git checkout master && git pull && git checkout $branch && git rebase master'
alias -r gs='git status'
alias -r gl='git log'
alias -r gcm='git checkout master'
alias -r gpf='git push -f origin $(git rev-parse --abbrev-ref HEAD)'
alias -r gpu='git push -u origin $(git rev-parse --abbrev-ref HEAD)'
alias -r gp='git pull'
alias -r grh='git reset --hard'
alias -r gsa='git stash'
alias -r gsl='git stash list'
alias -r gsp='git stash pop'
alias -r gsd='git stash drop'
alias -r gca='git commit --amend --no-edit'

# Env
export VISUAL=vim
export EDITOR="$VISUAL"
export PT_VM_MEMORY=4096

# Load oh my zsh
source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
