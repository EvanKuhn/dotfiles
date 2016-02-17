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
fi

export MYGIT=https://github.com/EvanKuhn          # Personal git account
export BUNDLER_EDITOR=subl                        # For 'bundle open <gem>'
export EDITOR=vi

# Load rbenv
eval "$(rbenv init -)"

# If we have an http proxy up, use it
nc -z localhost 3128
result=$?
if [ $result = 0 ]
then
  export http_proxy=http://localhost:3128/
  export HTTP_PROXY=http://localhost:3128/
fi
