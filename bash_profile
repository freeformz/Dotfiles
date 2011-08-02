#Load RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

#Bash Completion
if [ -f `brew --prefix`/etc/bash_completion ]; then
  . `brew --prefix`/etc/bash_completion
fi

#Misc Aliases
alias ls="ls -G"

#Spiffy PS1
export PS1='\[\e[1;33m\]\u@\H\[\e[0m\]\[\e[1;36m\] \w$(__git_ps1 " (%s)")\[\e[0m\]\n\[\e[1;31m\]\T\[\e[0m\] \[\e[1;36m\]$(rvm-prompt)\[\e[0m\]\n> ' #\e[37m\]'
