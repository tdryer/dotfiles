# dotfiles

These are my dotfiles, mostly used for Python development in Vim.

## Installation

Installation requires cloning this repository, initializing the [Vundle](https://github.com/gmarik/vundle) submodule, and using [dotfiles](http://pypi.python.org/pypi/dotfiles) to automatically create symlinks from the actual dotfiles to the files in this repository:
```
git clone https://github.com/tdryer/dotfiles.git Dotfiles
cd Dotfiles
git submodule init
git submodule update
pip install dotfiles
dotfiles --sync --force
```
Run `:BundleInstall` in Vim to have Vundle install Vim plugins. [YouCompleteMe](https://github.com/Valloric/YouCompleteMe) requires a very recent version of Vim and additional compilation steps.
