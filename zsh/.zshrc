# Path to your oh-my-zsh installation.
if ! [ $SPIN ]; then
  export ZSH=~/.oh-my-zsh
  ZSH_THEME="lambda"
fi

# User configuration
if ! [ $SPIN ]; then
  source $ZSH/oh-my-zsh.sh
fi

# Auth tokens
[ -f ~/.tokensrc ] && source ~/.tokensrc

export EDITOR=nvim

# PATH for Homebrew
export PATH="$PATH:/usr/local/sbin"

# PATH for local binaries, like claude
export PATH="$PATH:$HOME/.local/bin"

# PATH for Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# Aliases
[ -f ~/.aliases ] && source ~/.aliases

# added by travis gem
[ -f /Users/samneely/.travis/travis.sh ] && source /Users/samneely/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf
source <(fzf --zsh)

# asdf
export ASDF_DATA_DIR=$HOME/.asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Golang variables
. ${ASDF_DATA_DIR:-$HOME/.asdf}/plugins/golang/set-env.zsh
# export GOPATH=$HOME/go
# export PATH=$PATH:$GOPATH/bin
# export ASDF_GOLANG_MOD_VERSION_ENABLED=true

# Work specific configurations
[ -f ~/.workrc ] && source ~/.workrc
