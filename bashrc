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

if [ -f ~/.machine_specific ]; then
    source ~/.machine_specific
fi

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

export PS1="\u@\h:\w $ "

# Case insensitive tab completion
bind "set completion-ignore-case on"
bind "set show-all-if-ambiguous on"

stty -ixon # ctrl-S usually disables terminal (turns off control flow). This disable the disabling.
