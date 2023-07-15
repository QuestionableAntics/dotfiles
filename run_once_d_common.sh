#!/bin/zsh

eval "$(rtx env -s zsh)"
source $HOME/.zshrc

rtx plugin add neovim
rtx plugin add dotnet-core https://github.com/emersonsoares/asdf-dotnet-core.git
rtx plugin add lazydocker https://github.com/comdotlinux/asdf-lazydocker.git
rtx plugin add lazygit https://github.com/nklmilojevic/asdf-lazygit.git
rtx plugin add bat
rtx plugin add golang https://github.com/kennyp/asdf-golang.git
rtx use -g neovim@nightly
rtx use -g dotnet-core@7.0.304
rtx use -g nodejs@20.3.1
rtx use -g python@3.9.12
rtx use -g lazydocker@latest
rtx use -g lazygit@latest
rtx use -g bat@latest
rtx use -g golang@latest
rtx use -g ripgrep@latest
rtx use -g fzf@latest
rtx use -g fd@latest
rtx use -g poetry@latest
rtx use -g awscli@latest
rtx use -g lua@latest
