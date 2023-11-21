#!/bin/bash

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/tmux

ln -vsf ~/.repos/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -vsf ~/.repos/dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf

ln -vsf ~/.repos/dotfiles/asdf/.default-npm-packages ~/.default-npm-packages
ln -vsf ~/.repos/dotfiles/asdf/.asdfrc ~/.asdfrc

ln -vsf ~/.repos/dotfiles/git/.gitconfig ~/.gitconfig
ln -vsf ~/.repos/dotfiles/git/.gitignore_global ~/.gitignore_global

ln -vsf ~/.repos/dotfiles/zsh/.zshrc ~/.zshrc
ln -vsf ~/.repos/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
ln -vsf ~/.repos/dotfiles/zsh/.zsh_custom ~/.zsh_custom

ln -vsf ~/.repos/dotfiles/tmux/layouts ~/.config/tmux/plugins/tmuxifier
