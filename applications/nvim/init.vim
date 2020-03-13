" VIM-PLUG
call plug#begin(stdpath('data') . '/plugged')

" filemanager
Plug 'preservim/nerdtree'

" navigation
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'dyng/ctrlsf.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'yuttie/comfortable-motion.vim'
Plug 'pechorin/any-jump.vim'

" UI
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'kyoz/purify', { 'rtp': 'vim' }

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" code syntax & autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" comments
Plug 'scrooloose/nerdcommenter'
Plug 'heavenshell/vim-jsdoc'

" evaluating

" Wrap text in quotes and such, select in v mode S+<Surrounding charater>
Plug 'tpope/vim-surround'

" :TagbarToggle to show ctags for docs, does it work for JS?
Plug 'majutsushi/tagbar'

call plug#end()

" PYTHON INTEGRATION
let g:loaded_python_provider = 0
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
nmap <silent> gk :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Syntax
let g:javascript_plugin_jsdoc = 1

" Prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformat_config_present = 1


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
			\ 'colorscheme': 'purify',
			\ }

let g:purify_italic = 0 
colorscheme purify

" Startify
let g:startify_session_before_save = [
       \ 'echo "Cleaning up before saving.."',
        \ 'silent! NERDTreeClose'
        \ ]

let g:startify_lists = [
			\ { 'type': 'sessions',  'header': ['   Sessions']       },
			\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
			\ { 'type': 'commands',  'header': ['   Commands']       },
			\ ]

let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'} ]
let g:startify_session_persistence = 1

" KEYMAP
let mapleader = ' '

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

" Move selected lines up & down
nnoremap <silent> <S-j> :m .+1<CR>==
nnoremap <silent> <S-k> :m .-2<CR>==
vnoremap <silent> <S-j> :m '>+1<CR>gv=gv
vnoremap <silent> <S-k> :m '<-2<CR>gv=gv


"LeaderF
map <silent> <C-p> :Leaderf file --popup<CR>
let g:Lf_CommandMap = {'<C-X>': ['<C-v>'], '<C-]>': ['<C-h>']}

" Open Startify
map <leader>p :Startify<CR>

" clear highlights after search by pressing esc
nnoremap <esc> :noh<return><esc>

" NerdTree
nmap <silent> <leader>k :NERDTreeToggle<CR>
nmap <silent> <leader>l :NERDTreeFind<CR>

" Prettier
nmap <Leader>f <Plug>(Prettier)

" Ctrlf
map <C-f> :CtrlSF<space>

let g:ctrlsf_auto_focus = {
    \ "at": "start",
		\ }
