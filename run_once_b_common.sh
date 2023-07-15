#!/bin/zsh

curl https://sh.rustup.rs -sSf | sh -s -- -y
pip install pynvim


################################################################################
# rtx setup
################################################################################

curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
cargo binstall rtx-cli -y
# source $HOME/.zshrc


################################################################################
# oh my zsh setup
################################################################################

zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth=1 \
	https://github.com/zsh-users/zsh-syntax-highlighting.git \
	$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \

# delete .zshrc and replace with pre-oh-my-zsh contents
rm $HOME/.zshrc
# copy pre-oh-my-zsh contents to .zshrc
mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
# install powerlevel10k
git clone --depth=1 \
	https://github.com/romkatv/powerlevel10k.git \
	${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


################################################################################
# potential packages (terminal and gui)
################################################################################

#  go install github.com/charmbracelet/bubbletea@latest
#  go install github.com/charmbracelet/glow@latest
#  cargo binstall projectable -y
#  cargo binstall bottom -y
#  cargo binstall ast-grep -y
# Something to handle bitwarden
# Task switcher
	# Raycast for mac
	# hopefully they update to support linux
