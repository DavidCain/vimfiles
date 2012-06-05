vimfiles
========

A collection of files used to customize my Vim environment.

Plugins and runtime files are managed by Tim Pope's
[Pathogen](https://github.com/tpope/vim-pathogen). Each plugin has been
pulled from its github repository as a submodule.

Managed plugins:

* [Gundo][gundo] - Steve Losh
* [Pathogen][pathogen] - Tim Pope
* [pythoncomplete][pythoncomplete] - Aaron Griffin
* [python-mode][python-mode] - Kirill Klenov
* [repeat.vim][repeat.vim] - Tim Pope
* [surround.vim][surround.vim] - Tim Pope
* [fugitive.vim][fugitive.vim] - Tim Pope


## Installation

Complete installation instructions can be found in the VimCast 
["Synchronizing plugins with git submodules and
pathogen."][vimcast]

In short, you'll want to make a directory `~/.vim`, and initialize a new
repository. Install Pathogen, then add a git submodule for each
plugin you wish to manage: 

    git submodule add <url> bundle/name

Add the submodules to the staging area, and commit. To update all
submodules, run:
    
    git submodule foreach git pull origin master

Lastly, Move .vimrc's to .vim/ and add them to the repository. Create
symlinks in your home directory like so:

    ln -s ~/.vim/.vimrc ~/.vimrc

Now, all your Vim configurations are located in one place, version
controlled, and easily used across multiple machines!

### Remove a plugin/submodule

   1. Delete the relevant section from the `.gitmodules` file.
   2. Delete the relevant section from `.git/config`.
   3. Run `git rm --cached path_to_submodule` (no trailing slash).
   4. Commit and delete the now untracked submodule files. 



[vimcast]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
[gundo]: http://sjl.bitbucket.org/gundo.vim 
[pathogen]: https://github.com/tpope/vim-pathogen 
[pythoncomplete]: https://github.com/vim-scripts/pythoncomplete 
[python-mode]: https://github.com/klen/python-mode
[repeat.vim]: https://github.com/tpope/vim-repeat 
[surround.vim]: https://github.com/tpope/vim-surround 
[fugitive.vim]: https://github.com/tpope/vim-fugitive 
