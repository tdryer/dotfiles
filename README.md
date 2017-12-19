# dotfiles

This repository contains configuration files for software I use.

## Installation

Clone this repository, initialize the
[Vundle](https://github.com/gmarik/vundle) submodule, and use
[dotfiles](http://pypi.python.org/pypi/dotfiles) to automatically create
symlinks from the actual dotfiles to the files in this repository:

```
git submodule init
git submodule update
dotfiles --sync --force
```

Run `:BundleInstall` in Vim to have Vundle install Vim plugins.
