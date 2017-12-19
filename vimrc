" BEGIN Vundle -------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" My bundles:
    Bundle 'ctrlpvim/ctrlp.vim'
    Bundle 'benekastah/neomake'
    Bundle 'bitc/vim-bad-whitespace'
    Bundle 'vim-airline/vim-airline'
    Bundle 'vim-airline/vim-airline-themes'
    Bundle 'tpope/vim-surround'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'Valloric/YouCompleteMe'
    Bundle 'rust-lang/rust.vim'
    Bundle 'ledger/vim-ledger'
    Bundle 'ConradIrwin/vim-bracketed-paste'
filetype plugin indent on
" END Vundle ---------------------------------------------

" run Neomake on F12
map <F12> :Neomake<CR>

" set appearance of Neomake signs
let g:neomake_error_sign = { 'text': '➔', 'texthl': 'error' }
let g:neomake_warning_sign = { 'text': '➔', 'texthl': 'todo' }

" set airline theme
let g:airline_theme='luna'

" hide airline section separators
let g:airline_left_sep=''
let g:airline_right_sep=''

" only enable the airline extensions I want
let g:airline_extensions = ['ctrlp', 'neomake']

" hide most status line clutter
let g:airline_section_a = ''        " hide mode indicator
let g:airline_section_x = ''        " hide filetype
let g:airline_section_y = ''        " hide file encoding

" make ctrlp default to mixed mode
let g:ctrlp_cmd = "CtrlPMixed"

" only show MRU files in the working directory
let g:ctrlp_mruf_relative = 1

" have ctrlp use ag for searching, this is faster and respects .gitignore
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" enable spell checking
set spell

" don't highlight the first word of a sentence if it's uncapitalized
set spellcapcheck=""

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

" disable call signatures since the popup is buggy
"let g:jedi#show_call_signatures = 0

" use syntax highlighting
syntax on

" highlight the current line
set cursorline

" make backspace work as expected
set backspace=indent,eol,start

" read filetype-specific indent files
filetype indent plugin on

" comma-separated list of file patterns to ignore when autocompleting
set wildignore=*.pyc,*.class

" put tmp files in central location
set backupdir=~/.vimbackup/
set directory=~/.vimbackup/

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
autocmd FileType python setlocal colorcolumn=79 | highlight ColorColumn guibg=orange

" for html, javascript, css, proto use 2 space indent
autocmd Filetype html,javascript,css,proto setlocal shiftwidth=2 | setlocal softtabstop=2

" for go, use tabs indentation and do not highlight tabs
autocmd FileType go setlocal noexpandtab | setlocal shiftwidth=8 | setlocal softtabstop=8 | setlocal nolist

" treat *.md as markdown
au BufRead,BufNewFile *.md set filetype=markdown

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
