export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="pygmalion"

plugins=(git go doctl ripgrep gcloud tmux heroku rust docker docker-compose)

# Transparent background support
export TERM=xterm-256color

source $ZSH/oh-my-zsh.sh

alias vi="vim"
alias ls="exa"

eval $(thefuck --alias)

export PATH=$PATH:~/.npm-global/bin

# Import colorscheme from 'wal'
cat $HOME/.cache/wal/sequences

# Disable caps lock and enable hjkl arrow keys
# Useful if I can't remap keys on a keeb
if command -v xmodmap &> /dev/null
then
  touch ~/.xmodmap && xmodmap ~/.xmodmap
fi
