echo "installing..."
dir=~/dotfiles
ln -s $dir/vimrc ~/.vimrc
ln -s $dir/xmonad ~/.xmonad
ln -s $dir/vim ~/.vim
ls -s $dir/xmobarrc ~/.xmobarrc
echo "install complete"

