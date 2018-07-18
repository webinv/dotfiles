#!/usr/bin/env bash

function usage 
{
    echo "Dot files install"
    echo "Usage"
    echo ""
    echo "    $0 [options]"
    echo ""
    echo "Options"
    echo ""
    echo "    -h | --help"
    echo "    show this help"
    echo ""
    echo "    -n | --no-backup"
    echo "    no backup existing files"
    echo ""
    exit 1
}

function error
{
    echo 1>&2 "Failed"
    exit 1
}

BASE_URL=https://raw.github.com/webinv/dotfiles/master
NO_BACKUP=0

while :
do
    case "$1" in
      -n | --no-backup)
          NO_BACKUP=1
          shift 
      ;;

      -h | --help)
          usage;
      ;;
      
      --)
          shift
          break;
      ;;
      
      -*)
          echo "Error: Unknown option: $1" >&2
          usage;
          exit 1
      ;;
      
      *)
          break
      ;;
    esac
done

# SSH
mkdir -p $HOME/.ssh
chmod 755 $HOME/.ssh

BACKUP_SUFFIX=.backup_$( date '+%Y-%m-%d-%H-%M-%S' )
for dotfile in .bash_aliases .bash_profile .bashrc .bashrc_local .gitconfig .gitignore_global .profile .vimrc .ssh/config .ssh/authorized_keys
do
    if [[ -e $HOME/$dotfile || -h $HOME/$dotfile ]]; then
        if [ $NO_BACKUP == 0 ]; then
            cp "$HOME/$dotfile" $HOME/${dotfile}${BACKUP_SUFFIX}
        fi
    fi
    wget --no-check-certificate -q -O $HOME/$dotfile ${BASE_URL}/${dotfile}
done

chmod 600 $HOME/.ssh/authorized_keys

echo ""
echo "Done."
echo ""