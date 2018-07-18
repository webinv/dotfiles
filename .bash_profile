if [[ -e "$HOME/.bashrc" ]]
then
    source "$HOME/.bashrc"
fi

if [[ -e "$HOME/.bash_profile-local" ]]
then
    source "$HOME/.bash_profile-local"
fi