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

"-------------
" Plugin end
call plug#end()

let mapleader=','

" FZF
map <leader>F :Files<CR>
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
let g:airline_theme = 'gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'
