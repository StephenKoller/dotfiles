" the prefix to use for leader commands
let g:mapleader="<space>"

set background=dark

set scrolloff=8

" function! BuildComposer(info)
"   if a:info.status != 'unchanged' || a:info.force
"     if has('nvim')
"       !cargo build --release --locked
"     else
"       !cargo build --release --locked --no-default-features --features json-rpc
"     endif
"   endif
" endfunction


" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
  Plug 'unblevable/quick-scope'
" Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }
  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'neoclide/coc-eslint'
  Plug 'neoclide/coc-tsserver'
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
  Plug 'wakatime/vim-wakatime'
  Plug 'haishanh/night-owl.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'dyng/ctrlsf.vim'
  Plug 'mileszs/ack.vim'
  Plug 'jiangmiao/auto-pairs'
  Plug 'machakann/vim-sandwich'
  Plug 'wfxr/minimap.vim'
  Plug 'machakann/vim-highlightedyank'
call plug#end()

let g:highlightedyank_highlight_duration = 250

if (has("termguicolors"))
 set termguicolors
endif

let g:airline_theme='night_owl'

if exists('##YankTestPost')
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank('Substitute', 200)
endif

" coc config
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint',
  \ 'coc-css',
  \ 'coc-lists',
  \ 'coc-highlight',
  \ 'coc-prettier',
  \ 'coc-styled-components',
  \ 'coc-json',
  \ ]
"
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
" if executable('ag')
"   " Use Ag over Grep
"   set grepprg=ag\ --nogroup\ --nocolor
" 
"   " Use ag in fzf for listing files. Lightning fast and respects .gitignore
"   let $FZF_DEFAULT_COMMAND = 'ag --literal --files-with-matches --nocolor --hidden -g ""'
" 
"   if !exists(":Ag")
"     command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
"     nnoremap \ :Ag<SPACE>
"   endif
" endif
" 
" "" Silver Searcher
" if executable('ag')
"   " Use Ag over Grep
"   if executable('rg')
"     set grepprg=rg\ --files\ --hidden\ --color=never\ --glob\ ""
"     let g:ctrlp_user_command = 'rg %s --files --hidden --color=never --glob ""'
"   else
"     set grepprg=ag\ --nogroup\ --nocolor
"   " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
"     let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"   endif 
"   let g:ctrlp_map = '<c-p>'
"   let g:ctrlp_cmd = 'CtrlP'
"   let g:ctrlp_working_path_mode = 'ra'
" endif

" vim-prettier
let g:prettier#quickfix_enabled = 0
let g:prettier#quickfix_auto_focus = 0

" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" run prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" automatically .ts / .tsx files 
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx

" open NERDTree automatically
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree
" autocmd VimEnter * NERDTree

let g:NERDTreeIgnore = ['^node_modules$']

map <C-b> :NERDTreeToggle<CR>

let g:lightline = {
      \ 'colorscheme': 'nightowl',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" let g:lightline = { 'colorscheme': 'nightowl' }

" netrw (default file explorer)
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_use_caching = 0

syntax on

colorscheme night-owl

set spell
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set relativenumber 
set nowrap
set smartcase "use case for search if any caps used
set incsearch "show match as search proceeds
set hlsearch  "search highlighting
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set showcmd
set list
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set colorcolumn=80,100
set inccommand=nosplit
set clipboard=unnamedplus "use Linux system clipboard for copy/paste

highlight ColorColumn ctermbg=0 guibg=black

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

" https://github.com/neoclide/coc.nvim#example-vim-configuration
inoremap <silent><expr> <c-space> coc#refresh()

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" gh - get hint on whatever's under the cursor
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent> gh :call <SID>show_documentation()<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Alt + J / Alt + K for moving lines up or down
nnoremap <A-k> <Up>ddp<Up>
nnoremap <A-j> ddp

set splitbelow
set splitright


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for commenting in / out code
nmap <C-\> <Plug>NERDCommenterToggle
au VimEnter *  NERDTree

