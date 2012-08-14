# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="escobera"
#export ZSH_THEME="robbyrussell"

#plugins
plugins=(git)

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin
#export DYLD_LIBRARY_PATH="/usr/local/instantclient:$DYLD_LIBRARY_PATH"
#export LD_LIBRARY_PATH="/usr/local/instantclient:$LD_LIBRARY_PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export JRUBY_OPTS=--1.8
#rvm
if [[ -s /Users/rafa/.rvm/scripts/rvm ]] ; then source /Users/rafa/.rvm/scripts/rvm ; fi
# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="false"
source $ZSH/oh-my-zsh.sh

#Textmate
export GIT_EDITOR="subl -w"
export SVN_EDITOR="subl -w"
export JRUBY_HOME="/Users/rafa/.rvm/rubies/jruby-1.6.7.2"
#alias
alias pgstart="sudo su postgres -c 'pg_ctl -D /opt/local/var/db/postgresql83/defaultdb start'"
alias pgstop="sudo su postgres -c 'pg_ctl -D /opt/local/var/db/postgresql83/defaultdb stop'"
alias mongostart="sudo launchctl start org.mongodb.mongod"
alias mongostop="sudo launchctl stop org.mongodb.mongod"
alias l="ls -laHGq"
alias vim="mvim -v"
alias sfv="cksfv -f *.sfv"
alias dirsfv="find . -name '*.sfv' -exec cksfv -g {} ';'"
alias rake="noglob rake"
alias cleanm3u="find ./ -iname '*.m3u' -exec rm '{}' \; -print && find ./ -iname '*.pls' -exec rm '{}' \; -print"

bindkey "^[[3~" delete-char
export LSCOLORS="cxgxbxdxGxeHeHxbGxbHeH"


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000
