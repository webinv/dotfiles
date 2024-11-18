# Path
export PATH="/opt/homebrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

# Brew
if which brew &>/dev/null; then
    eval "$(brew shellenv)"
fi

shopt -s checkwinsize
shopt -s histappend
shopt -s nocasematch

export EDITOR=vim
export VISUAL=vim
export HISTCONTROL=ignoreboth
export HISTFILE=~/.bash_history
export HISTFILESIZE=10000
export HISTSIZE=10000
export LESS='-iMFXSx4R'
export PAGER=less
export SP_ENCODING=XML

export LANG=pl_PL.UTF-8;
export MM_CHARSET=UTF-8;

alias gpg=gpg2
alias grep='LC_ALL=C grep --color=auto'
alias egrep='egrep --color=auto'
alias mtr='mtr --curses'

alias la='ls -lhAGF'
alias ll='ls -ahlFG'
alias ls='ls -lhFG'

export LSCOLORS="exfxcxdxbxegedabagacad"

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

get_git_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo " (${ref#refs/heads/})"
}

export PS1="\\n\[\e[0;37m\]\t\[\e[m\] \[\e[0;34m\]\\w\[\e[m\]\[\e[0;31m\]\$( get_git_branch )\[\e[m\]\\n\[\e[0;32m\]~\[\e[m\] "

if [[ -e "$HOME/.bash_aliases" ]]; then
    source "$HOME/.bash_aliases"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Env
export COMPOSER_MEMORY_LIMIT=-1

# macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Add keys
    ssh-add --apple-use-keychain --apple-load-keychain 2>/dev/null;

    # VSCode
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

# Java Home
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
#JAVA_HOME=$(/usr/libexec/java_home)

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# Kubectl bash autocomplete
# kubectl completion bash > $HOME/.kubectl_bash_completion
if [ -f $HOME/.kubectl_bash_completion ]; then
    source $HOME/.kubectl_bash_completion
fi

# DIR Env
if which direnv &>/dev/null; then
  eval "$(direnv hook bash)"
fi

# https://docs.brew.sh/Shell-Completion
if which brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi

  if [ -f $HOMEBREW_PREFIX/share/google-cloud-sdk ]; then
    source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.bash.inc"
    source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.bash.inc"
  fi

  # PHP
  export PATH_PHP84="$HOMEBREW_PREFIX/opt/php@8.4/bin"
  export PATH_PHP83="$HOMEBREW_PREFIX/opt/php@8.3/bin"
  export PATH_PHP82="$HOMEBREW_PREFIX/opt/php@8.2/bin"
  export PATH_PHP81="$HOMEBREW_PREFIX/opt/php@8.1/bin"
  export PATH_PHP80="$HOMEBREW_PREFIX/opt/php@8.0/bin"
  export PATH_PHP74="$HOMEBREW_PREFIX/opt/php@7.4/bin"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" --no-use
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"


# Local
if [ -f $HOME/.bashrc_local.sh ]; then
    source $HOME/.bashrc_local.sh
fi