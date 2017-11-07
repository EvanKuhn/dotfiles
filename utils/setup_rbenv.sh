#!/bin/bash

git clone https://github.com/sstephenson/rbenv.git      ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
git clone git://github.com/tpope/rbenv-aliases.git      ~/.rbenv/plugins/rbenv-aliases
rbenv rehash

echo 'Add this to your ~.profile:'
echo ''
echo '    # Setup rbenv'
echo '    export PATH=$HOME/.rbenv/bin:$PATH'
echo '    eval \"$(rbenv init -)\"'
echo ''
