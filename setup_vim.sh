#! /bin/sh

# Backup existing vim files and create new directory
echo "Moving existing vim files to ~/vim-backup/"
rm -rf ~/vim-backup
mkdir ~/vim-backup
mv ~/.vim ~/vim-backup
mv ~/.vimrc ~/vim-backup

echo "Creating new .vimrc"
cp .vimrc ~

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


