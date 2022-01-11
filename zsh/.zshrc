setopt EXTENDED_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_NO_STORE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

ostype="$(uname -s)"
isosx=false
islinux=false
case "$ostype" in
  Linux*) islinux=true;;
  Darwin*) isosx=true;;
esac

[ "$isosx" = true ] &&
  export DEFAULT_USER=`whoami` &&
  export ZSH=$HOME/.oh-my-zsh &&
  plugins=(git tmux common-aliases z zsh-autosuggestions zsh-syntax-highlighting alias-tips brew asdf)

ZSH_THEME="powerlevel10k/powerlevel10k"

export DISABLE_MAGIC_FUNCTIONS=true
source $ZSH/oh-my-zsh.sh

export BAT_THEME='TwoDark'
export FZF_DEFAULT_COMMAND="rg --files --no-ignore-vcs --hidden -g '!.git/' -g '!node_modules/' -g '!tmp/' -g '!vendor/'"
export DOTFILES_PATH="$HOME/.repos/dotfiles"


alias tmux="tmux -u"
alias tnew="\tmux -u new-session -t main"
alias zshrc="$EDITOR $DOTFILES_PATH/zshrc"
alias alacrittyrc="$EDITOR $DOTFILES_PATH/alacritty.yml"
alias tmuxrc="$EDITOR ~/.tmux.conf"
alias dotfiles="cd $DOTFILES_PATH"

alias -g F='| fzf --exact'
alias -g C='| cat'
alias -g H='| head'
alias -g G!='| grep -v'
alias -g COL='| column -t -s " "'

alias yri="rm -rf node_modules/ && yarn install"
alias yrm="rm -rf node_modules/"
alias ys="yarn start"
alias yi="yarn install"
alias ls="exa"
alias cat="bat"
alias python=python3
alias pip=pip3

alias gcof="git checkout \$(git branch -a | fzf)"

alias heictojpg="magick mogrify -monitor -format jpg *.HEIC"

# docker aliases
#alias dcc="docker rm -f $(docker ps -a | grep ... | cut -c -12)"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

alias cbc=compare_branch_commits
function compare_branch_commits() {
  git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative $1..$2
}

RPROMPT='%D{%K:%M:%S}'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/usr/local/bin:/usr/local/sbin:$PATH" # make sure homebrew bins are before osx bins
export K8S_MANIFESTS_DIR="$HOME/projects/k8s-manifests"

zstyle ':completion:*' menu select
# . ~/.asdf/asdf.sh #in case asdf is installed from source code

GOPRIVATE="github.com/karhoo/*"
export PATH="$HOME/go/bin:$PATH"

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

export VAULT_ADDR=https://vault.karhoo.com
