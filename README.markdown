vimfiles
========

A collection of files used to customize my Vim environment.

Plugins and runtime files are managed by Tim Pope's
[Pathogen](https://github.com/tpope/vim-pathogen). Each plugin has been
pulled from its github repository as a submodule.

Managed plugins:

* [Gundo](http://sjl.bitbucket.org/gundo.vim) - Steve Losh
* [Pathogen](https://github.com/tpope/vim-pathogen) - Tim Pope
* [pythoncomplete](https://github.com/vim-scripts/pythoncomplete) - Aaron Griffin
* [repeat.vim](https://github.com/tpope/vim-repeat) - Tim Pope
* [surround.vim](https://github.com/tpope/vim-surround) - Tim Pope
* [fugitive.vim](https://github.com/tpope/vim-fugitive) - Tim Pope


Installation
------------

Complete installation instructions can be found in the VimCast 
["Synchronizing plugins with git submodules and
pathogen."](http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/)

In short, you'll want to make a directory ~/.vim, and initialize a new
repository. Install Pathogen, then add a git submodule for each
plugin you wish to manage: `git submodule add <url> bundle/name`

Add the submodules to the staging area, and commit. To update all
submodules, run `git submodule foreach git pull origin master`

Lastly, Move .vimrc's to .vim/ and add them to the repository. Create
symlinks in your home directory like so:

> ln -s ~/.vim/.vimrc ~/.vimrc

Now, all your Vim configurations are located in one place, version
controlled, and easily used across multiple machines!
