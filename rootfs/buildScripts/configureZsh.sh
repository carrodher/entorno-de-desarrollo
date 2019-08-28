#!/bin/bash

chsh -s "$(command -v zsh)"
wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O install.sh
chmod +x install.sh
./install.sh --unattended
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
sed -i 's|ZSH_THEME="robbyrussell"|ZSH_THEME="avit"|g' ~/.zshrc
sed -i 's|plugins=(git)|plugins=(git colored-man-pages zsh-autosuggestions zsh-syntax-highlighting)|g' ~/.zshrc
rm -rf ./install.sh