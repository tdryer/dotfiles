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
    " requires compilation and recent vim
    Bundle 'Valloric/YouCompleteMe'
filetype plugin indent on
 " END Vundle ---------------------------------------------

 " don't show annoying jedi scratch window for docstrings
set completeopt=menu,menuone,longest

 " this would be useful except it autoselects an option
 " related to https://github.com/davidhalter/jedi-vim/issues/86
let g:jedi#popup_on_dot = 0

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

" use 2 levels of indent folding
set foldmethod=indent
set foldnestmax=2
set nofoldenable " unfold by default

" use the X clipboard (requires vim from vim-gnome package for xterm_clipboard support
set clipboard=unnamedplus

" for python files, draw line at margin
autocmd FileType python set colorcolumn=79 | highlight ColorColumn guibg=orange

" check for syntax errors on open as well as on save
let g:syntastic_check_on_open=1

" disable naming, inlined supression warnings for syntastic/pylint
let g:syntastic_python_pylint_args=" -f parseable -r n -i y --disable=C0103 --disable=I0011"

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
