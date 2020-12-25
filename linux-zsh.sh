#!/bin/bash

sudo apt update
sudo apt install zsh -y 

mkdir -p /home/nick/Documents/git/dotfiles/linux-dotfiles
sleep 1

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Clone Linux-Dotfiles from Github"
echo "+++++++++++++++++++++++++++++++++++++++++++++"

git clone https://github.com/crowsnesttech/linux-dotfiles.git /home/nick/Documents/git/dotfiles/linux-dotfiles/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "removing old files"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 1

rm /home/nick/.oh-my-zsh
rm /home/nick/.vimrc
rm /home/nick/.zshrc

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "creating symlinks"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 1

ln -s /home/nick/Documents/git/dotfiles/linux-dotfiles/.oh-my-zsh ~/
ln -s /home/nick/Documents/git/dotfiles/linux-dotfiles/.vimrc ~/
ln -s /home/nick/Documents/git/dotfiles/linux-dotfiles/.zshrc ~/
sleep 1

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# git clone https://github.com/powerline/fonts.git
# cd fonts
# ./install.sh
# sudo fc-cache -fv
# cd ..
# sudo rm -r fonts

sudo chsh -s $(which zsh)

#pop_os remember to change the font in the system preferences to DejaVu Sans Mono for Powerline Book