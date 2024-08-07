""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically install if not present
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
                \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" Markdown
" (requires daemon: `npm install -g instant-markdown-d`)
Plug 'suan/vim-instant-markdown', { 'for': 'markdown' }  " Live rendering when editing Markdown

" Git
Plug 'tpope/vim-fugitive'  " Interact with Git within Vim (e.g. `:G blame` for a blame buffer)
Plug 'tpope/vim-rhubarb'   " GitHub integration for fugitive (killer feature: `:GBrowse` to link selected lines)

" Miscellaneous TPope
Plug 'tpope/vim-abolish'     " Convert between camelCase, snake_case, PascalCase (& lots more)
Plug 'tpope/vim-commentary'  " Comment & uncomment lines in any language (gc + selection)
Plug 'tpope/vim-repeat'      " Make the dot operator (repeat last action) work with mappings
Plug 'tpope/vim-surround'    " Interact with surrounding punctuation, HTML tags, etc.

" Tmux
Plug 'tpope/vim-tbone'  " Basic Tmux integration (killer feature: access Tmux buffers -- `:Tyank`, `:Tput`)
Plug 'benmills/vimux'   " Interact with Tmux panes from Vim buffer (killer feature: running tests in another pane!)

" Movement
Plug 'bogado/file-line'           " `vim path/to/file.py:42` opens file with cursor at that line
Plug 'easymotion/vim-easymotion'  " Motions on steroids. <leader>w tags each word - type tag to move

" Fuzzy-finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }  " Install fzf (fuzzy finder for files, tags, etc)
Plug 'junegunn/fzf.vim'  " Intreact with FZF in Vim (:Files, :Tags, and :Buffers). Works best with ripgrep!

" Colorschemes
Plug 'nanotech/jellybeans.vim'  " colorful scheme for dark backgrounds

" Language & syntax
Plug 'sheerun/vim-polyglot'  " sane language packs for each language
Plug 'dense-analysis/ale'  " asynchronous linting, easy invocation of autoformatters/fixers (Black, isort, Prettier, others)

" Testing
Plug 'vim-test/vim-test'  " Run unit tests in a file, class, or method. Pairs great with vimux.

" Miscellaneous
Plug 'Valloric/ListToggle' " Tiny plugin to make <leader>l and <leader>q toggle location & quickfix windows

" Enable matchit.vim (shipped with Vim) for matching HTML tags, if/else blocks, etc. with `%`
runtime! macros/matchit.vim


" Add plugins to &runtimepath
call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""
" General options
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible " Not vi compatible (affects other settings)

""" Syntax
filetype plugin indent on " 'on': Enables filetype detection
                          " 'plugin': Enables file-specific plugins
                          " 'indent': Indent files
syntax on " Turns on syntax highlighting
set synmaxcol=200 " Don't syntax highlight long lines (helps on large files)

""" General
set ruler " Always show current position
set number " Turn on (absolute) line numbers
set vb t_vb= " Flash screen in place of beeps
set showcmd " Show command being typed
set showmatch " Show matching brackets
set autoread " Read file again if it's been changed elsewhere (but not changed in Vim)
set splitright " Vertical splits open to the right
set splitbelow " Horizontal splits open to the bottom
set exrc " Allow per-project Vim configuration (NOTE: there are security concerns here)
set list listchars=trail:·,tab:»· " Display tab literals and trailing whitespace
set nostartofline " Don't change column when jumping to other lines

""" Tabbing
set tabstop=4 " Sets tabs to 4 spaces
set shiftwidth=4 " < and > keys indent/unindent 4 spaces
set softtabstop=4 " Treats four spaces as one tab
set shiftround " Use multiple of shiftwidth when indenting with '<' and '>'
set smarttab " Use 'shiftwidth' setting at start of lines
set expandtab " Insert four spaces with the tab key
set autoindent  " Copy indent from current line when starting a new line
set smartindent " Smart autoindenting on new lines (should be used with `autoindent`)
set backspace=indent,eol,start " Backspace over everything in insert mode

""" Vim files
set nobackup " Don't make backup files
set noswapfile " Don't make .swp files

""" Undo
set undodir=~/.vim/undodir
set undofile " Enable undofiles (store edit history for file)
set undoreload=10000 " Maximum lines to save for undo on a buffer reload
set undolevels=1000 " Maximum number of changes that can be undone

""" Joining
set nowrap " No line wrapping
set nojoinspaces " Only insert one space after sentences in join operations
set formatoptions+=j " Delete comment character when joining commented lines

""" Wild menu
set wildmenu
set wildmode=list:longest " Makes file completion behave more like bash
set wildignore=*.o,*.a,*.swp,*.bak,*.pyc,*.class " Ignore certain file types


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
"""""""""""""""""""""""""""""""""""""""""""""""""""
set incsearch " Search as you type
set hlsearch " Highlight search term in text
set ignorecase " All lower case strings are case insensitive by default
set smartcase " Only enforce case-sensitive search if a character is upper-case
" Use case-sensitive search (exact string match) when `*` is used
nnoremap * :call feedkeys("/\\C\\<" . expand("<cword>") . "\\>\r")<CR>
nnoremap # :call feedkeys("?\\C\\<" . expand("<cword>") . "\\>\r")<CR>

" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""
" Remappings
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Simple shortcuts to make a Markdown heading level 1 or 2
" (Uses the underlining syntax, since `#` is a comment in Git commits)
nnoremap g1 yypVr=
nnoremap g2 yypVr-

" Make Y yank to end of line (consistent with D and C)
nnoremap Y y$

" Simpler window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" CTags
" Remap the default "move to tag definition" to <Ctrl>-n because:
" - <C-]> is hard to type on keyboardio
" - <C-N> does nothing useful in normal mode
" - On Dvorak, <C-N> is right next to its CTags complement <C-T>
nnoremap <C-N> <C-]>

" Toggle line numbers and fold column for easy copying:
imap <silent> <F2> <Esc>:set nonumber!<CR>:set foldcolumn=0<CR>a
nnoremap <silent> <F2> :set nonumber!<CR>:set foldcolumn=0<CR>
set pastetoggle=<F3> " Deactivates tabbing behavior to paste reasonably

" Use w!! to write to files where sudo status is needed
cmap w!! w !sudo tee % >/dev/null

" Use ipdb for debugging
" TODO: Filetype:
" - JS: debugger
:map <F10> o__import__('pdb').set_trace()<CR><Esc>
imap <F10> __import__('pdb').set_trace()<Esc>

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

" Run an arbitrary Git command (trailing space is intentional!)
nmap <leader>g :Git 
" Show Git blame in the buffer, ignoring whitespace and moves
nmap <leader>h :Git blame -w -M --date=short<CR>

" Toggle location and quickfix (Valloric/ListToggle)
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Delete text to the blackhole register
nnoremap <leader>d "_d
vnoremap <leader>D "_D

" Close (and delete!) all other buffers but the current one
command! BufOnly execute '%bdelete|edit #|normal `"'
nmap <Leader>o :BufOnly<CR>

" Quickly advance through location list
nmap <leader>n :lnext<CR>
nmap <leader>N :lprev<CR>

" TBone
" -----
" Paste the contents of the Tmux buffer
nnoremap <leader>p :Tput<CR>
" Yank text into the Tmux buffer
nnoremap <leader>y :Tyank<CR>
vnoremap <leader>y :Tyank<CR>

" Fugitive
" --------
"
" Easily select link to current file, writing to copy register
" WARNING: This is a no-op unless Vim was compiled with clipboard (`:echo has('clipboard'))
" The `vim` package on Ubuntu has no X deps. The easiest workaround is to install `vim-gtk`.
nnoremap <leader>c :GBrowse!<CR>
" (Also populate the code into the Tmux buffer)
vnoremap <leader>c :Tyank<CR>:'<,'>GBrowse!<CR>
" (leader cc would be more idiomatic, but that imposes a delay on leader c)
nnoremap <leader>C :.GBrowse!<CR>

" Easymotion
" ----------
" Use ,,<motion> to trigger easymotion
map <Leader> <Plug>(easymotion-prefix)

" fzf (fuzzy file finder)
" (works best with .zshrc configuration to make fzf use ripgrep)
" Use Ctrl-X and Ctrl-V for splits on selected files/buffers
" ----------------------------------------------------------
" I find the preview window to be a bit distracting, and not very performant
let g:fzf_preview_window = ''
" Use 'Rg' to do a `git grep` directly in a buffer
nmap <Leader>r :Rg<CR>
nmap <leader>f :RFC<CR>
" Simple buffer switching (:buffers, but better)
nmap <Leader>b :Buffers<CR>
" :e on steroids
nmap <Leader>e :Files<CR>
nmap <Leader>m :Marks<CR>
" Exhuberant CTags
nmap <Leader>t :Tags<CR>

" Custom Rg command to use ripgrep, but ignore the filename in searches
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
  \           : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
  \   <bang>0)

" Custom Rg function to use ripgrep, but ignore the filename in searches
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -tpy -tjs -tts -tcss -trust -tmake -tmd -tsh -tc -tcpp %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let options = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(options, 'right:50%:hidden'), a:fullscreen)
endfunction

command! -nargs=1 -bang RF call RipgrepFzf(<q-args>, <bang>0)
command! -nargs=0 -bang RFC call RipgrepFzf(expand("<cword>"), 0)

" Use git grep + FZF to search only files tracked in the Git repository (searching from git root)
command! -bang -nargs=* FZFGitGrep
  \ call fzf#vim#grep(
  \   'git grep --color=always --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview(
  \       {
  \           'options': '--delimiter : --nth 4..',
  \           'dir': systemlist('git rev-parse --show-toplevel')[0],
  \       },
  \       'right:50%:hidden', '?'
  \   )
  \ )

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""

set background=dark
silent! colorscheme jellybeans " Use silent to quiet first load

" Disable the colorscheme's default background on common syntax groups
" This lets Tmux control the bg on Vim panes (not just normal shell panes)
" Terminal emulators (e.g. iTerm) should also set jellybean's bg (#151515)
" It's important that some groups be left alone (e.g. DiffAdd/DiffDelete)
highlight Normal ctermbg=NONE
highlight NonText ctermbg=NONE
highlight SignColumn ctermbg=NONE
highlight LineNr ctermbg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""
" .rc files
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically resource .vimrc after changes
autocmd! BufWritePost .vimrc source %

" Resource .vimrc (useful in other instances of Vim)
nnoremap <F5> :so ~/.vimrc <Esc>

" Automatically resource .tmux.conf after changes (requires vim-tbone)
" NB: This does not completely refresh settings! (a server restart is required)
" `silent` suppresses output to avoid 'Press enter or type command' prompt
autocmd! BufWritePost .tmux.conf silent Tmux source-file ~/.tmux.conf

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""

set modelines=0 " Closes a small vulnerability (see options.txt)

" Always enable spellcheck on certain file types
autocmd BufRead COMMIT_EDITMSG set spell
autocmd BufNewFile,BufRead *.md,*.markdown set spell

autocmd BufWritePre *.js,*.html,*.md,*.py,*.sql :%s/\s\+$//e " Delete trailing whitespace

" Automatically set textwidth for plaintext and Python source
autocmd FileType text setlocal textwidth=72
autocmd FileType py setlocal textwidth=88  " (mostly consistent with Black)

" Resize panes proportionally if the window is resized (useful within tmux)
autocmd VimResized * wincmd =

function! GetTestFile(path)
    if a:path =~ "_test\.py$"
        return substitute(expand('%'), "_test\.py$", ".py", "")
    elseif a:path =~ "\.py$"
        return substitute(expand('%'), "\.py$", "_test.py", "")
    elseif a:path =~ "\.test\.js$"
        return substitute(expand('%'), "\.test\.js$", ".js", "")
    elseif a:path =~ "\.js$"
        return substitute(expand('%'), "\.js$", ".test.js", "")
    elseif a:path =~ "\.tsx$"
        return substitute(expand('%'), "\.tsx$", ".test.js", "")
    else
        echo "I'm not sure how to toggle " . a:path
        return a:path
    endif
endfunction

" Add file (or its test file) to the buffers, open up buffer for split
function! BufferToggleTest(path)
    let l:other_path = GetTestFile(a:path)
    :execute 'badd' l:other_path
endfunction

" Toggle between file and corresponding test file.
function! ToggleTest(path)
    let l:other_path = GetTestFile(a:path)
    :execute 'edit' l:other_path
endfunction

nnoremap t<C-t> :call ToggleTest(expand('%'))<CR>
nnoremap b<C-t> :call BufferToggleTest(expand('%'))<CR>:Buffers<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""
" OS X tweaks
"""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd filetype crontab setlocal nobackup nowritebackup " Makes crontab work
let g:netrw_browsex_viewer = "open"  " Enables :GBrowse to use default browser

"""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""

" Instant markdown
" ----------------
let g:instant_markdown_autostart = 0  " Don't automatically start daemon & open browser

" Fugitive
" --------
" (Fugitive *used* to automatically look in `.git` for tags, but we must now explicitly modify)
set tags ^=./.git/tags;  " Semicolon is significant: will traverse up relative directories

" netrw
" -----
let g:netrw_dirhistmax = 0  " Don't store history in .netrwhist

" Prettier
" -------
let g:prettier#exec_cmd_async = 1

" ALE
" ---
let g:ale_fixers = {'python': ['isort'], 'rust': ['rustfmt']}
let g:ale_fix_on_save = 1 " Automatically run all fixers on save
let g:ale_linters = {'python': ['pylint']}
let g:ale_lint_on_text_changed = "normal" " Don't lint while still in insert mode
let g:ale_lint_delay = 350 " Wait longer before checking for syntax errors

" Vim Markdown
" ------------
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'sql', 'javascript']

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

" Put the output of running tests into a tmux pane
let test#strategy = "vimux"
