vimfiles
========

A collection of files used to customize my Vim environment.

## Installation

    git clone git://github.com/DavidCain/vimfiles.git ~/.vim
    ln -s ~/.vim/.vimrc ~/.vimrc

[`vim-plug`][vim-plug] will automatically install itself + dependencies on first load:

    vim

## Dependency management
### Update dependencies

    vim -c "PlugClean | PlugInstall"

### Upgrade vim-plug itself

    vim -c "PlugUpgrade"


[vim-plug]: https://github.com/junegunn/vim-plug
