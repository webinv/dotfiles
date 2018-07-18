Dot files
================

Common settings

* BASH settings
* VIM settings
* SSH config
* GIT settings


Installation
------------

**Usage**

    wget -O - -q --no-check-certificate https://raw.github.com/dot-files/bash/master/bin/install.sh | bash -s -- -h

Options

    -h | --help
    show this help

    -n | --no-backup
    no backup existing files
    
**Default instalation**

    wget -O - -q --no-check-certificate https://raw.github.com/dot-files/bash/master/bin/install | bash
    
**Instalation without backup**

    wget -O - -q --no-check-certificate https://raw.github.com/dot-files/bash/master/bin/install | bash -s -- -n
