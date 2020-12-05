#!/bin/bash

mkdir /home/nick/Documents/git
sleep 2
mkdir /home/nick/Documnets/git/dotfiles
sleep 2
cd /home/nick/Documents/git/dotfiles
echo "Clone Linux-Dotfiles from Github"
git clone https://github.com/crowsnesttech/linux-dotfiles.git

echo "removing old files"
rm /home/nick/.oh-my-zsh
rm /home/nick/.vimrc
rm /home/nick/.zshrc
echo "creating symlinks"
sleep 2

ln -s /home/nick/Documents/git/linux-dotfiles/.oh-my-zsh ~/
ln -s /home/nick/Documents/git/linux-dotfiles/.vimrc ~/
ln -s /home/nick/Documents/git/linux-dotfiles/.zshrc ~/

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
