#!/bin/bash

rm -rf $HOME/git/dotfiles/macos-dotfiles/
mkdir -p $HOME/git/dotfiles/macos-dotfiles

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Clone MacOS-Dotfiles from Github"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
git clone https://github.com/crowsnesttech/macos-dotfiles.git $HOME/git/dotfiles/macos-dotfiles/
git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/git/dotfiles/macos-dotfiles/oh-my-zsh/

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
ln -s $HOME/git/dotfiles/macos-dotfiles/bash_profile ~/
ln -s $HOME/git/dotfiles/macos-dotfiles/nanorc ~/
ln -s $HOME/git/dotfiles/macos-dotfiles/oh-my-zsh ~/
ln -s $HOME/git/dotfiles/macos-dotfiles/vimrc ~/
ln -s $HOME/git/dotfiles/macos-dotfiles/zshrc ~/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Hiding symlinks"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
mv ~/bash_profile ~/.bash_profile
mv ~/nanorc ~/.nanorc
mv ~/oh-my-zsh ~/.oh-my-zsh
mv ~/vimrc ~/.vmrc
mv ~/zshrc ~/.zshrc


echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Adding ZSH Plugins"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
brew install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
cp $HOME/git/dotfiles/macos-dotfiles/agnostercstm.zsh-theme $HOME/git/dotfiles/macos-dotfiles/oh-my-zsh/custom/themes/

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Installing Hack Nerd Fonts"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

ITERM=/Applications/iterm.app
if [ -e "$ITERM" ]; then
    echo "$ITERM exists."
else 
    brew install iterm2
fi

# cp -i $HOME/install-dotfiles/iterm2-prefs/com.googlecode.iterm2.plst /Users/nick/Library/Preferences/com.googlecode.iterm2.plist

echo "+++++++++++++++++++++++++++++++++++++++++++++"
echo "Installing iTerm2 Shell Integration"
echo "+++++++++++++++++++++++++++++++++++++++++++++"
curl -L https://iterm2.com/shell_integration/install_shell_integration_and_utilities.sh| bash