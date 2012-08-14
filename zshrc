#
# Sets Oh My Zsh options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:module:editor' keymap 'emacs'

# Auto convert .... to ../..
zstyle ':omz:module:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:module:terminal' auto-title 'yes'

# Set the Zsh modules to load (man zshmodules).
# zstyle ':omz:load' zmodule 'attr' 'stat'

# Set the Zsh functions to load (man zshcontrib).
# zstyle ':omz:load' zfunction 'zargs' 'zmv'

# Set the Oh My Zsh modules to load (browse modules).
# The order matters.
zstyle ':omz:load' omodule \
  'environment' \
  'terminal' \
  'editor' \
  'history' \
  'spectrum' \
  'utility' \
  'completion' \
  'prompt' \
  'history-substring-search'
  #'directory' \


# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:module:prompt' theme 'escobera'

# This will make you shout: OH MY ZSHELL!
source "$OMZ/init.zsh"

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/bin:/bin:/usr/sbin:/sbin
#export DYLD_LIBRARY_PATH="/usr/local/instantclient:$DYLD_LIBRARY_PATH"
#export LD_LIBRARY_PATH="/usr/local/instantclient:$LD_LIBRARY_PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export JRUBY_OPTS=--1.8
#rvm
if [[ -s /Users/rafa/.rvm/scripts/rvm ]] ; then source /Users/rafa/.rvm/scripts/rvm ; fi

#Textmate
export GIT_EDITOR="subl -w"
export SVN_EDITOR="subl -w"
export JRUBY_HOME="/Users/rafa/.rvm/rubies/jruby-1.6.7.2"
#alias
alias l="ls -laHGq"
alias vim="mvim -v"
alias sfv="cksfv -f *.sfv"
alias dirsfv="find . -name '*.sfv' -exec cksfv -g {} ';'"
alias rake="noglob rake"

#git
alias gl="git pull"
alias gp="git push"
alias gca="git commit -a"
alias gst="git status"

bindkey "^[[3~" delete-char
export LSCOLORS="cxgxbxdxGxeHeHxbGxbHeH"

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

HISTORY_SUBSTRING_SEARCH_GLOBBING_FLAGS="i"
setopt MENU_COMPLETE
unsetopt CORRECT