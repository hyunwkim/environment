" Plugins
call plug#begin('~/.vim/plugged')
"-------------
" ColorScheme
Plug 'morhetz/gruvbox'

" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'sheerun/vim-polyglot'

" Syntax Helper
Plug 'scrooloose/syntastic'
if has('python2')
    Plug 'Rykka/riv.vim'
endif

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" LanguageClient-neovim
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

"-------------
" Plugin end
call plug#end()

let mapleader=','

" FZF
map <leader>F :Files<CR>
map <leader>R :Rg<CR>
let g:fzf_preview_window = 'right:60%'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Color scheme
colo gruvbox
set bg=dark

filetype plugin on
filetype plugin indent on

syntax on
set number

" Airline
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

" LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'python': ['/home/hyun/.pyenv/shims/pyls'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
