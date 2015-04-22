##Setup

```bash
git clone git@github.com:mokokko/dotfiles.git ~/.dotfiles

echo 'source $HOME/.dotfiles/.bashrc' >> ~/.bash_profile
echo 'source $HOME/.dotfiles/.bashrc' >> ~/.bashrc


ln -s ~/.dotfiles/.gitconfig ~/


ln -s ~/.dotfiles/.vimrc ~/
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
