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
filetype plugin indent on
 " END Vundle ---------------------------------------------

 " switch tabs with tj/tk
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

set background=dark
colorscheme solarized

" make save/quit work while accidentially pressing shift
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
set wildignore=*.pyc

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
autocmd FileType python set colorcolumn=79 | highlight ColorColumn guibg=orange

" for html/javascript/css use 2 space indent
autocmd Filetype html,javascript,css set shiftwidth=2 | set softtabstop=2

" check for syntax errors on open as well as on save
let g:syntastic_check_on_open=1

" use both MRI and rubocop checkers for Ruby
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

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
