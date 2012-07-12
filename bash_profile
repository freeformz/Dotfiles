
#Bash Completion
if which brew 2>&1 > /dev/null; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi

#Misc Aliases
alias ls="ls -G"
alias h="heroku"
alias hs="heroku sudo"
alias g="git"
alias git="hub"
alias gosho="cd ~/devel/shogun"
alias gphm="git push heroku master"
alias rspec="bundle exec rspec"

shocon() {
  app=${1:-shogun}
  if [ "$app" != "shogun" ]; then
    app="shogun-$app"
  fi
  echo "Console on $app"
  h run ./console -a $app
}

hexport() {
  var_name=$1
  app=$2

  export $(heroku config -s -a $app | grep "^$var_name")
}

gpsm() {
  echo "pulling origin" &&
  git pull &&
  echo "pulling shogun" &&
  git pull shogun master &&
  echo "pushing origin" &&
  git push &&
  echo "pushing shogun" &&
  git push shogun master
}

urlencode() {
  ruby -r cgi -e "puts CGI::escape('${*}')"
}

source ~/encrypted/prowl.key
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
export GOROOT=~/devel/go
export GOPATH=~/

#Spiffy PS1
export PS1='\[\e[1;33m\]\u@\H\[\e[0m\]\[\e[1;36m\] \w$(__git_ps1 " (%s)")\[\e[0m\]\n\[\e[1;31m\]\T\[\e[0m\] \[\e[1;36m\]$(ruby -v | cut -d " " -f 1-2)\[\e[0m\]\n> ' #\e[37m\]'

export HEROKU=/usr/local/heroku
export PG=/Applications/Postgres.app/Contents/MacOS
export PATH=$HEROKU/bin:~/.rbenv/bin:$PG/bin:$GOROOT/bin:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH

export EDITOR=/usr/local/bin/mvim
export PSQL_EDITOR="/usr/local/bin/mvim -f -c ':set ft=sql'"

#Add identities if they are not loaded

if ! ssh-add -l | grep -q heroku_rsa; then
  ssh-add ~/.ssh/heroku_rsa
fi

#Some pdsh variables
export WCOLL=hosts.txt
export PDSH_SSH_ARGS_APPEND="-o StrictHostKeyChecking=no"
export PDSH_RCMD_TYPE="ssh"

eval "$(rbenv init -)"
