#! /bin/sh

# Backup existing vim files and create new directory
echo "Moving existing vim files to ~/vim-backup/"
rm -rf ~/vim-backup
mkdir ~/vim-backup
mv ~/.vim ~/vim-backup

echo "Creating new .vim directory"
mkdir -p ~/.vim/autoload ~/.vim/bundle ~/.vim/colors

# Install plugins, starting with Pathogen
echo "Installing Plugins"
echo "- Pathogen"
curl -Sso ~/.vim/autoload/pathogen.vim \
  https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle

echo "- sensible-vim"
git clone -q git://github.com/tpope/vim-sensible.git

echo "- MiniBufExpl"
git clone -q git://github.com/fholgado/minibufexpl.vim.git

echo "- vim-puppet"
git clone -q git://github.com/rodjek/vim-puppet.git

echo "- Tabular"
git clone -q git://github.com/godlygeek/tabular.git

echo "- Syntastic"
git clone -q https://github.com/scrooloose/syntastic.git

echo "- vim-colors-solarized"
git clone -q git://github.com/altercation/vim-colors-solarized.git

echo "- vim-scala"
git clone -q https://github.com/derekwyatt/vim-scala.git

echo "- vim-nginx"
mkdir -p ~/.vim/syntax/
curl -s http://www.vim.org/scripts/download_script.php?src_id=14376 -o ~/.vim/syntax/nginx.vim
echo "au BufRead,BufNewFile /etc/nginx/conf/* set ft=nginx" >> ~/.vim/filetype.vim

# Install colorschemes
#echo "Installing colorschemes"

# NOTE: this causes errors on my mac due to line endings being different,
#       and I think also because of some weirdness with solarized. Try
#       setting the colorscheme to candy in vim via ':colorscheme candy'.
#echo "- candy"
#curl -Sso ~/.vim/colors/candy.vim \
#  https://raw.github.com/vim-scripts/candy.vim/master/colors/candy.vim

# Get rid of git directories
echo "Deleting git directories under ~/.vim"
find ~/.vim/ -name .git -type d -exec rm -rf {} \; 2> /dev/null
