call plug#begin('~/.vim/plugged')
"-------------

" vim-lsp - can not use goto definitino
" Plug 'prabirshrestha/vim-lsp'
" Plug 'mattn/vim-lsp-settings'

" AutoComplete
" Plug 'prabirshrestha/asyncomplete.vim'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'
"
" ColorScheme
Plug 'morhetz/gruvbox'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" NerdTree
Plug 'preservim/nerdtree' 

" Python
" coc-python 
Plug 'neoclide/coc.nvim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" fzf preview color
Plug 'sharkdp/bat'

" Git
Plug 'tpope/vim-fugitive'

"-------------
" Plugin end
call plug#end()

let mapleader=','

" Color Scheme
colo gruvbox
set bg=dark

filetype plugin on
filetype plugin indent on

syntax on
set number
set hidden

" Buffer
" move to next buffer 
nmap <leader>l :bnext<CR>
" move to previous buffer 
nmap <leader>h :bprevious<CR>
" close buffer
nmap <leader>bq :bp <BAR> bd #<CR>
" buffer status
nmap <leader>bl :ls<CR>

" Vim-lsp
" goto
nmap <leader>d :LspTypeDefinition<CR>
nmap <leader>o :LspPeekTypeDefinition<CR>

" Airline
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

" NerdTree
nmap <leader>n :NERDTreeToggle<CR>

" COC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" GoTo code navigation.
nmap <silent> <leader>d <Plug>(coc-definition)
nmap <silent> <leader>y <Plug>(coc-type-definition)
nmap <silent> <leader>i <Plug>(coc-implementation)
nmap <silent> <leader>r <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" FZF
let g:fzf_preview_window = 'right:60%'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

map <leader>F :Files<CR>
map <leader>R :Rg<CR>
