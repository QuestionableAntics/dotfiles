#!/bin/zsh

eval "$(rtx env -s zsh)"
source $HOME/.zshrc


################################################################################
# neovim setup
################################################################################

nvim --headless "Lazy sync" +"sleep 20" +q


################################################################################
# misc setup
################################################################################

# Install lf terminal file manager
env CGO_ENABLED=0 go install -ldflags="-s -w" github.com/gokcehan/lf@latest


