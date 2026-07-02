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

# Per-machine local zsh config: bootstrap from the example (never clobber an
# existing one), then symlink it into place. The real file is gitignored.
cp -n ~/.repos/dotfiles/zsh/.zshrc.local.example ~/.repos/dotfiles/zsh/.zshrc.local
ln -vsf ~/.repos/dotfiles/zsh/.zshrc.local ~/.zshrc.local

ln -vsf ~/.repos/dotfiles/tmux/layouts ~/.config/tmux/plugins/tmuxifier

# Claude Code config (settings + hooks + skills). Replace pre-existing real dirs with
# symlinks; -n keeps re-runs from nesting the link inside an existing symlink.
mkdir -p ~/.claude
ln -vsf ~/.repos/dotfiles/claude/settings.json ~/.claude/settings.json
[ -L ~/.claude/hooks ] || rm -rf ~/.claude/hooks
ln -vsfn ~/.repos/dotfiles/claude/hooks ~/.claude/hooks
[ -L ~/.claude/skills ] || rm -rf ~/.claude/skills
ln -vsfn ~/.repos/dotfiles/claude/skills ~/.claude/skills
