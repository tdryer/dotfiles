# From Ubuntu's default bashrc: ###############################################

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# handy ls alias
alias ll='ls -l --classify --human-readable'

alias ip='ip --color'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Custom stuff: ###############################################################

# use coloured bash prompt
color_prompt=yes

# set custom bash prompt with current git branch and number of jobs
# (requires git bash_completion for __git_ps1)
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_STATESEPARATOR=""
PROMPT_COMMAND='hasjobs=$(jobs -p)'
PS1='${hasjobs:+(\j)}$(__git_ps1 "(%s)")\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# if this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# use .pystartup for python repl
export PYTHONSTARTUP=~/.pystartup

# automatically open gphoto camera in file browser
function camera-open() {
    camera=gphoto2://\[$(gphoto2 --auto-detect | grep -Eo usb:[0-9]+,[0-9]+)\]
    echo "Opening camera $camera..."
    xdg-open $camera
}

# prevent accidentally closing shell by requiring ctrl+d twice consecutively to exit
export IGNOREEOF=1

# Tell fzf to use ag to list files.
export FZF_DEFAULT_COMMAND='ag --files-with-matches --nocolor --hidden --ignore .git -g ""'

if [ $TERM = "xterm-kitty" ]; then
    # Override ctrl+l to use kitty escape code to clear the screen while
    # keeping its contents in scrollback buffer, emulating the behaviour of
    # gnome-terminal.
    bind -x '"\C-l": printf "\e[H\e[22J"'

    # Work around remote hosts not having kitty terminfo.
    alias ssh='TERM=xterm-256color ssh'
fi

alias vim='nvim'
