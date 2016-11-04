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

export PS1="\e[1;32m\u@\h\e[0m \e[1;36m[\W]\e[0m \e[1;31m\$(parse_git_branch)\e[0m \n$ "

###################################
# command history completion
###################################
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

###################################
# npm install -g no sudo
###################################
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
unset MANPATH
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

###################################
# add bin of local node_modules
###################################
PATH="$PATH:./node_modules/.bin/"
