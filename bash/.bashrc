# command history completion
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# npm install -g no sudo
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

# add bin of local node_modules
PATH="$PATH:./node_modules/.bin/"
