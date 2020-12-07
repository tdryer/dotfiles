" BEGIN Vundle -------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" My bundles:
    Bundle 'junegunn/fzf'
    Bundle 'benekastah/neomake'
    Bundle 'bitc/vim-bad-whitespace'
    Bundle 'vim-airline/vim-airline'
    Bundle 'vim-airline/vim-airline-themes'
    Bundle 'tpope/vim-surround'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'rust-lang/rust.vim'
    Bundle 'ledger/vim-ledger'
    Bundle 'lifepillar/vim-mucomplete'
    Bundle 'sirtaj/vim-openscad'
    Bundle 'Vimjas/vim-python-pep8-indent'
    Bundle 'tpope/vim-markdown'
filetype plugin indent on
" END Vundle ---------------------------------------------

" enable bracketed paste mode in screen/tmux (see :help xterm-bracketed-paste)
if &term =~ "screen"
      let &t_BE = "\e[?2004h"
      let &t_BD = "\e[?2004l"
      exec "set t_PS=\e[200~"
      exec "set t_PE=\e[201~"
endif

" always show completion popup menu, but do not select a match
set completeopt=menuone,noselect

" only scan open buffers for completions
set complete=.,w,b

" disable ins-completion messages
set shortmess+=c

" disable bell caused by ins-completion
set belloff+=ctrlg

" enable autocompletion using mucomplete and ins-completion
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#chains = { 'default': ['c-n'] }

" run Neomake on F12
map <F12> :Neomake<CR>

" run FZF on ctrl-p
map <C-P> :FZF<CR>

" set appearance of Neomake signs
let g:neomake_error_sign = { 'text': '➔', 'texthl': 'error' }
let g:neomake_warning_sign = { 'text': '➔', 'texthl': 'todo' }

" set airline theme
let g:airline_theme='luna'

" hide airline section separators
let g:airline_left_sep=''
let g:airline_right_sep=''

" only enable the airline extensions I want
let g:airline_extensions = ['neomake']

" hide most status line clutter
let g:airline_section_a = ''        " hide mode indicator
let g:airline_section_x = ''        " hide filetype
let g:airline_section_y = ''        " hide file encoding

" remove ugly symbols
let g:airline_symbols = {}
let g:airline_symbols.linenr = ':'
let g:airline_symbols.maxlinenr = ''

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

" use syntax highlighting
syntax on

" highlight the current line
set cursorline

" make backspace work as expected
set backspace=indent,eol,start

" comma-separated list of file patterns to ignore when autocompleting
set wildignore=*.pyc,*.class

" put tmp files in central location
set backupdir=~/.vimbackup/
set directory=~/.vimbackup/

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" disable modelines for security (enabled by nocompatible)
set nomodeline

" reduce lagginess of some operations
" also affects some key combos like surround's, so don't make too low
set timeoutlen=200

" use the X clipboard (requires vim from vim-gnome package for xterm_clipboard support
set clipboard=unnamedplus

" for python files, draw line at margin
autocmd FileType python setlocal colorcolumn=79 | highlight ColorColumn guibg=orange

" for html, javascript, css, proto, yaml use 2 space indent
autocmd Filetype html,javascript,css,proto,yaml
    \ setlocal tabstop=2 softtabstop=2 shiftwidth=2

" for text files, wrap lines on word boundary
autocmd FileType text,markdown setlocal linebreak

" colour markdown code differently than normal text
hi def link markdownCode        String
hi def link markdownCodeBlock   String

" join lines with single space after period instead of double
set nojoinspaces

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

" configure netrw (:Ex or :Tex)
let g:netrw_banner = 0      " disable banner
let g:netrw_liststyle = 3   " use tree style
