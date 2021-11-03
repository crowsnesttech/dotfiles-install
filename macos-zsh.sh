#!/bin/bash

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Updating Home Brew Repos"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
brew update 

mkdir -p /Users/$USER/git/dotfiles/macos-dotfiles

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Clone MacOS-Dotfiles from Github"
echo "+++++++++++++++++++++++++++++++++++++++++++++"

git clone https://github.com/crowsnesttech/macos-dotfiles.git /Users/$USER/git/dotfiles/macos-dotfiles/

git clone https://github.com/ohmyzsh/ohmyzsh.git /Users/$USER/git/dotfiles/macos-dotfiles/.oh-my-zsh/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Removing Old Files"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 1

rm /Users/$USER/.bash_profile
rm /Users/$USER/.nanorc
rm /Users/$USER/.oh-my-zsh
rm /Users/$USER/.vimrc
rm /Users/$USER/.zshrc

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "creating symlinks"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
sleep 1

ln -s /Users/$USER/git/dotfiles/macos-dotfiles/.bash_profile ~/
ln -s /Users/$USER/git/dotfiles/macos-dotfiles/.nanorc ~/
ln -s /Users/$USER/git/dotfiles/macos-dotfiles/.oh-my-zsh ~/
ln -s /Users/$USER/git/dotfiles/macos-dotfiles/.vimrc ~/
ln -s /Users/$USER/git/dotfiles/macos-dotfiles/.zshrc ~/
sleep 1


echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Adding ZSH Plugins"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting



echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Installing iTerm2 Shell Integration"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
curl-L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh| bash