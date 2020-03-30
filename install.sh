# Run this first

source profile


# bash

ln -sf ~/.dotfiles/profile          ~/.profile
ln -sf ~/.dotfiles/bash_aliases     ~/.bash_aliases
ln -sf ~/.dotfiles/bashrc           ~/.bashrc
ln -sf ~/.dotfiles/inputrc          ~/.inputrc      # allow Vim mode in bash


# vim

[ -d "$XDG_DATA_HOME"/vim/ ] || mkdir -p "$XDG_DATA_HOME"/vim/{undo,swap,backup}

ln -sf ~/.dotfiles/vimrc            ~/.config/vim/vimrc
ln -sf ~/.dotfiles/fun.vim          ~/.config/vim/fun.vim


# done

echo "all done :)"
