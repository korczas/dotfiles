# TODO:

- [ ] describe installation process
- [ ] update alacritty config
- [ ] update tmux config
- [ ] ???

## Installation process:

...

- set mac defaults. Some changes might need restart (to be confirmed)

```bash
sh ./mac_defaults/setup_defaults.sh
```

- run scripts to install and config applications.

```bash
sh ./scripts/copy_fonts.sh
sh ./scripts/install_packages.sh
sh ./scripts/setup_ohmyzsh.sh
sh ./scripts/setup_symlinks.sh
sh ./scripts/setup_tmux_plugins.sh
```

- test terminal and tmux. Run command in terminal and in tmux. Compare with expected output from link in script file.

```bash
sh ./testing/test-drive-terminal.sh
```
