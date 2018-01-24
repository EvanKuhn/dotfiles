# Stuff not related to Bash. Eg: environment variables

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

export PATH=/usr/local/sbin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.rbenv/bin:$PATH

export BUNDLER_EDITOR=atom # For 'bundle open <gem>'
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
