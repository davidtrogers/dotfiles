function parse_git_branch {
  ref=$(git symbolic-ref HEAD 2> /dev/null) 
  echo "("${ref#refs/heads/}")"
}

BLUE="\[\033[0;34m\]"
PURP="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
GREEN="\[\033[0;32m\]"

PS1="\n$RED\$(/bin/date '+%m-%d-%Y %H:%M:%S') \w\n$YELLOW\$(parse_git_branch)$GREEN $(~/.rvm/bin/rvm-prompt)$RED->$GREEN"

#aliases
alias ls='ls -G'
alias ll='ls -ahl'
alias git='~/bin/hub'

#env vars
export PATH="~/.rvm/bin:/opt/local/bin:/opt/local/sbin:/usr/local/bin/:/usr/local/sbin/:/opt/local/lib/:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/local/mysql/bin"
# export PATH=$PATH:/opt/local/bin:/Users/macajueli/.gem/ruby/1.8/bin:/usr/local/mysql-5.1.41-osx10.5-x86/bin:/Users/macajueli/dev/android-sdk-mac_86/tools:/Users/macajueli/dev/android-sdk-mac_86/
export ARCHFLAGS="-arch x86_64"
export DYLD_LIBRARY_PATH="/opt/local/lib"
export COMMAND_MODE="unix2003"
export EDITOR="/usr/local/bin/mvim"

#rvm magic
if [[ -s /Users/macajueli/.rvm/scripts/rvm ]] ; then source /Users/macajueli/.rvm/scripts/rvm ; fi

# declare -x IRBRC="/Users/macajueli/.rvm/rubies/ruby-1.8.7-p334/.irbrc"
#
