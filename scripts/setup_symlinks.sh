mkdir -p ~/.config/alacritty

ln -vsf ~/.repos/dotfiles/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml
ln -vsf ~/.repos/dotfiles/asdf/.default-npm-packages ~/.default-npm-packages
ln -vsf ~/.repos/dotfiles/asdf/.asdfrc ~/.asdfrc
ln -vsf ~/.repos/dotfiles/git/.gitconfig ~/.gitconfig
ln -vsf ~/.repos/dotfiles/git/.gitignore_global ~/.gitignore_global
ln -vsf ~/.repos/dotfiles/zsh/.zshrc ~/.zshrc
ln -vsf ~/.repos/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

case "$(uname -s)" in
  Darwin)
    mkdir -p ~/Library/Application\ Support/Code/User
    ln -vsf ~/.repos/dotfiles/vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

    ln -vsf ~/.repos/dotfiles/tmux/tmux.conf ~/.tmux.conf
    ln -s ~/.repos/dotfiles/karabiner ~/.config # copy instead of symlink
    ;;

  # Linux)
  #   ln -vsf ~/.repos/dotfiles/resources/linux/tmux.conf ~/.tmux.conf
esac
