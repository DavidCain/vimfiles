" Last updated: 2011-07-19
"
" Plugins:
"   Pathogen - Tim Pope
"   Pydiction - Ryan Kulla
"   Pyflakes - Phil Frost
"   git runtime files - Tim Pope
"   pythoncomplete - Aaron Griffin
"   repeat.vim - Tim Pope
"   surround.vim - Tim Pope
"   fugitive.vim - Tim Pope

" TODO: shortcuts for set tw=72 and set tw=0
" TODO: searching, excluding comments
" TODO: automatically set tw=72 when typing function headers

set nocompatible " Not vi compatibile (affects other settings)
filetype off 
call pathogen#infect() " TODO: which are needed to be called each time?
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype plugin indent on " 'on': Enables filetype detection
                          " 'plugin': Enables file-specific plugins
                          " 'indent': Indent files

"""""""""""""""""""""""""""""""""""""""""""""""""""
" General options
"""""""""""""""""""""""""""""""""""""""""""""""""""
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
"set tildeop " Use the tilde an an operator (can be used with motions)


""" Tabbing
set tabstop=4 " Sets tabs to 4 spaces
set shiftwidth=4 " < and > keys indent/unindent 4 spaces
set shiftround  " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab " Use 'shiftwidth' setting at start of lines
set expandtab " Inserts four spaces with the tab key
set softtabstop=4 " Treats four spaces as one tab
set autoindent
set backspace=indent,eol,start " backspace over everything in insert mode

""" Vim files
set nobackup " Don't make backup files
set noswapfile " Don't make .swp files
set undofile " Enable undofiles (store edit history for file)
             " (Does not work in Vim 7.0)
"set undodir=~/.vim/unodir " Store undofiles

""" Wild menu
set wildmenu
set wildmode=list:longest " Makes file completion behave more like bash
"set wildignore=*.o,*,a,*.swp,*.bak,*.pyc,*.class " Ignore certain file types


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch " Search as you type
set hlsearch  " Highlight search term in text
set ignorecase " All lower case strings are case insensitive, but if one 
set smartcase  " character is upper-case, it's case sensitive

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Press F4 to toggle highlighting and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Make Y yank to end of line (consistent with D and C)
"nnoremap Y y$

" Quick write
map <leader>w :w!<CR>
map <leader>q :q!<CR>

" Simpler window navigation 
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Maximize height of given window
nnoremap zm :set lines=999<CR>

" Make small (lazy xUbuntu fix)
nnoremap zs :set lines=38<CR>

" Toggle line numbers and fold column for easy copying:
imap <silent> <F2> <Esc>:set nonumber!<CR>:set foldcolumn=0<CR>a
nnoremap <silent> <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set pastetoggle=<F3> " Deactivates tabbing behavior to paste reasonably

" Use w!! to write to files where sudo status is needed
cmap w!! w !sudo tee % >/dev/null 

" Append the time and date 
:map <F6> a<C-R>=strftime("%c")<CR><Esc>
imap <F6> <C-R>=strftime("%c")<CR><Esc>

" Append time and date, in ISO 8601 format
:map <F7> a<C-R>=strftime("%Y-%m-%d")<CR><Esc>
imap <F7> <C-R>=strftime("%Y-%m-%d")<CR><Esc>

" Make comma behave as semicolon in normal mode
"nnoremap , ;
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
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Python auto-complete
" Download from: http://www.vim.org/scripts/script.php?script_id=850
let g:pydiction_location = '~/.vim/vimfiles/pydiction/complete-dict'
" Plugin 'pythoncomplete' works with this as well
" Download from: http://www.vim.org/scripts/script.php?script_id=1542

" Delete blankspace at the end of python code
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``


"""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
    set guifont=Monospace\ 10
    set columns=84
    "set lines=999 " (Problematic on resourcing- put this into .gvimrc)
    set background=dark
    colorscheme zenburn " custom color scheme.
                        " Download at http://slinky.imukuppi.org/zenburnpage/
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
autocmd FileType text setlocal textwidth=80 " Limit text to 80 columns for plaintext
" /\(#.*\)\@<!foo Search for foo, but not on commented lines
