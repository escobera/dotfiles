# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="escobera"
#export ZSH_THEME="robbyrussell"

#plugins
plugins=(git rails3)

# Customize to your needs...
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql83/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/mongodb/bin

export APXS=/opt/local/apache2/bin/apxs
#rvm 
if [[ -s /Users/rafa/.rvm/scripts/rvm ]] ; then source /Users/rafa/.rvm/scripts/rvm ; fi
# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="false"
source $ZSH/oh-my-zsh.sh

#Textmate
export GIT_EDITOR="mate -w"
export SVN_EDITOR="mate -w"

#alias
alias pgstart="sudo su postgres -c 'pg_ctl -D /opt/local/var/db/postgresql83/defaultdb start'"
alias pgstop="sudo su postgres -c 'pg_ctl -D /opt/local/var/db/postgresql83/defaultdb stop'"
alias mongostart="sudo launchctl start org.mongodb.mongod"
alias mongostop="sudo launchctl stop org.mongodb.mongod"
alias apache2ctl="sudo /opt/local/apache2/bin/apachectl"
alias l="ls -laHGq"

bindkey "^[[3~" delete-char
export LSCOLORS="cxgxbxdxGxeHeHxbGxbHeH"
__rvm_project_rvmrc

