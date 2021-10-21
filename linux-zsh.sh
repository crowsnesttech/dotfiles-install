#!/bin/bash

sudo apt update
sudo apt install zsh -y 

mkdir -p $HOME/Documents/git/dotfiles/linux-dotfiles
sleep 1

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Clone Linux-Dotfiles from Github"
echo "+++++++++++++++++++++++++++++++++++++++++++++"

rm -rf $HOME/Documents/git/dotfiles/linux-dotfiles/

git clone https://github.com/crowsnesttech/linux-dotfiles.git $HOME/Documents/git/dotfiles/linux-dotfiles/

git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/Documents/git/dotfiles/linux-dotfiles/.oh-my-zsh/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "removing old files"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 1

rm $HOME/.oh-my-zsh
rm $HOME/.vimrc
rm $HOME/.zshrc
rm $HOME/.tmux.conf

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "creating symlinks"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 1

ln -s $HOME/Documents/git/dotfiles/linux-dotfiles/.oh-my-zsh ~/
ln -s $HOME/Documents/git/dotfiles/linux-dotfiles/.vimrc ~/
ln -s $HOME/Documents/git/dotfiles/linux-dotfiles/.zshrc ~/
ln -s $HOME/Documents/git/dotfiles/linux-dotfiles/.tmux.conf ~/
sleep 1

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

##Uncomment for Desktop Veriants
# git clone https://github.com/powerline/fonts.git
# cd fonts
# ./install.sh
# sudo fc-cache -fv
# cd ..
# sudo rm -r fonts

sudo chsh -s $(which zsh)
echo "=========================================="
echo "REMEMBER TO LOGOUT OF COMPUTER TO ENABLE SHELL"
echo "POP_OS --> remember to change the font in the terminal app to DejaVu Sans Mono for Powerline Book"
echo "=========================================="
