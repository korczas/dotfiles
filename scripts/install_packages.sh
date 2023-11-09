#!/bin/bash

brew install \
    asdf \
    bat \
    diff-so-fancy \
    exa \
    firefox \
    fzf \
    gh \
    git-delta \
    gnupg \
    htop \
    imagemagick \
    mas \
    reattach-to-user-namespace \
    ripgrep \
    tldr \
    tmux \
    zsh

brew install --cask \
    alacritty \
    google-chrome \
    postman \
    qnapi \
    raycast \
    slack \
    transmission \
    visual-studio-code \
    vlc

asdf plugin add nodejs
asdf plugin add golang
asdf plugin add python
asdf plugin add bun

# mas - cli for mac app store
mas lucky \
    trello