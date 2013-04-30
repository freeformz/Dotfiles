#Bash Completion
if which brew 2>&1 > /dev/null; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi

#Misc Aliases
alias ls="ls -G"
alias h="heroku"
alias hlt="heroku logs --tail"
alias hlta="heroku logs --tail -a"
alias g="git"
alias git="hub"
alias gphm="git push heroku master"
alias gdc="git diff --cached"
alias gd="git diff"
alias rspec="bundle exec rspec"

hexport() {
  var_name=$1
  app=$2

  export $(heroku config -s -a $app | grep "^$var_name")
}

urlencode() {
  ruby -r cgi -e "puts CGI::escape('${*}')"
}

if [ -r ~/encrypted/prowl.key ]; then
  . ~/encrypted/prowl.key
fi

prowl() {
  if [ -z "$1" ]; then
    echo "prowl requires at least one argument (the event)"
    return 1
  else
    EVENT="&event=$(urlencode $1)"
  fi

  if [ ! -z "$2" ]; then
    DESCRIPTION="&description=$(urlencode $2)"
  fi

  curl --silent "https://api.prowlapp.com/publicapi/add?apikey=${PROWL_KEY}&application=$(urlencode $(hostname)).bash${EVENT}${DESCRIPTION}" > /dev/null 2>&1
  return $?
}

#MOAR visible
export LSCOLORS="Exfxcxdxbxegedabagacad"

#GO Variables
export GOPATH=~/go

export ADDPATH=""

if [ -d /usr/local/share/python ]; then
  export ADDPATH=/usr/local/share/python:$ADDPATH
fi

if [ -e $GOPATH ]; then
  export ADDPATH=$GOPATH/bin:$ADDPATH
fi

#Spiffy PS1
export PS1='\[\e[1;33m\]\u@\H\[\e[0m\]\[\e[1;36m\] \w$(__git_ps1 " (%s)")\[\e[0m\]\n\[\e[1;31m\]\T\[\e[0m\] \[\e[1;36m\]$(ruby -v | cut -d " " -f 1-2)\[\e[0m\]\n> ' #\e[37m\]'

export PG=/Applications/Postgres.app/Contents/MacOS
if [ -d $PG ]; then
  export ADDPATH=$PG/bin:$ADDPATH
fi

if [ -d ~/.rbenv/bin ]; then
  export ADDPATH=~/.rbenv/bin:$ADDPATH
fi

if [ -d ~/bin ]; then
  export ADDPATH=~/bin:$ADDPATH
fi

export PATH=$ADDPATH:/usr/local/bin:/usr/local/sbin:$PATH

if which rbenv 2>&1 > /dev/null; then
  eval "$(rbenv init -)"
fi

export EDITOR=/usr/local/bin/mvim
export PSQL_EDITOR="/usr/local/bin/mvim -f -c ':set ft=sql'"

#Some pdsh variables
export WCOLL=hosts.txt
export PDSH_SSH_ARGS_APPEND="-o StrictHostKeyChecking=no"
export PDSH_RCMD_TYPE="ssh"

export HEROKU=/usr/local/heroku
export PATH=$HEROKU/bin:$PATH

if [ -r ~/.bash_private ]; then
  . ~/.bash_private
fi

if [ -r ~/.bash_work ]; then
  . ~/.bash_work
fi
