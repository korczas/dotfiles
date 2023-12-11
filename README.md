# TODO:

- [ ] describe installation process
- [x] update alacritty config
- [x] update tmux config
- [ ] verification scripts for: mac defaults, package install, symlinks, fonts(?)
- [ ] cpu usage custom module for tmux Catppuccin
- [ ] go pro webcam install
- [ ] ???

## Installation process:

- install brew package mangager

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

- install brew packages

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/korczas/dotfiles/main/scripts/install_packages.sh)"
```

- download the repository to you local machine

```bash
mkdir .repos
cd .repos
git clone https://github.com/korczas/dotfiles.git
cd dotfiles
```

- set mac defaults. Some changes might need restart (to be confirmed)

```bash
sh ./mac_defaults/setup_defaults.sh
```

- run scripts to install and config applications.

```bash
sh ./scripts/copy_fonts.sh
sh ./scripts/setup_ohmyzsh.sh
sh ./scripts/setup_symlinks.sh
sh ./scripts/setup_tmux_plugins.sh
```

- test terminal and tmux. Run command in terminal and in tmux. Compare with expected output from link in script file.

```bash
sh ./testing/test-drive-terminal.sh
```

- install tmux plugins. Run tmux

```bash
<leader> + I
```

## Config details

### tmux

- <leader> is set to Control-Space

## Troubleshooting

- in case if tmux is not working correctly run

```bash
infocmp tmux-256color
```

if you see `infocmp: couldn't open terminfo file (null).` then follow this https://gist.github.com/bbqtd/a4ac060d6f6b9ea6fe3aabe735aa9d95

## NOTES:

- if I start using vim then install this vim plugin to work with tmux https://github.com/christoomey/vim-tmux-navigator
