#!/bin/bash

git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
rbenv rehash

echo 'Add this to your ~.profile:'
echo ''
echo '    # Setup rbenv'
echo '    export PATH=$HOME/.rbenv/bin:$PATH'
echo '    eval \"$(rbenv init -)\"'
echo ''
