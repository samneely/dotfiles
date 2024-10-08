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

# PATH for Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"

# Aliases
[ -f ~/.aliases ] && source ~/.aliases

# added by travis gem
[ -f /Users/samneely/.travis/travis.sh ] && source /Users/samneely/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# PATH for Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# fzf
source <(fzf --zsh)
