# ==============================================================================
# Core .zshrc (shared across machines via dotfiles). Machine/env-specific config
# lives in ~/.zshrc.local, which is sourced at the very end.
# ==============================================================================

# --- Oh My Zsh core -----------------------------------------------------------
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git common-aliases z zsh-autosuggestions zsh-syntax-highlighting alias-tips brew asdf)
export DISABLE_MAGIC_FUNCTIONS=true
source $ZSH/oh-my-zsh.sh

# Powerlevel10k. To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# --- History ------------------------------------------------------------------
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# --- Environment / exports ----------------------------------------------------
export EDITOR="code -w"
export DEFAULT_USER=$(whoami)
export DOTFILES_PATH="$HOME/.repos/dotfiles"
export TMUXIFIER_LAYOUT_PATH="$HOME/.config/tmux/plugins/tmuxifier/layouts"
export BAT_THEME='TwoDark'
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!.git/' -g '!node_modules/' -g '!tmp/' -g '!vendor/'"
export BUN_INSTALL="$HOME/.bun"

# --- PATH ---------------------------------------------------------------------
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$HOME/.config/tmux/plugins/tmuxifier/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # prioritize homebrew bins

# --- Shared custom functions --------------------------------------------------
for file in ~/.zsh_custom/*.zsh; do
  source $file
done

# --- Aliases ------------------------------------------------------------------
## Core replacements
alias ls="exa"
alias cat="bat"

## File access
alias dotfiles="cd $DOTFILES_PATH"
alias zshrc="${EDITOR:-code} $DOTFILES_PATH/zsh/.zshrc"
alias zshrclocal="${EDITOR:-code} $DOTFILES_PATH/zsh/.zshrc.local"
alias alacrittyrc="${EDITOR:-code} $DOTFILES_PATH/alacritty/alacritty.yml"
alias tmuxrc="${EDITOR:-code} $DOTFILES_PATH/tmux/tmux.conf"

## Tmux
alias tmux="tmux -u"
alias tnew="tmux -u new-session -t main"
alias tflw="tmuxifier load-window"
alias tfls="tmuxifier load-session"

## Git
alias gcof="git checkout \$(git branch -a | fzf | sed \"s:remotes/[^/]*/::\")"
alias gbdf="git branch -D \$(git branch | fzf -m)"
alias gitopen='open-git-origin'

## Docker
function dcc() {
  containers=$(docker ps -a | grep ... | cut -c -12)
  if [[ -n $containers ]]; then
    echo "Removing containers: " $containers
    docker rm -f $(docker ps -a | grep ... | cut -c -12)
  else
    echo "There are no containers to remove."
  fi
}
alias dcu="docker-compose up"
alias dcd="docker-compose down"

## Misc
alias weather="curl https://wttr.in/bielsko-biala"
alias heic-to-jpg="magick mogrify -monitor -format jpg *.HEIC"

## Global aliases
alias -g F='| fzf --exact'
alias -g C='| cat'
alias -g G='| grep'

# --- Tool init ----------------------------------------------------------------
eval "$(tmuxifier init -)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun" # bun completions

zstyle ':completion:*' menu select
autoload -Uz compinit
compinit -C

RPROMPT='%D{%K:%M:%S}'

# --- Local machine overrides (must stay last) ---------------------------------
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
