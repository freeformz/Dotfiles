export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin"

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="freeformz"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown 
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git hk)

source $ZSH/oh-my-zsh.sh

# User configuration
alias ls="ls -G"
alias h="heroku"
alias hr="heroku run"
alias hrb="heroku run bash -a"
alias hlt="heroku logs --tail"
alias hlta="heroku logs --tail -a"
alias gphm="git push heroku master"
alias gdc="git diff --cached"
alias gd="git diff"
alias rspec="bundle exec rspec"

#MOAR visible
#export LSCOLORS="Exfxcxdxbxegedabagacad"

addpath() {
  if [ -d "${1}" ]; then
    export PATH=${1}:$PATH
  fi
}

#GO Variables
export GOPATH=~/go
export GOROOT=/usr/local/go
addpath $GOPATH/bin
addpath $GOROOT/bin

# brew installed python stuff
addpath /usr/local/share/python

# For npm
if [ -x "$(which npm)" ]; then
  addpath $(npm config get prefix)/bin
fi

# For Java
if [ -e /usr/libexec/java_home ]; then
  addpath $(/usr/libexec/java_home)
fi

addpath ~/.rbenv/bin
if which rbenv 2>&1 > /dev/null; then
  eval "$(rbenv init -)"
fi

addpath ~/bin

if [ -r ~/.work.sh ]; then
  . ~/.work.sh
fi

if [ -s `brew --prefix`/etc/autojump.zsh ]; then
  . `brew --prefix`/etc/autojump.zsh
fi

export EDITOR=/usr/local/bin/vim
export PSQL_EDITOR="/usr/local/bin/vim -f -c ':set ft=sql'"

#Some pdsh variables
export WCOLL=hosts.txt
export PDSH_SSH_ARGS_APPEND="-o StrictHostKeyChecking=no"
export PDSH_RCMD_TYPE="ssh"

export HEROKU=/usr/local/heroku
addpath $HEROKU/bin

export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.12.0/libexec"
export AWS_ELB_HOME="/usr/local/Cellar/elb-tools/1.0.23.0/libexec"

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

source /usr/local/share/zsh/site-functions/_aws

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Boot 2 Docker
$(boot2docker shellinit)
