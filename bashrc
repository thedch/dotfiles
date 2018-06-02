# .bashrc file by Daniel Hunter, copied from all across the internet.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Load a dedicated bash alias file
if [ -f ~/.bash_aliases ]; then
    source ~/.bash_aliases
fi

# set default editor to be Vim
export EDITOR='vim'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Case insensitive tab completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"
