#!/bin/bash

if [ `whoami` != "root" ];
  then echo "ERROR: must be run as root";
  exit 1
fi

echo "Creating: /etc/bash_completion.d/"
mkdir -p /etc/bash_completion.d/

echo "Fetching: git-completion.bash"
curl -so /etc/bash_completion.d/git-completion.bash \
https://raw.github.com/git/git/master/contrib/completion/git-completion.bash

echo "Fetching: git-shell.sh"
curl -so /etc/bash_completion.d/git-shell.sh \
https://raw.github.com/git/git/master/contrib/completion/git-prompt.sh
