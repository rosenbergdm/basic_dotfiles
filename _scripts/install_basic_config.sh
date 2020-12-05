#!/bin/sh
# install_basic_config.sh

startdir=`pwd`
srcfile=`readlink -f $0`
srcdir=`dirname $srcfile`
srcdir=`dirname $srcdir`
cd $HOME

if uname -a | grep Debian >/dev/null 2>&1; then
  echo "Installing for debian"
  packages="neovim ruby-dev aptitude apt-file apt-utils python-pip python-pip3"
  echo "Installing $packages"
  aptitude update
  aptitude install -y $packages
  
else
  echo "Not debian"
fi

pypackages="ipython Flask psycopg2"
echo "Installing python packages $pypackages"
pip install $pypackages
pip3 install $pypackages
rbpackages="pry readline bundler asciidoctor wirble"
echo "Installing ruby packages $rbpackages"
gem install $rbpackages

for fname in bashrc gitconfig inputrc irbrc nvimrc profile vimrc config/nvim/init.vim xinitrc Xresources; do
  echo "Copying $srcdir/$fname"
  if [ -f ".$fname" ]; then
    tgt=".$fname.`date +%s`"
    echo "Backing up .$fname to $tgt"
    mv .$fname $tgt
  fi
  cp $srcdir/$fname $HOME/.$fname
done

cd $startdir
