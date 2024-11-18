Dot files
================

Common settings

* BASH settings
* VIM settings
* SSH config
* GIT settings
* [Oh My Posh](https://ohmyposh.dev)


Installation
------------

**Usage**

    wget -O - -q --no-check-certificate https://raw.github.com/webinv/dotfiles/master/install.sh | bash -s -- -h

Options

    -h | --help
    show this help

    -n | --no-backup
    no backup existing files
    
**Default instalation**

    wget -O - -q --no-check-certificate https://raw.github.com/webinv/dotfiles/master/install.sh | bash
    
**Instalation without backup**

    wget -O - -q --no-check-certificate https://raw.github.com/webinv/dotfiles/master/install.sh | bash -s -- -n

**Oh My Posh**

* `brew install --cask font-sauce-code-pro-nerd-font` Install [Nerd Font](https://www.nerdfonts.com) and update terminal font
* `brew install jandedobbeleer/oh-my-posh/oh-my-posh` [Installation](https://ohmyposh.dev/docs/installation/macos)
* For ZSH add to `.zshrc_local.sh` line `eval "$(oh-my-posh init zsh --config $HOME/.oh-my-posh/personal_minimal.omp.json)"`
* For BASH add to `.bashrc_local.sh` line  `eval "$(oh-my-posh init bash --config $HOME/.oh-my-posh/personal_minimal.omp.json)"`
* [Oh My Posh Documentation](https://ohmyposh.dev/docs)