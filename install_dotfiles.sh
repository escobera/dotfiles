echo "Backing up old vim to ~/vim-backup"
mv ~/.vim ~/vim-backup 2> /dev/null
cp ~/.vimrc ~/.vimrc.old 2> /dev/null
rm ~/.vimrc 2> /dev/null

echo "Creating vim directories"
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/tmp
cd ~/.vim
mkdir -p bundle

echo "Downloading vundle"
git clone http://github.com/gmarik/vundle.git bundle/vundle

echo "Linking stuffz..."
ln -s ~/projects/dotfiles/vimrc ~/.vimrc
ln -s ~/projects/dotfiles/gemrc ~/.gemrc
ln -s ~/projects/dotfiles/pryrc ~/.pryrc
ln -s ~/projects/dotfiles/zshrc ~/.zshrc
