set autoindent
set cindent
set clipboard=unnamedplus " Use Linux system clipboard for copy/paste
set colorcolumn=80,100
set expandtab
set hlsearch              " Search highlighting
set inccommand=nosplit
set incsearch             " Show match as search proceeds
set list                  " Show whitespace characters
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set noerrorbells          " NO BELLS!
set nowrap                " Word wrap off
set number                " Current line number in gutter
set relativenumber        " Relative line numbers in gutter
set scrolloff=8           " Scroll contents when cursor 8 lines away from top / bottom of screen
set shiftwidth=2
set showcmd
set smartcase             " Use case for search if any caps used
set smartindent
set smarttab
set softtabstop=2
" set spell                 " Spell check
set splitbelow            " New split opens below current pane
set splitright            " New vertical split opens to right of current pane
set tabstop=2
set undodir=~/.vim/undodir
set undofile

highlight ColorColumn ctermbg=0 guibg=black

call plug#begin('~/.vim/plugged')
  " Pretty things
  Plug 'haishanh/night-owl.vim'
  " Plug 'PierreCapo/night-owl'
  Plug 'morhetz/gruvbox'
  " Plug 'Yagua/nebulous.nvim'

  " File Management
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'luukvbaal/nnn.nvim'
  Plug 'kyazdani42/nvim-tree.lua'

  " Telescope
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " Language Server Protocol
  Plug 'neovim/nvim-lspconfig'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'nvim-lua/completion-nvim'

  " Syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'romgrk/nvim-treesitter-context'
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'
  Plug 'MaxMEllon/vim-jsx-pretty'

  Plug 'hoob3rt/lualine.nvim', {'commit': '82f68c42df9d11e52edb52c86113d0eba5be798d'}
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'airblade/vim-gitgutter'
  Plug 'wfxr/minimap.vim'

  " Tim Pope!
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
call plug#end()

colorscheme night-owl 
" colorscheme gruvbox

" netrw (default file explorer)
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

" set proper color handling
syntax enable 
if (has("termguicolors"))
 set termguicolors
endif

" Remaps
let mapleader = " "

" Project View? Need to clean up how I interact w/ the tree, unintuitive
nnoremap <leader>pv :Vex<CR>
nnoremap <C-b> :NvimTreeToggle<CR>

" Source this file
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

" Neovim Help entry for word under cursor
nnoremap <leader>h :h <C-r>=expand("<cword>")<CR><CR>

" vim-plugged
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pc :PlugClean<CR>

"
nnoremap <leader>vs :vsp<CR>

" Ctrl-W to close window
noremap <leader>w ZZ<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quick Fix List
nnoremap <leader>j :cnext<CR>
nnoremap <leader>k :cprev<CR>
nnoremap <leader>o :copen<CR>
nnoremap <leader>x :cclose<CR>

" Minimap
nnoremap <leader>m :MinimapToggle<CR>

" LSP / Telescope
nnoremap <C-p> :lua require'telescope.builtin'.find_files{ hidden = true }<cr>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh    <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH    <cmd>:Telescope lsp_code_actions<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent><leader>fo <cmd>lua vim.lsp.buf.formatting_sync(nil, 5000)<CR>

lua << EOF
require'nnn'.setup()
require'nvim-tree'.setup {
  view = {
    width = 30,
    auto_resize = true
  }
}
EOF

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" lualine
lua << EOF
  require('lualine').setup()
EOF

" Emmet
" local lspconfig = require'lspconfig'
" local configs = require'lspconfig/configs'    

" local capabilities = vim.lsp.protocol.make_client_capabilities()
" capabilities.textDocument.completion.completionItem.snippetSupport = true

" if not lspconfig.emmet_ls then    
"   configs.emmet_ls = {    
"     default_config = {    
"       cmd = {'emmet-ls', '--stdio'};
"       filetypes = {'html', 'css'};
"       root_dir = function(fname)    
"         return vim.loop.cwd()
"       end;    
"       settings = {};    
"     };    
"   }    
" end    
" lspconfig.emmet_ls.setup{ capabilities = capabilities; }


" TypeScript
" lua << EOF
" local util = require "lspconfig/util"
" require 'lspconfig'.tsserver.setup{
"     on_attach = function(client)
"         client.resolved_capabilities.document_formatting = false
"     end,
"     root_dir = util.root_pattern(".git", "tsconfig.json", "jsconfig.json"),
"     handlers = {
"       ["textDocument/publishDiagnostics"] = function(_, _, params, client_id, _, config)
"         local ignore_codes = { 80001, 7016 };
"         if params.diagnostics ~= nil then
"           local idx = 1
"           while idx <= #params.diagnostics do
"             if vim.tbl_contains(ignore_codes, params.diagnostics[idx].code) then
"               table.remove(params.diagnostics, idx)
"             else
"               idx = idx + 1
"             end 
"           end
"         end
"         vim.lsp.diagnostic.on_publish_diagnostics(_, _, params, client_id, _, config)
"       end,
"     },
" }
" EOF

" ESLint
" lua << EOF
" -- npm install -g eslint_d
" local eslint = {
"     lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
"     lintIgnoreExitCode = true,
"     lintStdin = true,
"     lintFormats = {"%f:%l:%c: %m"},
"     formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
"     formatStdin = true
" }
" -- brew install efm-langserver
" require "lspconfig".efm.setup {
"     init_options = {documentFormatting = true, codeAction = true},
"     filetypes = {"javascriptreact", "javascript", "typescript", "typescriptreact"},
"     settings = {
"         rootMarkers = {".git/"},
"         languages = {
"             javascript = {eslint},
"             javascriptreact = {eslint},
"         }
"     }
" }
" EOF
