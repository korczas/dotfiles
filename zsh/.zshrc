# #
# # Start profiling (uncomment when necessary)
# #
# # See: https://stackoverflow.com/a/4351664/2103996

# # Per-command profiling:

# zmodload zsh/datetime
# setopt promptsubst
# PS4='+$EPOCHREALTIME %N:%i> '
# exec 3>&2 2> startlog.$$
# setopt xtrace prompt_subst

# # Per-function profiling:

# zmodload zsh/zprof

# # # # # # # # # # # # # # # # # # # # # # #

# Source
## custom functions
for file in ~/.zsh_custom/*.zsh; do
  source $file
done
## asdf shims
# source /opt/homebrew/opt/asdf/libexec/asdf.sh # TODO: fix - not working

# History behavior
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

export DEFAULT_USER=$(whoami)
export ZSH=$HOME/.oh-my-zsh
plugins=(git common-aliases z zsh-autosuggestions zsh-syntax-highlighting alias-tips brew asdf)

# ZSH Theme
ZSH_THEME="powerlevel10k/powerlevel10k"
export DISABLE_MAGIC_FUNCTIONS=true
source $ZSH/oh-my-zsh.sh

## Powerlevel9k settings
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
### To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# External tools configuration
export BAT_THEME='TwoDark'
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!.git/' -g '!node_modules/' -g '!tmp/' -g '!vendor/'"
export DOTFILES_PATH="$HOME/.repos/dotfiles"

# Aliases
alias ls="exa"
alias cat="bat"

## Tmux
alias tmux="tmux -u"
alias tnew="tmux -u new-session -t main"

## File access
alias dotfiles="cd $DOTFILES_PATH"
alias zshrc="${EDITOR:-code} $DOTFILES_PATH/zsh/.zshrc"
alias alacrittyrc="${EDITOR:-code} $DOTFILES_PATH/alacritty/alacritty.yml"
alias tmuxrc="${EDITOR:-code} ~/.tmux.conf"

## Git
alias gcof="git checkout \$(git branch -a | fzf)"
alias gbdf="git branch -D \$(git branch | fzf -m)"
alias gitopen='open-git-origin'

## Global aliases
alias -g F='| fzf --exact'
alias -g C='| cat'
alias -g G='| grep -v'

## Docker aliases and functions
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
alias update-aws-credentials='update-aws-credentials'

# Prompt customization
RPROMPT='%D{%K:%M:%S}'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Path configuration

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # prioritize homebrew bins

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# Completion configuration
zstyle ':completion:*' menu select

# Perform compinit only once a day.
autoload -Uz compinit

setopt EXTENDEDGLOB
for dump in $ZSH_COMPDUMP(#qN.m1); do
  compinit
  if [[ -s "$dump" && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
    zcompile "$dump"
  fi
  echo "Initializing Completions..."
done
unsetopt EXTENDEDGLOB
compinit -C

# # # # # # # # # # # # # # # # # # # # # # #
# #
# # End profiling (uncomment when necessary)
# #

# # Per-command profiling:

# unsetopt xtrace
# exec 2>&3 3>&-

# # Per-function profiling:

# zprof > /tmp/foo
