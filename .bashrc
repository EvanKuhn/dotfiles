# System-specific command aliases
system=`uname -s`
if [ $system == 'Darwin' ]; then
  #echo "Operating System: Darwin (Mac)"
  alias ls='ls -AG'
elif [ $system == 'Linux' ]; then
  #echo "Operating System: Linux"
  alias ls='ls -A --color'
fi

# Command aliases
alias ll='ls -lh'
alias lld='ll | grep -G ^d'
alias gs='git status'
alias be='bundle exec'
alias uninstall_all_gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias rubypath='ruby -e "puts ENV[\"PATH\"].split(\":\").join(\"\\n\")"'
alias cloj='java -cp /Users/evan/dev/clojure/clojure.jar clojure.main'
alias facts='ruby ~/utils/query_api_facts.rb'
alias edit='subl -n .'
alias php54='/usr/local/php5-5.4.14-20130505-195324/bin/php'
alias flumest='curl localhost:54321/metrics 2>/dev/null| python -mjson.tool'

# Copy last command (clc), run last command (rlc)
alias clc="history | tail -2 | head -1 | tr -s ' ' | cut -d ' ' -f 3- | pbcopy; pbpaste"
alias rlc="`history | tail -2 | head -1 | tr -s ' ' | cut -d ' ' -f 3-`"

# Tailing Apache log files
alias last_access_log='echo `ls -1 /var/log/apache2/access* | tail -n 1`'
alias last_error_log='echo `ls -1 /var/log/apache2/error* | tail -n 1`'
alias acctail='tail -f `last_access_log`'
alias errtail='tail -f `last_error_log`'

# Commands for working remotely
alias ssh-jump-off="cat ~/.ssh/config-base > ~/.ssh/config"
alias ssh-jump-on="cat ~/.ssh/config-base ~/.ssh/config-jump > ~/.ssh/config"
alias net-proxy-off="networksetup -setsocksfirewallproxystate Wi-Fi off"
alias net-proxy-on="networksetup -setsocksfirewallproxystate Wi-Fi on"
alias work-local="ssh-jump-off && net-proxy-off"
alias work-remote="ssh-jump-on && net-proxy-on"

# Because Mac provides NO EASY WAY to lock the desktop. Grrr...
alias saver='/System/Library/Frameworks/ScreenSaver.framework/Versions/Current/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
alias lock=saver

# Erase duplicates in bash history
HISTCONTROL=ignoredups:ignorespace

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Bash completion
if [ -f /opt/local/etc/bash_completion ]; then
  source /opt/local/etc/bash_completion
fi

# Set git autocompletion
# - To install the necessary files, run:
#
#   sudo curl -o /etc/bash_completion.d/git-completion.bash \
#   https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
#
#   sudo curl -o /etc/bash_completion.d/git-shell.sh \
#   https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
#
if [ -f /etc/bash_completion.d/git-completion.bash ]; then
  source /etc/bash_completion.d/git-completion.bash
fi
if [ -f /etc/bash_completion.d/git-shell.sh ]; then
  source /etc/bash_completion.d/git-shell.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[33m\]$(__git_ps1)\[\033[00m\]\n> '

# ssh hostname autocompletion
if [ -f ~/.ssh/known_hosts ]; then
  complete -W "$(echo $(cat ~/.ssh/known_hosts | \
    cut -f 1 -d ' ' | sed -e s/,.*//g | \
    sort -u | grep -v "\["))" ssh
fi

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
