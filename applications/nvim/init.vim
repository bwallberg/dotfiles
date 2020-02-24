" VIM-PLUG
call plug#begin(stdpath('data') . '/plugged')

" filemanager
Plug 'preservim/nerdtree'

" navigation
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'thaerkh/vim-workspace'
Plug 'dyng/ctrlsf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'yuttie/comfortable-motion.vim'

" UI
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'arcticicestudio/nord-vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" code syntax & autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" comments
Plug 'scrooloose/nerdcommenter'
Plug 'heavenshell/vim-jsdoc'

call plug#end()

" PYTHON INTEGRATION
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'

" CODE

" coc
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-eslint']

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" JS Syntax
let g:javascript_plugin_jsdoc = 1

" TABS & SPACES
set tabstop=2
set shiftwidth=2
set softtabstop=0
set smarttab
set wrap!

" SEARCH
set hlsearch
set smartcase
set ignorecase

" UI
set hidden
set number
set showmatch

let g:lightline = {
      \ 'colorscheme': 'nord',
      \ }

let g:nord_italic = 1
let g:nord_underline = 1
let g:nord_italic_comments = 1
colorscheme nord

" vim-workspace
let g:workspace_session_disable_on_args = 1
let g:workspace_session_directory = $HOME . '/.config/nvim/sessions/'
let g:workspace_persist_undo_history = 0

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
nmap <silent> <C-space> {
nmap <silent> <space> }
vmap <silent> <C-space> {
vmap <silent> <space> }

" Move selected lines up & down
nnoremap <silent> <S-j> :m .+1<CR>==
nnoremap <silent> <S-k> :m .-2<CR>==
vnoremap <silent> <S-j> :m '>+1<CR>gv=gv
vnoremap <silent> <S-k> :m '<-2<CR>gv=gv


"LeaderF
map <silent> <C-p> :Leaderf file --popup<CR>
let g:Lf_CommandMap = {'<C-X>': ['<C-v>'], '<C-]>': ['<C-h>']}

" Switch Session
map <leader>p :source ~/.config/nvim/sessions/

" clear highlights after search by pressing esc
nnoremap <esc> :noh<return><esc>

" NerdTree
nmap <silent> <leader>k :NERDTreeToggle<CR>
nmap <silent> <leader>l :NERDTreeFind<CR>

" Ctrlf
map <C-f> :CtrlSF<space>

let g:ctrlsf_auto_focus = {
    \ "at": "start",
		\ }
