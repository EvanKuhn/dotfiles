# System-specific command aliases
system=`uname -s`

if [ $system == 'Darwin' ]; then
  alias ls='ls -FG'
  alias ll='ls -FGAlh'
  alias hical='cal | grep --color -EC6 "\b$(date +%e | sed "s/ //g")"'
elif [ $system == 'Linux' ]; then
  alias ls='ls -F --color'
  alias ll='ls -FGAlh --time-style=+"%b %d %Y %H:%M:%S"'
fi

# Command aliases
alias lld='ll | grep -G ^d'
alias gs='git status'
alias be='bundle exec'
alias uninstall_all_gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias rubypath='ruby -e "puts ENV[\"PATH\"].split(\":\").join(\"\\n\")"'
alias csshxify='ruby ~/.utils/csshxify.rb'
alias edit='atom .'
alias whereami='echo "`whoami`@`hostname`:`pwd`"'
alias notes='cd ~/notes/ && edit . scratch && cd -'

# Copy last command (clc), run last command (rlc)
alias clc="history | tail -2 | head -1 | tr -s ' ' | cut -d ' ' -f 3- | pbcopy; pbpaste"
alias rlc="`history | tail -2 | head -1 | tr -s ' ' | cut -d ' ' -f 3-`"

# Tailing Apache log files
alias last_access_log='echo `ls -1 /var/log/apache2/access* | tail -n 1`'
alias last_error_log='echo `ls -1 /var/log/apache2/error* | tail -n 1`'
alias acctail='tail -f `last_access_log`'
alias errtail='tail -f `last_error_log`'

# Because Mac provides NO EASY WAY to lock the desktop. Grrr...
#alias saver='/System/Library/Frameworks/ScreenSaver.framework/Versions/Current/Resources/ScreenSaverEngine.app/Contents/MacOS/ScreenSaverEngine'
alias saver='open -a /System/Library/CoreServices/ScreenSaverEngine.app'
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
#   sudo curl -o /etc/bash_completion.d/git-prompt.sh \
#   https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
#
if [ -f /etc/bash_completion.d/git-completion.bash ]; then
  source /etc/bash_completion.d/git-completion.bash
fi
if [ -f /etc/bash_completion.d/git-prompt.sh ]; then
  source /etc/bash_completion.d/git-prompt.sh
fi

# Create __git_ps1 if it doesn't already exist
if [ `declare -f __git_ps1 > /dev/null; echo $?` != 0 ]
then
  __git_ps1 () { echo ""; }
fi

GIT_PS1_SHOWDIRTYSTATE=true

if [[ ${EUID} == 0 ]] ; then
  PS1='\[\e[94m\][`date +"%T"`] \[\e[31m\]\u@`hostname`\[\e[00m\]:\[\e[96m\]\w\[\e[33m\]$(__git_ps1)\[\e[97m\]\n# \[\e[00m\]'
else
  PS1='\[\e[94m\][`date +"%T"`] \[\e[34m\]\u@`hostname`\[\e[00m\]:\[\e[96m\]\w\[\e[33m\]$(__git_ps1)\[\e[97m\]\n$ \[\e[00m\]'
fi

# ssh hostname autocompletion
if [ -f ~/.ssh/known_hosts ]; then
  complete -W "$(echo $(cat ~/.ssh/known_hosts | \
    cut -f 1 -d ' ' | sed -e s/,.*//g | \
    sort -u | grep -v "\["))" ssh
fi

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'
