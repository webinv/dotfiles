# Path
export PATH="/opt/homebrew/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH"

# Brew
if which brew &>/dev/null; then
    eval "$(brew shellenv)"
fi

# macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    # Add identities to the agent using any passphrase stored in the user's keychain.
    #ssh-add --apple-load-keychain -q 2>/dev/null;

    # VSCode
    export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
fi

# Env
export COMPOSER_MEMORY_LIMIT=-1

# Java Home
#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)

# Composer
export PATH="$PATH:$HOME/.composer/vendor/bin"

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
if which brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
  autoload -Uz compinit
  compinit

  export PATH="$PATH:$HOMEBREW_PREFIX/opt/python@3.9/Frameworks/Python.framework/Versions/Current/bin"
  export PATH_PHP84="$HOMEBREW_PREFIX/opt/php@8.4/bin"
  export PATH_PHP83="$HOMEBREW_PREFIX/opt/php@8.3/bin"
  export PATH_PHP82="$HOMEBREW_PREFIX/opt/php@8.2/bin"
  export PATH_PHP81="$HOMEBREW_PREFIX/opt/php@8.1/bin"
  export PATH_PHP80="$HOMEBREW_PREFIX/opt/php@8.0/bin"
  export PATH_PHP74="$HOMEBREW_PREFIX/opt/php@7.4/bin"

  if [ -f $HOMEBREW_PREFIX/share/google-cloud-sdk ]; then
    source "$HOMEBREW_PREFIX/share/google-cloud-sdk/path.zsh.inc"
    source "$HOMEBREW_PREFIX/share/google-cloud-sdk/completion.zsh.inc"
  fi
fi

# User configuration
export LANG=en_US.UTF-8
export EDITOR='vim'
export VISUAL=vim
export LESS='-iMFXSx4R'
export PAGER=less

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

alias gpg=gpg2
alias grep='LC_ALL=C grep --color=auto'
alias egrep='egrep --color=auto'
alias la='ls -lhAGF'
alias ll='ls -ahlFG'
alias ls='ls -lhFG'

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
zstyle ':vcs_info:git:*' formats '%F{red}(%b)%f'
zstyle ':vcs_info:*' enable git

export PROMPT=$'\n%F{245}%*%f %F{blue}%~%f $vcs_info_msg_0_ \n%(?.%F{green}~%f.%F{red}~%f) '

export LSCOLORS="exfxcxdxbxegedabagacad"

# Direnv
if which direnv &>/dev/null; then
  eval "$(direnv hook zsh)"
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && . "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" --no-use

# Kubectl bash autocomplete
# kubectl completion zsh > $HOME/.kubectl_zsh_completion
if [ -f $HOME/.kubectl_zsh_completion ]; then
    source $HOME/.kubectl_zsh_completion
fi

# Aliases
if [ -f $HOME/.bash_aliases ]; then
    source $HOME/.bash_aliases
fi

# Local
if [ -f $HOME/.zshrc_local.sh ]; then
    source $HOME/.zshrc_local.sh
fi