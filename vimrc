" enable pathogen to manage plugins
call pathogen#infect()

" use the X clipboard (requires vim from vim-gnome package for xterm_clipboard support
set clipboard=unnamedplus

" enable search-as-you-type
set incsearch

" for python files, draw line at margin
autocmd FileType python set colorcolumn=79 | highlight ColorColumn ctermbg=cyan guibg=orange

" check for syntax errors on open as well as on save
let g:syntastic_check_on_open=1

" disable naming warnings for syntastic/pylint
let g:syntastic_python_checker_args="--disable=C0103"

" keep 5 lines of context above and below the cursor
set scrolloff=5

" use Ctrl+L to toggle relative line numbering
function! g:ToggleNuMode()
    if &nu == 1
        set rnu
    else
        set nu
    endif
endfunction
nnoremap <silent><C-L> :call g:ToggleNuMode()<cr>

" indicate tabs
set list listchars=tab:→\ 

" enable search highlighting
set hlsearch

" map space to clear search highlight
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" use spaces for indentation
set expandtab
set shiftwidth=4
set softtabstop=4

" auto indent
set autoindent

" show line numbers
set number

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
