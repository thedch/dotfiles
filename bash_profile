alias gst='git status'
alias gs='gst'
alias ga='git add'
alias gaa='git add --all'
alias gau='git add --update'
alias gd='git diff'
alias gf='git fetch'
alias gdca='git diff --cached'
alias gcv='git commit --verbose'
alias ..='cd ..'
alias type='type -a'
alias ll='ls -lAh'
alias l='ls -lh'

export EDITOR='vim'

ggp () { # git grep, search only python files
    git grep "$@" -- '*.py'
}

export PATH="${HOME}/.local/bin:${PATH}"
