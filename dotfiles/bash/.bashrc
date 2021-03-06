# Copyleft: Kirill Pavlov kirill.pavlov@phystech.edu

[ -d "$HOME/bin" ] && PATH="$HOME/bin:$PATH"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
PATH=/usr/local/bin:$PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
# The next line updates PATH for the Google Cloud SDK.
[[ -s "$HOME/src/google-cloud-sdk/path.bash.inc" ]] && source $HOME/src/google-cloud-sdk/path.bash.inc
# The next line enables shell command completion for gcloud.
[[ -s "$HOME/src/google-cloud-sdk/completion.bash.inc" ]] && source $HOME/src/google-cloud-sdk/completion.bash.inc

# login picture
# cat $HOME/.home/dotfiles/bash/cowsay/pony.cow

export DEBFULLNAME="__BASH_DEBFULLNAME__"
export DEBEMAIL="__BASH_DEBEMAIL__"
export USERNAME="__BASH_USERNAME__"
export EMAIL="__BASH_EMAIL__"
export HISTTIMEFORMAT="%h/%d - %H:%M:%S "
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
export EDITOR=$(which vim)
export GOPATH=$HOME/go

export ORACLE_VERSION="12.1"
export ORACLE_HOME="/usr/lib/oracle/$ORACLE_VERSION/client64"
export PATH=$PATH:"$ORACLE_HOME/bin"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"$ORACLE_HOME/lib"

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
# shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes
if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# Bash login
if [ -f ~/.bash_login ]; then
    . ~/.bash_login
fi

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# Completion
source $HOME/.home/dotfiles/bash/completion/git-completion.bash
source $HOME/.home/dotfiles/bash/completion/git-flow-completion.bash
source $HOME/.home/dotfiles/bash/completion/gem-completion.bash
source $HOME/.home/dotfiles/bash/completion/vagrant-completion.bash
source $HOME/.home/dotfiles/bash/completion/knife-completion.bash
source $HOME/.home/dotfiles/bash/completion/rabbitmq-completion.bash
source $HOME/.home/dotfiles/bash/completion/gpg-completion.bash
source $HOME/.home/dotfiles/bash/completion/django-completion.bash
