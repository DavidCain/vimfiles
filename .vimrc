" TODO: searching, excluding comments
" TODO: automatically set tw=72 when typing function headers

""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" Python
Plug 'klen/python-mode', { 'for': 'python' }
Plug 'vim-scripts/pythoncomplete', { 'for': 'python' }

Plug 'bogado/file-line'
Plug 'sjl/gundo.vim/'

" TPope
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-git'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-tbone'

Plug 'easymotion/vim-easymotion'

" JavaScript
Plug 'othree/javascript-libraries-syntax.vim'

" Colorschemes
Plug 'nanotech/jellybeans.vim'

" Add plugins to &runtimepath
call plug#end()



""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""
" General options
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " Not vi compatibile (affects other settings)

filetype plugin indent on " 'on': Enables filetype detection
                          " 'plugin': Enables file-specific plugins
                          " 'indent': Indent files
let mapleader=',' " Change the mapleader from \ to ','
syntax on " Turns on syntax highlighting
set ruler " Always show curent position
set number " Turn on (absolute) line numbers
"set relativenumber " Sets line numbers to be relative instead of absolute
set vb t_vb= " Flash screen in place of beeps
set showcmd " Show command being typed
set showmatch " Show matching brackets
set nowrap " No line wrapping
set title " Set the terminal's title
set autoread " Automatically read file again if it's been changed elsewhere
set splitright " Vertical splits open to the right
set splitbelow " Horizonal splits open to the bottom
"set tildeop " Use the tilde as an operator (can be used with motions)
set nojoinspaces " Only insert one space after sentences in join operations


""" Tabbing
set tabstop=4 " Sets tabs to 4 spaces
set shiftwidth=4 " < and > keys indent/unindent 4 spaces
set softtabstop=4 " Treats four spaces as one tab
autocmd FileType html,coffee,ruby,css,javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
set shiftround  " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab " Use 'shiftwidth' setting at start of lines
set expandtab " Inserts four spaces with the tab key
set autoindent
set backspace=indent,eol,start " backspace over everything in insert mode

""" Vim files
set nobackup " Don't make backup files
set noswapfile " Don't make .swp files

if version >= 703
  set undodir=~/.vim/undodir
  set undofile " Enable undofiles (store edit history for file)
  set undoreload=10000 "maximum lines to save for undo on a buffer reload
endif
set undolevels=1000 "maximum number of changes that can be undone


""" Wild menu
set wildmenu
set wildmode=list:longest " Makes file completion behave more like bash
set wildignore=*.o,*.a,*.swp,*.bak,*.pyc,*.class " Ignore certain file types


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch " Search as you type
set hlsearch  " Highlight search term in text
set ignorecase " All lower case strings are case insensitive, but if one 
set smartcase  " character is upper-case, it's case sensitive
set grepprg=ack " Use ack instead of grep

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Press F4 to toggle highlighting and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""

" map control-backspace to delete the previous word
:imap <C-BS> <C-W>

" Easily move lines of text
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
nnoremap <A-h> <<
nnoremap <A-l> >>
inoremap <A-j> <Esc>:m+<CR>==gi
inoremap <A-k> <Esc>:m-2<CR>==gi
inoremap <A-h> <Esc><<`]a
inoremap <A-l> <Esc>>>`]a
vnoremap <A-j> :m'>+<CR>gv=gv
vnoremap <A-k> :m-2<CR>gv=gv
vnoremap <A-h> <gv
vnoremap <A-l> >gv

" Make Y yank to end of line (consistent with D and C)
nnoremap Y y$

" Shortcuts to adjust textwidth
imap <F7> <C-o>:set textwidth=72<CR>
map <F7> :set textwidth=72<CR>
imap <F8> <C-o>:set textwidth=79<CR>
map <F8> :set textwidth=79<CR>
imap <F9> <C-o>:set textwidth=0<CR>
map <F9> :set textwidth=0<CR>

" Simpler window navigation 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Toggle line numbers and fold column for easy copying:
imap <silent> <F2> <Esc>:set nonumber!<CR>:set foldcolumn=0<CR>a
nnoremap <silent> <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set pastetoggle=<F3> " Deactivates tabbing behavior to paste reasonably

" Use w!! to write to files where sudo status is needed
cmap w!! w !sudo tee % >/dev/null 

" Use ipdb for debugging
" TODO: Filetype:
" - JS: debugger
" - Ruby: Pry
" - Python: ipdb
:map <F10> oimport ipdb; ipdb.set_trace()<CR><Esc>
imap <F10> import ipdb; ipdb.set_trace()<Esc>

" Append time and date, in ISO 8601 format
:map <F12> a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <F12> <C-R>=strftime("%Y-%m-%d")<CR><Esc>

" Make semi-colon act as colon in normal mode
nnoremap ; :

" Bash-like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Use arrow keys for moving window
map <Down> 4<C-e>
map <Up> 4<C-y>
map <Left> 4zh
map <Right> 4zl

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete text to the blackhole register
nnoremap <leader><leader>d "_d
vnoremap <leader><leader>D "_D

"""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
colorscheme jellybeans
if has("gui_running")
    set winaltkeys=no " Disable alt-keys (doesn't interfere with Alt bindings)
    set guioptions-=m " Disable the menu
    set guioptions-=T " Disable the toolbar
    set guioptions-=l " Disable left scrollbar
    set guioptions-=r " Disable right scrollbar

    set guifont=Monospace\ 10
    set columns=84
    "set lines=999 " (Problematic on resourcing- put this into .gvimrc)
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""
" .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically resource the .vimrc after changes
autocmd! bufwritepost .vimrc source %

" Resource .vimrc (useful in other instances of Vim)
nnoremap <F5> :so ~/.vimrc <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""

set modelines=0 " Closes a small vulnerability (see options.txt)
" /\(#.*\)\@<!foo Search for foo, but not on commented lines

" Automatically set textwidth for plaintext and Python source
autocmd FileType text setlocal textwidth=72
autocmd FileType py setlocal textwidth=79

" Delete blankspace at the end of python code
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Python auto-complete
" --------------------
" Download from: http://www.vim.org/scripts/script.php?script_id=850
let g:pydiction_location = '~/.vim/vimfiles/pydiction/complete-dict'
" Plugin 'pythoncomplete' works with this as well
" Download from: http://www.vim.org/scripts/script.php?script_id=1542

" Python mode settings
" --------------------
let g:pymode_lint_on_write = 1 " pylint checking every save
" Ignore warnings about long lines, McCabe complexity, blank lines,
" block comments, and continuation lines
" (See http://pep8.readthedocs.org/en/latest/intro.html#error-codes)
let g:pymode_lint_ignore = "C901,E121,E126,E265,E302,E303,E501"
let g:pymode_folding = 0
let g:pymode_rope = 0

" Easymotion
map <Leader> <Plug>(easymotion-prefix)

" javascript-libraries-syntax
let g:used_javascript_libs = 'angularjs,underscore,jquery'

" OS X tweaks
autocmd filetype crontab setlocal nobackup nowritebackup " Makes crontab work
