# System-specific command aliases
system=`uname -s`
if [ $system == 'Darwin' ]; then
  alias ls='ls -AG'
elif [ $system == 'Linux' ]; then
  alias ls='ls -A --color'
fi

# Command aliases
alias cp='cp -v'
alias rm='rm'
alias ll='ls -lh'
alias lld='ll | grep -G ^d'
alias gs='git status'
alias be='bundle exec'
alias uninstall_all_gems='gem list | cut -d" " -f1 | xargs gem uninstall -aIx'
alias rubypath='ruby -e "puts ENV[\"PATH\"].split(\":\").join(\"\\n\")"'
alias edit='subl -n .'

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
complete -W "$(echo $(cat ~/.ssh/known_hosts | \
    cut -f 1 -d ' ' | sed -e s/,.*//g | \
    sort -u | grep -v "\["))" ssh

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

