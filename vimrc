" BEGIN Vundle -------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" My bundles:
    Bundle 'kien/ctrlp.vim'
    " requires pylint
    Bundle 'scrooloose/syntastic'
    Bundle 'bitc/vim-bad-whitespace'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'tpope/vim-surround'
    Bundle 'altercation/vim-colors-solarized'
    " requires compilation and recent vim
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'wting/rust.vim'
    Bundle 'ledger/vim-ledger'
    Bundle 'ConradIrwin/vim-bracketed-paste'
filetype plugin indent on
 " END Vundle ---------------------------------------------

" enable spell checking
set spell

" switch tabs with tj/tk
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

set background=dark
colorscheme solarized

" make save/quit work while accidentally pressing shift
cabbr Q quit
cabbr W write

" don't show annoying jedi scratch window for docstrings
set completeopt=menu,menuone,longest

" use syntax highlighting
syntax on

" highlight the current line light gray
set cursorline
hi CursorLine cterm=none ctermbg=254 guibg=Gray89

" make backspace work as expected
set backspace=indent,eol,start

" read filetype-specific indent files
filetype indent plugin on

" comma-separated list of file patterns to ignore when autocompleting
set wildignore=*.pyc,*.class

" put tmp files in central location
set backupdir=~/.vimbackup/
set directory=~/.vimbackup/

" options required for vim-powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" reduce lagginess of some operations
" also affects some key combos like surround's, so don't make too low
set timeoutlen=200

" make leaving insert mode with powerline quicker
" from https://powerline.readthedocs.org/en/latest/tipstricks.html
if ! has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" use 2 levels of indent folding
set foldmethod=indent
set foldnestmax=2
set nofoldenable " unfold by default

" use the X clipboard (requires vim from vim-gnome package for xterm_clipboard support
set clipboard=unnamedplus

" for python files, draw line at margin
autocmd FileType python setlocal colorcolumn=79 | highlight ColorColumn guibg=orange

" for html/javascript/css use 2 space indent
autocmd Filetype html,javascript,css setlocal shiftwidth=2 | setlocal softtabstop=2

" for go, use tabs indentation and do not highlight tabs
autocmd FileType go setlocal noexpandtab | setlocal shiftwidth=8 | setlocal softtabstop=8 | setlocal nolist

" auto format go files (requires Syntastic)
"autocmd FileType go autocmd BufWritePre <buffer> Fmt

" treat *.md as markdown
au BufRead,BufNewFile *.md set filetype=markdown

" only run syntastic manually on F12, clear syntastic on F10
let g:syntastic_mode_map = { 'mode': 'passive' }
map <F12> :SyntasticCheck<CR>
map <F10> :SyntasticReset<CR>

" style all syntastic signs as 'todo' except errors
highlight link SyntasticErrorSign error
highlight link SyntasticWarningSign todo
highlight link SyntasticStyleWarningSign todo
highlight link SyntasticStyleErrorSign todo

" use fat arrow for syntastic signs
let g:syntastic_error_symbol = '➔'
let g:syntastic_style_error_symbol = '➔'
let g:syntastic_warning_symbol = '➔'
let g:syntastic_style_warning_symbol = '➔'

" always run all syntastic checkers
let g:syntastic_aggregate_errors = 1

" for python, use pylint and pep8 checkers
let g:syntastic_python_checkers = ['pylint', 'pep8']

" keep 5 lines of context above and below the cursor
set scrolloff=5

" indicate tabs
set list listchars=tab:→\ 

" enable search highlighting
set hlsearch

" enable search-as-you-type
set incsearch

" map space to clear search highlight
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" ignore case when searching, except when pattern contains capital
set ignorecase
set smartcase

" use spaces for indentation
set expandtab
set shiftwidth=4
set softtabstop=4

" auto indent
set autoindent

" show line numbers
set number

" allow repeated indentation in visual mode
vnoremap < <gv
vnoremap > >gv

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
