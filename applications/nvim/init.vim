" VIM-PLUG
call plug#begin(stdpath('data') . '/plugged')

" filemanager
Plug 'preservim/nerdtree'

" navigation
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'dyng/ctrlsf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'yuttie/comfortable-motion.vim'
Plug 'pechorin/any-jump.vim'

" UI
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'patstockwell/vim-monokai-tasty'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" code syntax & autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'leafgarland/typescript-vim'

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
nmap <silent> ga  <Plug>(coc-codeaction)
nmap <silent> gf  <Plug>(coc-fix-current)

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

" JsDoc
command! -register JsDoc call jsdoc#insert()

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

syntax on

let g:lightline = {
			\ 'colorscheme': 'monokai_tasty',
			\ }

let g:vim_monokai_tasty_italic = 1
colorscheme vim-monokai-tasty

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

let g:startify_session_persistence = 1

" NerdTree
let NERDTreeShowHidden=1
" TODO Doesn't work when the only window is nerdtree
" autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" | b# | endif

" Script that closes buffer without closing window
" https://vim.fandom.com/wiki/Deleting_a_buffer_without_closing_the_window
function s:Kwbd(kwbdStage)
  if(a:kwbdStage == 1)
    if(&modified)
      let answer = confirm("This buffer has been modified.  Are you sure you want to delete it?", "&Yes\n&No", 2)
      if(answer != 1)
        return
      endif
    endif
    if(!buflisted(winbufnr(0)))
      bd!
      return
    endif
    let s:kwbdBufNum = bufnr("%")
    let s:kwbdWinNum = winnr()
    windo call s:Kwbd(2)
    execute s:kwbdWinNum . 'wincmd w'
    let s:buflistedLeft = 0
    let s:bufFinalJump = 0
    let l:nBufs = bufnr("$")
    let l:i = 1
    while(l:i <= l:nBufs)
      if(l:i != s:kwbdBufNum)
        if(buflisted(l:i))
          let s:buflistedLeft = s:buflistedLeft + 1
        else
          if(bufexists(l:i) && !strlen(bufname(l:i)) && !s:bufFinalJump)
            let s:bufFinalJump = l:i
          endif
        endif
      endif
      let l:i = l:i + 1
    endwhile
    if(!s:buflistedLeft)
      if(s:bufFinalJump)
        windo if(buflisted(winbufnr(0))) | execute "b! " . s:bufFinalJump | endif
      else
        enew
        let l:newBuf = bufnr("%")
        windo if(buflisted(winbufnr(0))) | execute "b! " . l:newBuf | endif
      endif
      execute s:kwbdWinNum . 'wincmd w'
    endif
    if(buflisted(s:kwbdBufNum) || s:kwbdBufNum == bufnr("%"))
      execute "bd! " . s:kwbdBufNum
    endif
    if(!s:buflistedLeft)
      set buflisted
      set bufhidden=delete
      set buftype=
      setlocal noswapfile
    endif
  else
    if(bufnr("%") == s:kwbdBufNum)
      let prevbufvar = bufnr("#")
      if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != s:kwbdBufNum)
        b #
      else
        bn
      endif
    endif
  endif
endfunction

command! Kwbd call s:Kwbd(1)
nnoremap <silent> <Plug>Kwbd :<C-u>Kwbd<CR>

" KEYMAP
let mapleader = ' '

" Switch between buffers
map <silent> <C-h> :bprev<CR>
map <silent> <C-l> :bnext<CR>
map <C-q> <Plug>Kwbd

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
imap <C-f> <esc><Plug>CtrlSFPrompt
nmap <C-f> <Plug>CtrlSFCwordPath
vmap <C-f> <Plug>CtrlSFVwordPath 

let g:ctrlsf_auto_focus = {
    \ "at": "start",
		\ }




