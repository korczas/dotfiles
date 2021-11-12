#case "$(uname -s)" in
#  Darwin)
#      brew install the_silver_searcher neovim reattach-to-user-namespace tmux diff-so-fancy asdf gnupg coreutils curl git ripgrep git-delta imagemagick
#      brew cask install alacritty spectacle flux slack karabiner-elements lunar whatsapp iterm2 goofy istat-menus alfred spotify contexts intel-power-gadget steam
#      brew install --HEAD universal-ctags/universal-ctags/universal-ctags
#    ;;
#
#  Linux)
#      git clone https://github.com/asdf-vm/asdf.git ~/.asdf
#      cd ~/.asdf
#      git checkout "$(git describe --abbrev=0 --tags)"
#      cd -
#      sudo add-apt-repository -y ppa:neovim-ppa/unstable
#      sudo apt update -y
#      sudo apt install -y gcc perl autoconf pkg-config curl wget zsh xclip \
#        python-dev python-pip python3-dev python3-pip neovim \
#        silversearcher-ag scrot tmux
#    ;;
#esac


brew install \
    asdf \
    bat \
    diff-so-fancy \
    exa \
    fzf \
    gh \
    git \
    git-delta \
    gnupg \
    htop \
    python@3.7 \
    ripgrep \
    tmux \
    zsh

brew install --cask \
    visual-studio-code \
    alacritty

asdf plugin add nodejs
asdf plugin add golang

