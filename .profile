# Stuff not related to Bash. Eg: environment variables

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH=$PATH:/usr/local/sbin

system=`uname -s`
if [ $system == 'Darwin' ]; then
  export CC=/usr/bin/gcc-4.2                      # For XCode
  export JAVA_HOME=`/usr/libexec/java_home`       # For XCode
  export XDG_DATA_DIRS=:/opt/local/share          # Shared MIME info
fi

export PATH=$HOME/bin:$PATH
export BUNDLER_EDITOR=subl                        # For 'bundle open <gem>'

# Load rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Load rvm
#export PATH=$PATH:$HOME/.rvm/bin
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

