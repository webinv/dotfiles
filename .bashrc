shopt -s checkwinsize
shopt -s histappend
shopt -s nocasematch

export EDITOR=vim
export VISUAL=vim
export SVN_EDITOR=vim
export HISTCONTROL=ignoreboth
export HISTFILE=~/.bash_history
export HISTFILESIZE=10000
export HISTSIZE=10000
export LESS='-iMFXSx4R'
export PAGER=less
export PATH="$HOME/bin:/opt/local/bin:/opt/local/sbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"
export SP_ENCODING=XML

export LANG=pl_PL.UTF-8;
export MM_CHARSET=UTF-8;

alias gpg=gpg2
alias grep='LC_ALL=C grep --color=auto'
alias egrep='egrep --color=auto'
alias mtr='mtr --curses'

if [[ "$OSTYPE" =~ "linux-gnu" ]]; then
    alias df='df -x tmpfs -x usbfs'
    alias la='ls -lhAF --color=auto'
    alias ll='ls -ahlF --color=auto'
    alias ls='ls -lhF --color=auto'

    export LS_COLORS="di=1;34:ln=35:so=1;31:pi=1;33:ex=1;32:bd=1;34;46:cd=1;34;43:su=0;41:sg=0;46:tw=0;42:ow=0;43"
elif [[ "$OSTYPE" =~ "darwin" || "$OSTYPE" =~ "freebsd" ]]; then
    alias la='ls -lhAGF'
    alias ll='ls -ahlFG'
    alias ls='ls -lhFG'

    export LSCOLORS="ExfxBxDxCxEgEdxbxgxcxd"
fi

which htop >/dev/null 2>&1 && alias top="htop"

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion
  elif [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    source /opt/local/etc/profile.d/bash_completion.sh
  elif [ -f /usr/local/share/bash-completion/bash_completion.sh ]; then
    source /usr/local/share/bash-completion/bash_completion.sh
  fi
fi

get_git_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo " git:${ref#refs/heads/}"
}

USER_COLOR="0;32"
if [[ $UID == 0 ]]; then
    USER_COLOR="0;31"
fi

HOST_COLOR="0;36"
if [[ $OSTYPE =~ solaris ]]; then
    HOST_COLOR="0;34"
fi

if [[ "$HOST_COLOR" == "$USER_COLOR" ]]; then
    HOST_COLOR=''
else
    HOST_COLOR="\\[\033[${HOST_COLOR}m\\]"
fi

export PS1="\\n\[\e[0;37m\]\t\[\e[m\] \\[\033[${USER_COLOR}m\\]\u@${HOST_COLOR}\H\\[\033[0;36m\\]\$( get_git_branch ) \\[\033[0;35m\]\\w\\[\033[0m\\]\\n\\\$ "
export PS2="-\\\$ "

unset USER_COLOR
unset HOST_COLOR

if [[ -e "$HOME/.bash_aliases" ]]; then
    source "$HOME/.bash_aliases"
fi

if [[ -e "$HOME/.bash_aliases_macosx" && "$OSTYPE" =~ "darwin" ]]; then
    source "$HOME/.bash_aliases_macosx"
fi

if [[ -e "$HOME/.bashrc_local" ]]; then
    source "$HOME/.bashrc_local"
fi

if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

