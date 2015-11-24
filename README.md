##Setup

```bash
git clone git@github.com:mokokko/dotfiles.git ~/.dotfiles

echo 'source $HOME/.bashrc' >> ~/.bash_profile
echo 'source $HOME/.dotfiles/.bashrc' >> ~/.bashrc


ln -s ~/.dotfiles/.gitconfig ~/


ln -s ~/.dotfiles/.vimrc ~/
mkdir -p ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

# if you want use 'diff-highlight', need git version 1.9
```
