function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) 
  echo "("${ref#refs/heads/}")"
}

function rbenv_version {
  # rbenv rehash
  rbenv=$(rbenv version | awk {'print $1'})
  echo "${rbenv}"
}

# ruby build options
export RBENV=$'rbenv version'
export CONFIGURE_OPTS="--disable-install-doc --with-readline-dir=$(brew --prefix readline)"

BLUE="\[\033[1;34m\]"
PURP="\[\033[1;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[1;32m\]"
WHITE="\[\033[1;37m\]"
PS1="\n$RED\$(/bin/date '+%m-%d-%Y %H:%M:%S') \w\n"
PS1="$PS1$YELLOW\$(parse_git_branch) "
PS1="$PS1$GREEN\$(rbenv_version) "
PS1="$PS1$RED->$WHITE"

source ~/git-completion.bash

set -o vi

#aliases
alias sshdserver='sudo /usr/sbin/sshd -f /private/etc/sshd_config'
alias g='git'
alias gco='git co'
alias gci='git ci'
alias grb='git rb'
alias gwtf='~/bin/git-wtf'
alias gsm='~/bin/git-show-merges'
alias bump='bundle update --source'
alias mongoprefix='brew --prefix mongodb'

alias ls='ls -G'
alias ll='ls -ahl'
alias git='~/bin/hub'

alias crazyvnc="autossh -M 5052 -t crazyvnc -fnt"
alias trails="autossh -M 5022 -t trails -fnt"
alias trails1="autossh -M 5032 -t trailstest -fnt"
alias trailssinatra="autossh -M 5042 -t trailssinatra -fnt"
alias irc="autossh -M 5012 -t irc -fnt"
alias red="redis-server /usr/local/etc/redis.conf"
alias be="bundle exec"
alias nginx="sudo /usr/local/nginx/sbin/nginx"
alias smvim="sudo /Applications/MacVim.app/Contents/MacOS/MacVim"
alias psg="ps aux |grep'"
alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"
alias htree="tree -H $(pwd) -o ~/.htree && open ~/.htree"
alias mdb="mongod run --config $(brew --prefix mongodb)/mongod.conf --profile=1 --slowms=15 --diaglog 0"
# alias gempath="gem environment |grep INSTALLATION | awk {'print $4'}"
#env vars
export AUTOSSH_POLL=15
export USER="Dave"

#java classpath
export CLASSPATH

#PATH
export PATH=$HOME/.rbenv/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/bin
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:/usr/local/sbin/
export PATH=$PATH:/usr/local/lib
export PATH=$PATH:/usr/local/mysql/bin
export PATH=$PATH:$HOME/vendor/bin
export PATH=$PATH:/usr/bin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/usr/X11/bin
export PATH=$PATH:/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home/bin
# export PATH=$PATH:$HOME/dev/rubinius/bin

# cassandra
export JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6/Home"

# export ARCHFLAGS="-arch x86_64"
export DYLD_LIBRARY_PATH="/usr/local/lib"
export COMMAND_MODE="unix2003"
export EDITOR='~/bin/mvim'
export BUNDLE_WITHOUT='production'
# export CC='/usr/bin/gcc-4.2'

#REE GC settings
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

export PROMPT_COMMAND='echo -ne "\033]0;${PWD}\007"'

# export GEM_PATH='echo -ne "gempath"'

#rvm magic
# if [[ -s /Users/macajueli/.rvm/scripts/rvm ]] ; then source /Users/macajueli/.rvm/scripts/rvm ; fi
# declare -x IRBRC="/Users/macajueli/.rvm/rubies/ruby-1.8.7-p334/.irbrc"

eval "$(rbenv init -)"
