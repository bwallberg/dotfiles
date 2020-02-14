" VIM-PLUG
call plug#begin(stdpath('data') . '/plugged')

Plug 'preservim/nerdtree'
Plug 'scrooloose/nerdcommenter'
" user-interface
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'thaerkh/vim-workspace'
Plug 'dyng/ctrlsf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'yuttie/comfortable-motion.vim'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" auto close brackets
Plug 'jiangmiao/auto-pairs'

" code
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'heavenshell/vim-jsdoc'
call plug#end()

" PYTHON INTEGRATION
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" CODE
" CoC extensions 
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-eslint']

" JS Syntax
let g:javascript_plugin_jsdoc = 1

" TABS & SPACES
set tabstop=2
set shiftwidth=2
set softtabstop=0
set smarttab
set wrap!
set autoindent
set smartindent

" SEARCH
set hlsearch
set smartcase
set ignorecase

" UI
set hidden
set number
set showmatch
colorscheme nord
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
   
" KEYMAP
let mapleader = ','

" Switch between buffers
map <silent> <C-a> :bprev<CR>
map <silent> <C-s> :bnext<CR>
map <silent> <C-q> :bd<CR>

" Toggle modes using tilde
nmap <silent> § :startinsert<CR>
imap <silent> § <esc>
vmap <silent> § <esc>
tnoremap <silent> <esc> <C-\><C-n>

" configure smooth scrolling using comfortable motion
let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"
let g:comfortable_motion_no_default_key_mappings = 1
nnoremap <silent> <C-j> :call comfortable_motion#flick(100)<CR>
nnoremap <silent> <C-k> :call comfortable_motion#flick(-100)<CR>

" disable arrow keys in normal mode
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Jump between empty lines down & up
map <silent> <C-space> {
map <silent> <space> }

" vim-workspace
let g:workspace_session_disable_on_args = 1
let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'

"LeaderF
map <silent> <C-p> :Leaderf file --popup<CR>
map <silent> <S-p> :Leaderf command --popup<CR>
let g:Lf_CommandMap = {'<C-X>': ['<C-v>'], '<C-]>': ['<C-h>']}

" Switch Session
map <leader>p :source ~/.config/nvim/sessions/

" clear highlights after search by pressing esc
nnoremap <esc> :noh<return><esc>

" NerdTree
nmap <silent> <leader>k :NERDTreeToggle<CR>
nmap <silent> <leader>y :NERDTreeFind<CR>

" Ctrlf
map <C-f> :CtrlSF
