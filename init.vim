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

