" VIM-PLUG
call plug#begin(stdpath('data') . '/plugged')

Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'thaerkh/vim-workspace'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" auto close brackets
Plug 'jiangmiao/auto-pairs'

" autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" PYTHON INTEGRATION
let g:python2_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" TABS & SPACES
set tabstop=2
set shiftwidth=2
set softtabstop=0
set smarttab

" UI
set number

" KEYMAP
let mapleade = ','

" disable arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" LeaderF
map <silent> <C-p> :Leaderf file --popup<CR>
map <silent> <S-p> :Leaderf command --popup<CR>

" clear highlights after search by pressing esc
nnoremap <esc> :noh<return><esc>

" NerdTree
nmap <silent> <leader>k :NERDTreeToggle<CR>
nmap <silent> <leader>y :NERDTreeFind<CR>
