""""" Basic Config """""
" no plugins used
""""""""""""""""""""""""
""" no backwards compatibility
set nocompatible

""" syntax highlighting
syntax enable
""" Required to keep multiple buffers open multiple buffers
set hidden
""" tab and indent settings
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set smartindent autoindent

""" line numbers and cursor
" relative line numbers, with current line number
set number relativenumber
" draw a vertical line at 80 chars
set colorcolumn=80
" Enable highlighting of the current line
set cursorline
" explicitly display tabs and trailing spaces
set list listchars=tab:»-,trail:▶,nbsp:▶

""" key trigger timeout
set timeoutlen=500 " By default timeoutlen is 1000 ms

""" default shell to run commands in
set shell=/usr/bin/zsh

""" enable mouse!
" set mouse=a

""" use system clipboard
set clipboard+=unnamedplus
set clipboard=unnamedplus

""" allow vim to auto-reload files
set autoread

""" Key Bindings """
""" use space as leader
let mapleader=" "
""" don't move on hitting just space
noremap <leader> <nop>
""" faster escape
inoremap <silent> jk <Esc>
""" faster save
nnoremap <silent> <leader>w :w<CR>

""" quick remove highlighting
nnoremap <silent> <leader>h :nohl<CR>

""" easier command mode
" nnoremap ; :
" nnoremap : ;

""" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

""" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

""" make escape work in terminal
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
endif

""" buffer control
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>\ :bdelete<CR>


""" disable arrow keys in insert mode
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

""" disable arrow keys in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
