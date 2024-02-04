" BEGIN Vundle -------------------------------------------------------
set nocompatible
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'
" My bundles:
    Bundle 'junegunn/fzf'
    Bundle 'bitc/vim-bad-whitespace'
    Bundle 'lifepillar/vim-solarized8'
    Bundle 'rust-lang/rust.vim'
    Bundle 'ledger/vim-ledger'
    Bundle 'lifepillar/vim-mucomplete'
    Bundle 'Vimjas/vim-python-pep8-indent'
    Bundle 'tpope/vim-markdown'
    Bundle 'Chiel92/vim-autoformat'
    Bundle 'dkarter/bullets.vim'
filetype plugin indent on
" END Vundle ---------------------------------------------

" bullets.vim
let g:bullets_outline_levels = ['num', 'abc', 'std*']
let g:bullets_nested_checkboxes = 0

" show error when formatter fails
let g:autoformat_verbosemode=1

" set enabled formatters
let g:formatters_python = ['black']
let g:formatters_go = ['gofmt_2']

" disable fallbacks when formatter fails
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" bind Autoformat (black, rustfmt, etc.) to F12
nnoremap <F12> :Autoformat<CR>

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

" run FZF on ctrl-p
map <C-P> :FZF<CR>

" enable spell checking
set spell

" don't highlight the first word of a sentence if it's uncapitalized
set spellcapcheck=""

" switch tabs with tj/tk
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>

" enable true colour
set termguicolors

" workaround for true colour in tmux
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
let g:solarized_statusline = "flat"
colorscheme solarized8

" make save/quit work while accidentally pressing shift
cabbr Q quit
cabbr W write

" use syntax highlighting
syntax on

" highlight the current line
set cursorline

" override colour scheme for misspelled words
highlight clear SpellBad
highlight SpellBad   gui=undercurl cterm=underline

" make backspace work as expected
set backspace=indent,eol,start

" comma-separated list of file patterns to ignore when autocompleting
set wildignore=*.pyc,*.class

" put tmp files in central location (need to create directories manually)
set backupdir=~/.cache/vim/backup
set directory=~/.cache/vim/swap

set laststatus=2   " Always show the statusline

" statusline contents
set statusline=
set statusline+=%f " filename
set statusline+=%m " modified flag
set statusline+=%h " help buffer flag
set statusline+=%r " read-only flag
set statusline+=%= " align right
set statusline+=%p%% " percentage through file
set statusline+=\ %l/%L " line number / number of lines
set statusline+=\ %c " column number

set encoding=utf-8 " Necessary to show Unicode glyphs
set t_Co=256 " Explicitly tell Vim that the terminal supports 256 colors

" disable modelines for security (enabled by nocompatible)
set nomodeline

" reduce lagginess of some operations
" also affects some key combos like surround's, so don't make too low
set timeoutlen=200

" use the X clipboard (requires vim from vim-gnome package for xterm_clipboard support
set clipboard=unnamedplus

" for html, javascript, css, proto, yaml use 2 space indent
autocmd Filetype html,javascript,css,proto,yaml
    \ setlocal tabstop=2 softtabstop=2 shiftwidth=2

" for yaml, don't indent line when inserting comment
autocmd FileType yaml setlocal indentkeys-=0#

" for go, use 2 space tab indentation
autocmd FileType go setlocal noexpandtab tabstop=4 shiftwidth=4 nolist

" for text files, wrap lines on word boundary
autocmd FileType text,markdown setlocal linebreak

" colour markdown code differently than normal text
hi def link markdownCode String

" join lines with single space after period instead of double
set nojoinspaces

" keep 5 lines of context above and below the cursor
set scrolloff=5

" indicate tabs without changing background colour
set list listchars=tab:→\ 
hi SpecialKey ctermbg=NONE guibg=NONE

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

" continue visual indent for wrapped lines
set breakindent

" add hanging indent for lists detected by formatlistpat
set breakindentopt=list:-1

" show line numbers
set number

" allow repeated indentation in visual mode
vnoremap < <gv
vnoremap > >gv

" configure netrw (:Ex or :Tex)
let g:netrw_banner = 0      " disable banner
let g:netrw_liststyle = 3   " use tree style
