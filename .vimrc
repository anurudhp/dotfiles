" set t_Co=256
" set termguicolors
colorscheme elflord
set laststatus=2

" change cursor shape in insert and rename modes
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"

filetype plugin indent on

set nocompatible
syntax enable
set hidden
set timeoutlen=500
set mouse=a

set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab smartindent autoindent
set number relativenumber colorcolumn=80 cursorline
set list listchars=tab:»-,trail:▶,nbsp:▶

set clipboard+=unnamedplus
set clipboard=unnamedplus

""" allow vim to auto-reload files
set autoread

set foldmethod=syntax
set foldlevelstart=99

let mapleader=" "
noremap <leader> <nop>
inoremap <silent> jk <Esc>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>h :nohl<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>\ :bdelete<CR>
