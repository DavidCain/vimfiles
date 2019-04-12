""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'sjl/gundo.vim/'

" Markdown
Plug 'tpope/vim-markdown'
Plug 'suan/vim-instant-markdown'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Miscellaneous TPope
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Tmux
Plug 'tpope/vim-tbone'
Plug 'benmills/vimux'

" Movement
Plug 'bogado/file-line'
Plug 'easymotion/vim-easymotion'

" Fuzzy-finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'nanotech/jellybeans.vim'

" Language & syntax
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'css', 'less', 'scss', 'json', 'markdown'] }

" Testing
Plug 'janko-m/vim-test'

" Tiny plugin to make <leader>l and <leader>q toggle location & quickfix windows
Plug 'Valloric/ListToggle'


" Add plugins to &runtimepath
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" General options
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " Not vi compatibile (affects other settings)

filetype plugin indent on " 'on': Enables filetype detection
                          " 'plugin': Enables file-specific plugins
                          " 'indent': Indent files
syntax on " Turns on syntax highlighting
set synmaxcol=200  " Don't syntax highlight long lines (helps on large files)
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
set exrc  " Allow per-project Vim configuration


""" Tabbing
set tabstop=4 " Sets tabs to 4 spaces
set shiftwidth=4 " < and > keys indent/unindent 4 spaces
set softtabstop=4 " Treats four spaces as one tab
set shiftround  " use multiple of shiftwidth when indenting with '<' and '>'
set smarttab " Use 'shiftwidth' setting at start of lines
set expandtab " Inserts four spaces with the tab key
set autoindent
set backspace=indent,eol,start " backspace over everything in insert mode

""" Vim files
set nobackup " Don't make backup files
set noswapfile " Don't make .swp files

""" Undo
set undodir=~/.vim/undodir
set undofile " Enable undofiles (store edit history for file)
set undoreload=10000 "maximum lines to save for undo on a buffer reload
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
set smartcase  " Only enforce case-sensitive search if a character is upper-case
set grepprg=ack " Use ack instead of grep

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" Press F4 to toggle highlighting and show current value.
:noremap <F4> :set hlsearch! hlsearch?<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Make Y yank to end of line (consistent with D and C)
nnoremap Y y$

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

" Use arrow keys for moving window
map <Down> 4<C-e>
map <Up> 4<C-y>
map <Left> 4zh
map <Right> 4zl

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=',' " Change the mapleader from \ to ','

" Toggle location and quickfix (Valloric/ListToggle)
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Delete text to the blackhole register
nnoremap <leader><leader>d "_d
vnoremap <leader><leader>D "_D

" Quickly advance through location list
nmap <leader>n :lnext<CR>
nmap <leader>N :lprev<CR>

" vim-git-gutter
" --------------
nmap <leader>c :GitGutterNextHunk<CR>
nmap <leader>C :GitGutterPrevHunk<CR>

" Gundo
" -----
nnoremap <leader>z :GundoToggle<CR>

" TBone
nnoremap <leader>p :Tput<CR>  " Paste the contents of the Tmux buffer
nnoremap <leader>y :Tyank<CR>  " Yank text into the Tmux buffer

" Easymotion
" ----------
" Use ,,<motion> to trigger easymotion
map <Leader> <Plug>(easymotion-prefix)

" fzf (fuzzy file finder)
" (works best with .bashrc configuration to make fzf use Ag)
" Use Ctrl-X and Ctrl-V for splits on selected files/buffers
" ----------------------------------------------------------
" Use 'Rg' to do a `git grep` directly in a buffer
nmap <Leader>r :Rg<CR>
" Simple buffer switching (:buffers, but better)
nmap <Leader>b :Buffers<CR>
" :e on steroids
nmap <Leader>e :Files<CR>
nmap <Leader>m :Marks<CR>
" Exhuberant CTags
nmap <Leader>t :Tags<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
silent! colorscheme jellybeans  " Use silent to quiet first load

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

autocmd BufWritePre *.js,*.html,*.py,*.sql :%s/\s\+$//e " Delete trailing whitespace

" Automatically set textwidth for plaintext and Python source
autocmd FileType text setlocal textwidth=72
autocmd FileType py setlocal textwidth=79

" Resize panes proportionally if the window is resized (useful within tmux)
autocmd VimResized * wincmd =

" Toggle between file and corresponding test file.
function! ToggleTest(path)
    if a:path =~ "_test\.py$"
        let l:other_path = substitute(expand('%'), "_test\.py$", ".py", "")
    elseif a:path =~ "\.py$"
        let l:other_path = substitute(expand('%'), "\.py$", "_test.py", "")
    elseif a:path =~ "\.test\.js$"
        let l:other_path = substitute(expand('%'), "\.test\.js$", ".js", "")
    elseif a:path =~ "\.js$"
        let l:other_path = substitute(expand('%'), "\.js$", ".test.js", "")
    else
        echo "I'm not sure how to toggle " . a:path
        return
    endif
    :execute 'edit' l:other_path
endfunction
nnoremap t<C-t> :call ToggleTest(expand('%'))<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" OS X tweaks
"""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype crontab setlocal nobackup nowritebackup " Makes crontab work

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Prettier
" -------
let g:prettier#exec_cmd_async = 1

" ALE
" ---
let g:ale_fixers = {'python': ['isort']}  " ALEFix will run `isort` on the file
let g:ale_fix_on_save = 1  " Automatically run all fixers on save
let g:ale_linters = {'python': ['pylint']}

let g:ale_lint_on_text_change = "normal" " Don't lint while still in insert mode
let g:ale_lint_delay = 350  " Wait longer before checking for syntax errors

" Vim Markdown
" ------------
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sql', 'javascript']

" javascript-libraries-syntax
" ---------------------------
let g:used_javascript_libs = 'angularjs,jasmine,lodash,jquery'

" Vim-test
" --------

" Clear the contents of the tmux window
function! ClearTmuxPane()
    :call VimuxRunCommand("clear")
    :VimuxClearRunnerHistory
endfunction

nmap <silent> t<C-n> :w<CR>:call ClearTmuxPane()<CR>:TestNearest<CR>
nmap <silent> t<C-f> :w<CR>:call ClearTmuxPane()<CR>:TestFile<CR>
nmap <silent> t<C-s> :w<CR>:call ClearTmuxPane()<CR>:TestSuite<CR>
nmap <silent> t<C-l> :w<CR>:call ClearTmuxPane()<CR>:TestLast<CR>
nmap <silent> t<C-g> :w<CR>:call ClearTmuxPane()<CR>:TestVisit<CR>

" vim-test transformation to run nose tests via `make singletest`.
" If a command looks like "nosetests ...", transform it to "make singletest NOSEARGS='...'"
function! HonorTransform(cmd) abort
    if a:cmd =~ '^nosetests '
        let a:cmd_sans_nosetests = "-s ".substitute(a:cmd, '^nosetests ', '', '')
        let a:new_cmd = 'make singletest TEST_PROCESSES=0 TEST_DB_COUNT=1 NOSEARGS='.shellescape(a:cmd_sans_nosetests)
    else
        let a:new_cmd = a:cmd
    endif
    return a:new_cmd
endfunction

" Put the output of running tests into a tmux pane
let test#strategy = "vimux"

" Force use of nosetest over pytest
let test#python#pytest#file_pattern = '\vMATCH_NOTHING_AT_ALL$'
let test#python#nose#file_pattern = '\v(^|[\b_\.-])[Tt]est.*\.py$'

let g:test#custom_transformations = {'honor': function('HonorTransform')}
let g:test#transformation = 'honor'
