" Plugins
call plug#begin('~/.vim/plugged')
"-------------

" FZF
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

"-------------
" Plugin end
call plug#end()

set number

let mapleader=','

" FZF
map <leader>F :Files<CR>
let g:fzf_preview_window = 'right:60%'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)
