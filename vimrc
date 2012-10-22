" enable pathogen to manage plugins
call pathogen#infect()

" options required for vim-powerline
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" reduce lagginess of some operations
set timeoutlen=100

" use 2 levels of indent folding
set foldmethod=indent
set foldnestmax=2

" use the X clipboard (requires vim from vim-gnome package for xterm_clipboard support
set clipboard=unnamedplus

" for python files, draw line at margin
autocmd FileType python set colorcolumn=79 | highlight ColorColumn ctermbg=cyan guibg=orange

" check for syntax errors on open as well as on save
let g:syntastic_check_on_open=1

" disable naming warnings for syntastic/pylint
let g:syntastic_python_checker_args="--disable=C0103"

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
