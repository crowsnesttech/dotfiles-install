#!/bin/bash

rm -rf $HOME/git/dotfiles/macos-dotfiles/
mkdir -p $HOME/git/dotfiles/macos-dotfiles

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Clone MacOS-Dotfiles from Github"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
git clone https://github.com/crowsnesttech/macos-dotfiles.git $HOME/git/dotfiles/macos-dotfiles/

git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/git/dotfiles/macos-dotfiles/.oh-my-zsh/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Removing Old Files"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
rm $HOME/.bash_profile
rm $HOME/.nanorc
rm $HOME/.oh-my-zsh
rm $HOME/.vimrc
rm $HOME/.zshrc

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "creating symlinks"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
ln -s $HOME/git/dotfiles/macos-dotfiles/.bash_profile ~/
ln -s $HOME/git/dotfiles/macos-dotfiles/.nanorc ~/
ln -s $HOME/git/dotfiles/macos-dotfiles/.oh-my-zsh ~/
ln -s $HOME/git/dotfiles/macos-dotfiles/.vimrc ~/
ln -s $HOME/git/dotfiles/macos-dotfiles/.zshrc ~/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Adding ZSH Plugins"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cp $HOME/git/dotfiles/macos-dotfiles/agnostercstm.zsh-theme $HOME/git/dotfiles/macos-dotfiles/.oh-my-zsh/custom/themes/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Installing Hack Nerd Fonts"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font


echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Installing iTerm2 Shell Integration"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh| bash