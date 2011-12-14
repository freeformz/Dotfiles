
#Bash Completion
if which brew 2>&1 > /dev/null; then
  if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
  fi
fi

#Misc Aliases
alias ls="ls -G"
alias h="heroku"
alias g="git"

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

docbrown() {
  pushd . 
  cd devel/docbrown
  bundle exec bin/docbrown $*
  popd
}

#MOAR visible
export LSCOLORS="Exfxcxdxbxegedabagacad"

#Spiffy PS1
export PS1='\[\e[1;33m\]\u@\H\[\e[0m\]\[\e[1;36m\] \w$(__git_ps1 " (%s)")\[\e[0m\]\n\[\e[1;31m\]\T\[\e[0m\] \[\e[1;36m\]$(ruby -v | cut -d " " -f 1-2)\[\e[0m\]\n> ' #\e[37m\]'

export PATH=~/.rbenv/bin:~/.rbenv/shims:/usr/local/share/python:/usr/local/bin:/usr/local/sbin:$PATH

#Add identities if they are not loaded

if ! ssh-add -l | grep -q heroku_rsa; then
  ssh-add ~/.ssh/heroku_rsa
fi

#Some pdsh variables
export WCOLL=hosts.txt
export PDSH_SSH_ARGS_APPEND="-o StrictHostKeyChecking=no"
export PDSH_RCMD_TYPE="ssh"
