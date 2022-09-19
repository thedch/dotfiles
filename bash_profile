
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/daniel/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/daniel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/daniel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/daniel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

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
alias temp='vcgencmd measure_temp' # for raspi

export EDITOR='vim'

ggp () { # git grep, search only python files
    git grep "$@" -- '*.py'
}
