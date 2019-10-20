# Daniel Hunter
# List of my commonly used aliases and environment variables
# Mostly copied from oh-my-zsh so I can easily work on remote bash shells
# without doing a full install
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
alias pack='echo "Searching only Python files..."; ack --python'
alias tree='echo "(ignoring __pycache__)"; tree -I '__pycache__''
alias ll='ls -lAh'
alias l='ls -lh'
alias python='python3'
alias temp='vcgencmd measure_temp' # for raspi

export EDITOR='vim'

# Used to set cuda visible devices
cudaviz () {
    if [[ "$#" != 1 ]]; then
        echo "Usage: cudaviz 0 [OR] cudaviz 0,1";
        echo "For convenience:"
        echo "echo \$CUDA_VISIBLE_DEVICES"
        echo "$CUDA_VISIBLE_DEVICES"
    else
        export CUDA_VISIBLE_DEVICES="$1"
        echo "echo \$CUDA_VISIBLE_DEVICES"
        echo "$CUDA_VISIBLE_DEVICES"
    fi
}

ggp () { # git grep, search only python files
    git grep "$@" -- '*.py'
}
