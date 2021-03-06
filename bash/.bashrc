###################################
# command history completion
###################################
alias code='cd ~/code'
alias vim='vim -p'

function chdir {
  cd ~/$1
}

function dockerbash {
  docker exec -ti "$1" bash
}

###################################
# setup prompt format
# format:
#   <username>@<hostname> [<working directory>] (<git branch>)
#   $ doing somthing...
###################################

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

export PS1="\e[1;32m\u@\h\e[0m \e[1;36m[\w]\e[0m \e[1;31m\$(parse_git_branch)\e[0m \n$ "

###################################
# command history completion
###################################
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

###################################
# npm install -g no sudo
###################################
export NPM_PACKAGES="${HOME}/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

###################################
# add bin of local node_modules
###################################
PATH="$PATH:./node_modules/.bin/"

###################################
# add .git-completion.bash
# https://git-scm.com/book/en/v1/Git-Basics-Tips-and-Tricks
# https://github.com/git/git/blob/master/contrib/completion/git-completion.bash
###################################
if [ -f ~/.git-completion.bash ]; then
  source ~/.git-completion.bash
fi
