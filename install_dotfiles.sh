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
ln -s ~/projects/dotfiles/prompt_escobera_setup  ~/.zprezto/modules/prompt/functions
# ln -s '~/projects/dotfiles/Default (Linux).sublime-keymap'  '~/.config/sublime-text-2/Packages/User/Default (Linux).sublime-keymap'
# ln -s '~/projects/dotfiles/Preferences.sublime-settings'  '~/.config/sublime-text-2/Packages/User/Preferences.sublime-settings'
# ln -s '~/projects/dotfiles/DeleteLine.sublime-macro'  '~/.config/sublime-text-2/Packages/User/DeleteLine.sublime-macro'
