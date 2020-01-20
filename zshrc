# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="lambda"

# User configuration
source $ZSH/oh-my-zsh.sh

# Auth tokens
source ~/.tokensrc

export EDITOR=nvim

# PATH for Homebrew
export PATH="$PATH:/usr/local/sbin"

# PATH for Postgres
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin"
export PATH="$PATH:/usr/local/opt/postgresql@9.6/bin"

# Aliases
source ~/.aliases

# added by travis gem
[ -f /Users/samneely/.travis/travis.sh ] && source /Users/samneely/.travis/travis.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Load asdf
if [ -d ~/.asdf ]; then
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
fi

# PATH for Go
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
