#!/bin/zsh

curl https://sh.rustup.rs -sSf | sh -s -- -y

pip install pynvim


################################################################################
# rtx setup
################################################################################

curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
cargo binstall rtx-cli -y
source $HOME/.zshrc \
	&& rtx plugin add neovim \
	&& rtx plugin add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git \
	&& rtx plugin add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git \
	&& rtx plugin add lazygit https://github.com/nklmilojevic/asdf-lazygit.git \
	&& rtx plugin add bat \
	&& rtx plugin add golang https://github.com/kennyp/asdf-golang.git \
	&& rtx use -g neovim@nightly \
	&& rtx use -g dotnet-core@7.0.304 \
	&& rtx use -g nodejs@20.3.1 \
	&& rtx use -g python@3.9.12 \
	&& rtx use -g lazydocker@latest \
	&& rtx use -g lazygit@latest \
	&& rtx use -g bat@latest \
	&& rtx use -g golang@latest \
	&& rtx use -g ripgrep@latest \
	&& rtx use -g fzf@latest \
	&& rtx use -g fd@latest \
	&& rtx use -g poetry@latest \
	&& rtx use -g awscli@latest \
	&& rtx use -g lua@latest

eval "$(rtx env -s zsh)"


################################################################################
# neovim setup
################################################################################

nvim --headless "Lazy sync" +"sleep 20" +q


################################################################################
# oh my zsh setup
################################################################################

zsh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
clone --depth=1 \
	https://github.com/zsh-users/zsh-syntax-highlighting.git \
	$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting \
# copy pre-oh-my-zsh contents to .zshrc
# delete .zshrc and replace with pre-oh-my-zsh contents
rm $HOME/.zshrc \
mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc \
# install powerlevel10k
git clone --depth=1 \
	https://github.com/romkatv/powerlevel10k.git \
	${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


################################################################################
# misc setup
################################################################################

# Install lf terminal file manager
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest


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
