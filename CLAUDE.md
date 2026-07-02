# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a personal macOS dotfiles repository that manages development environment configuration through symlinks and shell scripts. The setup uses Oh My Zsh with Powerlevel10k theme, tmux with custom layouts, Alacritty terminal, and various development tools managed via Homebrew and asdf.

## Setup Commands

### Initial Installation
```bash
# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install packages and dependencies
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/korczas/dotfiles/main/scripts/install_packages.sh)"

# Clone repository
mkdir .repos && cd .repos
git clone https://github.com/korczas/dotfiles.git
cd dotfiles
```

### Configuration Setup
```bash
# Set macOS defaults
sh ./mac_defaults/setup_defaults.sh

# Install fonts, Oh My Zsh, symlinks, and tmux plugins
sh ./scripts/copy_fonts.sh
sh ./scripts/setup_ohmyzsh.sh
sh ./scripts/setup_symlinks.sh
sh ./scripts/setup_tmux_plugins.sh

# Test terminal setup
sh ./testing/test-drive-terminal.sh
```

### Post-Installation
```bash
# Install tmux plugins (run inside tmux)
<Ctrl-Space> + I
```

## Architecture

### Configuration Structure
- **alacritty/**: Terminal emulator configuration
- **tmux/**: Tmux configuration and custom session layouts
- **zsh/**: Zsh shell configuration with Oh My Zsh and Powerlevel10k
- **git/**: Git configuration with delta diff viewer
- **asdf/**: Version manager configuration for Node.js, Python, Go, Bun

### Key Components

#### Symlink Management
The `scripts/setup_symlinks.sh` creates symbolic links from the dotfiles repo to standard config locations:
- `~/.config/alacritty/alacritty.yml` → `alacritty/alacritty.yml`
- `~/.config/tmux/tmux.conf` → `tmux/tmux.conf`
- `~/.zshrc` → `zsh/.zshrc`
- `~/.zshrc.local` → `zsh/.zshrc.local`
- `~/.gitconfig` → `git/.gitconfig`

#### Zsh Core vs. Per-Machine Config
`zsh/.zshrc` is the shared core (committed, synced across machines). Machine/env-specific config (work vs. private) lives in `zsh/.zshrc.local`, which is gitignored and sourced last so it can override the core. On setup, `setup_symlinks.sh` bootstraps it from the tracked `zsh/.zshrc.local.example` template (via `cp -n`, never clobbering an existing file). Shared, generic functions still live in `zsh/.zsh_custom/*.zsh`.

#### Tmux Layouts
Custom tmux session and window layouts live in `tmux/layouts/` and are managed via the tmuxifier plugin. These layouts are machine/work-specific, so their contents are gitignored (only a `.gitkeep` is tracked to preserve the directory as the symlink target). Add per-machine `*.session.sh` and `*.window.sh` files there locally.

#### Package Management
- **Homebrew**: Primary package manager for macOS tools
- **asdf**: Runtime version manager for development languages
- **Oh My Zsh**: Zsh framework with plugins for git, autosuggestions, syntax highlighting

## Key Tools and Aliases

### Shell Aliases
- `ls` → `exa` (modern ls replacement)
- `cat` → `bat` (syntax highlighting cat)
- `gcof` - Git checkout with fzf branch selection
- `gbdf` - Git branch delete with fzf selection
- `dotfiles` - Quick navigation to dotfiles directory
- `zshrc`, `zshrclocal`, `tmuxrc`, `alacrittyrc` - Quick config file editing

### Tmux Configuration
- Prefix key: `Ctrl-Space`
- Vim-style pane navigation (`h`, `j`, `k`, `l`)
- Custom key bindings for window/pane management
- Catppuccin theme with custom status bar

### Development Environment
- Default editor: VS Code (`code -w`)
- Terminal: Alacritty with MesloLGS Nerd Font
- Shell: Zsh with Powerlevel10k prompt
- Git diff viewer: Delta with side-by-side view
- Fuzzy finder: fzf with ripgrep integration

## Testing and Verification

Use `testing/test-drive-terminal.sh` to verify terminal colors and fonts are working correctly after setup.

## Language Runtimes

Default Python version is set to 3.8.18 via asdf. Node.js, Go, and Bun are available but versions are managed per-project basis.