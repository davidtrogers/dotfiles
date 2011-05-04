function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) 
  echo "("${ref#refs/heads/}")"
}

BLUE="\[\033[0;34m\]"
PURP="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

PS1="\n$RED\$(/bin/date '+%m-%d-%Y %H:%M:%S') \w\n$YELLOW\$(parse_git_branch)$GREEN \$(~/.rvm/bin/rvm-prompt)$RED->$GREEN"

source ~/git-completion.bash

set -o vi

#aliases
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias gwtf='~/bin/git-wtf'
alias gsm='~/bin/git-show-merges'

alias ls='ls -G'
alias ll='ls -ahl'
alias git='~/bin/hub'

alias trails='AUTOSSH_POLL=15 autossh -M 5022 -t trails -fnt'
alias trails1='AUTOSSH_POLL=15 autossh -M 5032 -t trailstest -fnt'
alias irc='AUTOSSH_POLL=15 autossh -M 5012 -t irc -fnt'
alias red='redis-server /usr/local/etc/redis.conf'
alias be='bundle exec'
alias nginx='sudo /usr/local/nginx/sbin/nginx'
alias psg='ps aux |grep'
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'
alias htree='tree -H $(pwd) -o ~/.htree && open ~/.htree'

#env vars
# export AUTOSSH_POLL=15
export USER="Dave"
export PATH="~/bin:~/vendor/bin:~/.rvm/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin/:/usr/local/sbin/:/opt/local/lib/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/mysql/bin"
# export PATH=$PATH:/opt/local/bin:/Users/macajueli/.gem/ruby/1.8/bin:/usr/local/mysql-5.1.41-osx10.5-x86/bin:/Users/macajueli/dev/android-sdk-mac_86/tools:/Users/macajueli/dev/android-sdk-mac_86/
export ARCHFLAGS="-arch x86_64"
#export DYLD_LIBRARY_PATH="/opt/local/lib"
export COMMAND_MODE="unix2003"
export EDITOR=$(which mvim)

#REE GC settings
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

#rvm magic
if [[ -s /Users/macajueli/.rvm/scripts/rvm ]] ; then source /Users/macajueli/.rvm/scripts/rvm ; fi

# declare -x IRBRC="/Users/macajueli/.rvm/rubies/ruby-1.8.7-p334/.irbrc"
#
