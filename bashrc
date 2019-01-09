# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
debian_chroot=$(cat /etc/debian_chroot)
fi

PS1='${debian_chroot:+($debian_chroot)}\e[1;36m[\u@\h \d \A] \e[1;32m\w\e[0m\n$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
;;
*)
;;
esac


# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
eval "`dircolors -b`"
alias ls='ls --color=auto'
#alias dir='ls --color=auto --format=vertical'
#alias vdir='ls --color=auto --format=long'
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
. /etc/bash_completion
fi

#
# alias
#

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias cls='clear'
alias dir='ls --color=auto -gGhF'

# programming
alias vi='vim'
alias py='python'
alias py3='python3'
alias pip='pip3'

# git
alias ch='git checkout'
alias d='git pull'
alias u='git push origin'
alias m='git merge'
alias M='git merge master'

alias add='git add --all'
alias com='git commit -m'

function s() {
  py manage.py runserver $1
}

function s3() {
  py3 manage.py runserver $1
}

function f() {
  find $1 -name $2
}

#ls colors (dircolors)
dir="01;33"
files="00"
exe="00;31"
Ccode="01;34"
Jcode="01;34"
Gcode="00;36"
tmp="01;30"
LS_COLORS="no=00:fi=$files:di=$dir:*.c=$Ccode*.C=$Ccode:*.cpp=$Ccode:*.cc=$Ccode:*.h=$Ccode:*.l=$Gcode:*.y=$Gcode:*.java=$Jcode:*.class=$tmp:*~=$tmp:*.exe=$exe:ex=$exe:*.o=$tmp";
export LS_COLORS

export LANG=zh_TW.utf-8
alias big5='LANG=zh_TW.big5'
alias unicode='LANG=zh_TW.utf-8'

PATH=$PATH:/usr/local/cuda-7.0/bin
PATH=$PATH:/home/OckhamsRazor/.local/bin
LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64:$HOME/lib


