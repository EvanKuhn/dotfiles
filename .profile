# Stuff not related to Bash. Eg: environment variables

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH=$PATH:/usr/local/sbin
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH

system=`uname -s`
if [ $system == 'Darwin' ]; then
  export CC=/usr/bin/gcc-4.2                      # For XCode
  export JAVA_HOME=`/usr/libexec/java_home`       # For XCode
  export XDG_DATA_DIRS=:/opt/local/share          # Shared MIME info
fi

#export PATH=/opt/prserv_bin/apache/bin:$PATH      # Apache
#export PATH=/opt/prserv_bin/php/bin:$PATH         # PHP
#export PATH=/usr/local/mysql/bin:$PATH            # MySQL

export GIT=ssh://git@git.btrll.com/home/git/repo  # BrightRoll Git repo
export GITLAB=git@gitlab.btrll.com                # BrightRoll GitLab server
export MYGIT=https://github.com/EvanKuhn          # Personal git account
export BUNDLER_EDITOR=subl                        # For 'bundle open <gem>'
export EDITOR=vi

# Load rbenv
eval "$(rbenv init -)"

