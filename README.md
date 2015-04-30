vimfiles
========

A collection of files used to customize my Vim environment.

Plugins and runtime files are managed by Tim Pope's
[Pathogen](https://github.com/tpope/vim-pathogen). Each plugin has been
pulled from its GitHub repository as a submodule.

## Installation

To install my `.vimrc,` and all plugins, clone the repository to
`~/.vim`, passing the recursive flag so that all plugins are cloned as
well. Create a symlink to the `.vimrc` so Vim can load it on startup.

    git clone --recursive git://github.com/DavidCain/vimfiles.git ~/.vim
    ln -s ~/.vim/.vimrc ~/.vimrc

If you cloned, but forgot the `--recursive`, you can run:

    git submodule update --init


## How to:

### Add a new plugin

Note that all plugins at [vim.org][vim-org] can be found [mirrored on
GitHub][vim-org-github].

    cd ~/.vim
    git submodule add git://github.com/JohnQExample/repo.git bundle/name

### Update all plugins
    
    cd ~/.vim
    git submodule foreach git pull origin master

### Remove a plugin/submodule

   1. Delete the relevant section from the `.gitmodules` file.
   2. Delete the relevant section from `.git/config`.
   3. Run `git rm --cached path_to_submodule` (no trailing slash).
   4. Commit and delete the now untracked submodule files. 


## Managed plugins

- General
    * [Gundo][gundo] - Steve Losh
    * [Pathogen][pathogen] - Tim Pope
    * [abolish.vim][abolish.vim] - Tim Pope
    * [markdown.vim][markdown.vim] - Tim Pope
    * [surround.vim][surround.vim] - Tim Pope
    * [repeat.vim][repeat.vim] - Tim Pope
    * [fugitive.vim][fugitive.vim] - Tim Pope
- Python-specific
    * [pythoncomplete][pythoncomplete] - Aaron Griffin
    * [python-mode][python-mode] - Kirill Klenov
- Ruby-specific
    * [rails.vim][rails.vim] - Tim Pope
    * [bundler.vim][bundler.vim] - Tim Pope
- Other
    * [vim-coffee-script][vim-coffee-script] - Mick Koch


## References

* [Synchronizing plugins with git submodules and pathogen.][vimcast]
* [How to remove a submodule][rm-submodule]

[vim-org]: http://www.vim.org
[vim-org-github]: https://github.com/vim-scripts
[vimcast]: http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
[rm-submodule]: http://stackoverflow.com/a/1260982/815632

[gundo]: https://github.com/sjl/gundo.vim/
[pathogen]: https://github.com/tpope/vim-pathogen 
[pythoncomplete]: https://github.com/vim-scripts/pythoncomplete 
[python-mode]: https://github.com/klen/python-mode
[repeat.vim]: https://github.com/tpope/vim-repeat 
[markdown.vim]: https://github.com/tpope/vim-markdown
[surround.vim]: https://github.com/tpope/vim-surround 
[fugitive.vim]: https://github.com/tpope/vim-fugitive 
[rails.vim]: https://github.com/tpope/vim-rails 
[bundler.vim]: https://github.com/tpope/vim-bundler
[vim-coffee-script]: https://github.com/kchmck/vim-coffee-script
[abolish.vim]: https://github.com/tpope/vim-abolish
