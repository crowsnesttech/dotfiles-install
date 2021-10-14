#!/bin/bash

u="$USER"
echo "User name $u"

sudo apt update
sudo apt install zsh -y 

<<<<<<< HEAD
mkdir -p /home/$USER/Documents/git/dotfiles/linux-dotfiles
=======
mkdir -p /home/"$u"/Documents/git/dotfiles/linux-dotfiles
>>>>>>> a646ab18b9d7b7a27a391cdd579ce0baee73aa5e
sleep 1

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Clone Linux-Dotfiles from Github"
echo "+++++++++++++++++++++++++++++++++++++++++++++"

<<<<<<< HEAD
rm -rf /home/$USER/Documents/git/dotfiles/linux-dotfiles/

git clone https://github.com/crowsnesttech/linux-dotfiles.git /home/$USER/Documents/git/dotfiles/linux-dotfiles/

git clone https://github.com/ohmyzsh/ohmyzsh.git /home/$USER/Documents/git/dotfiles/linux-dotfiles/.oh-my-zsh/
=======
rm -rf /home/"$u"/Documents/git/dotfiles/linux-dotfiles/

git clone https://github.com/crowsnesttech/linux-dotfiles.git /home/"$u"/Documents/git/dotfiles/linux-dotfiles/

git clone https://github.com/ohmyzsh/ohmyzsh.git /home/"$u"/Documents/git/dotfiles/linux-dotfiles/.oh-my-zsh/
>>>>>>> a646ab18b9d7b7a27a391cdd579ce0baee73aa5e

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "removing old files"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 1

<<<<<<< HEAD
rm /home/$USER/.oh-my-zsh
rm /home/$USER/.vimrc
rm /home/$USER/.zshrc
rm /home/$USER/.tmux.conf
=======
rm /home/"$u"/.oh-my-zsh
rm /home/"$u"/.vimrc
rm /home/"$u"/.zshrc
rm /home/"$u"/.tmux.conf
>>>>>>> a646ab18b9d7b7a27a391cdd579ce0baee73aa5e

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "creating symlinks"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 1

<<<<<<< HEAD
ln -s /home/$USER/Documents/git/dotfiles/linux-dotfiles/.oh-my-zsh ~/
ln -s /home/$USER/Documents/git/dotfiles/linux-dotfiles/.vimrc ~/
ln -s /home/$USER/Documents/git/dotfiles/linux-dotfiles/.zshrc ~/
ln -s /home/$USER/Documents/git/dotfiles/linux-dotfiles/.tmux.conf ~/
=======
ln -s /home/"$u"/Documents/git/dotfiles/linux-dotfiles/.oh-my-zsh ~/
ln -s /home/"$u"/Documents/git/dotfiles/linux-dotfiles/.vimrc ~/
ln -s /home/"$u"/Documents/git/dotfiles/linux-dotfiles/.zshrc ~/
ln -s /home/"$u"/Documents/git/dotfiles/linux-dotfiles/.tmux.conf ~/
>>>>>>> a646ab18b9d7b7a27a391cdd579ce0baee73aa5e
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
