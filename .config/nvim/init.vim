filetype plugin indent on
set exrc

let g:ale_disable_lsp = 1

""" vim-plug: https://github.com/junegunn/vim-plug
call plug#begin('~/.local/share/nvim/plugged')

""""" Themes """""
" Plug 'liuchengxu/space-vim-dark'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'crusoexia/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'tomasiser/vim-code-dark'

""""" Airline Status Bar """""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'

""""" LSPs and Files """""
""" Language server client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
""" Linting engine
Plug 'dense-analysis/ale', { 'for': 'haskell' }

""" fzf: fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

""" `cd`s to project root based on config (like .git/)
" Plug 'airblade/vim-rooter'

""" tree viewer
Plug 'preservim/nerdtree'

""" git integration
" Plug 'tpope/vim-fugitive'

""" Comment support
Plug 'tpope/vim-commentary'

""" Automatic bracket matching
Plug 'jiangmiao/auto-pairs', { 'for': 'cpp' }

""" multiple cursors (experimental)
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

""""" Language specific support """""
""" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell', 'lhaskell'] }
Plug 'alx741/vim-hindent', { 'for': ['haskell', 'lhaskell'] }

""" Lisp
Plug 'eraserhd/parinfer-rust', { 'for': ['lisp', 'scheme', 'clojure'] }
Plug 'Olical/conjure', {'tag': 'v4.8.0'}

""" Org Mode
" Plug 'jceb/vim-orgmode'

"""" Extra """"
" Plug 'wikitopian/hardmode'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""" Theme Configuration """"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set termguicolors

" FOR: liuchengxu/space-vim-dark
" colorscheme space-vim-dark
" set background=dark
" hi Comment cterm=italic guifg=#5C6370 ctermfg=59

" FOR: NLKNguyen/papercolor-theme
" colorscheme PaperColor
" set background=light

" FOR: tomasiser/vim-code-dark
colorscheme codedark
set background=dark
hi Comment cterm=italic guifg=#5C6370 ctermfg=59

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Airline """""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1

""" Don't show mode explicitly, Airline tab shows it anyway
set noshowmode

""" display tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1

let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = 'X'

""" tabline formatting
let g:airline#extensions#tabline#formatter = 'unique_tail'
""" show folder name on the top right
""" note: vim-rooter takes care of making it the project folder
let g:airline#extensions#tabline#buffers_label = 'buffers | ' . fnamemodify(getcwd(), ':t')
let g:airline#extensions#tabline#tabs_label = 'tabs'

let g:airline_left_sep=''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_sep=''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Config """"""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

""" syntax highlighting
syntax enable
""" Required to keep multiple buffers open multiple buffers
set hidden
""" tab and indent settings
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set smartindent autoindent

""" line numbers and cursor
" line numbers
set number
" draw a vertical line at 80 chars
set colorcolumn=80
" Enable highlighting of the current line
set cursorline
" explicitly display tabs and trailing spaces
set list listchars=tab:»-,trail:▶,nbsp:▶
" allow cursor to move everywhere
set virtualedit=all

""" key trigger timeout
set timeoutlen=500 " By default timeoutlen is 1000 ms

""" default shell to run commands in
set shell=/usr/bin/zsh

""" enable mouse!
set mouse=a

""" use system clipboard
set clipboard+=unnamedplus
set clipboard=unnamedplus

""" allow vim to auto-reload files
set autoread

""" use syntax based folds
set foldmethod=syntax
set foldlevelstart=99

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Keybindings """""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=" "
let maplocalleader="m"
""" don't move on hitting just space
noremap <leader> <nop>
inoremap <silent> jk <Esc>
nnoremap <silent> <leader>w :w<CR>
""" quick remove highlighting
nnoremap <silent> <leader>h :nohl<CR>

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

""" buffer navigation
nnoremap <leader>] :bnext<CR>
nnoremap <leader>[ :bprevious<CR>
nnoremap <leader>\ :bdelete<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Files and more """"""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" FZF: fuzzy finder """""
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

nnoremap <leader>. :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>ff :BLines<CR>
nnoremap <leader>fb :Lines<CR>
nnoremap <leader>fa :Rg<CR>

""""" vim rooter: for project root directory support """""
let g:rooter_patterns = ['.git', '.lvimrc']
let g:rooter_change_directory_for_non_project_files = ''
" let g:rooter_silent_chdir = 1

""""" NERDTree bindings """""
nnoremap <leader>p :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" IDE config """"""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" coc.nvim """""
" Some servers have issues with backup files, see #649.
set nobackup nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" https://github.com/neoclide/coc.nvim/wiki/Completion-with-sources#use-tab-or-custom-key-for-trigger-completion
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" use <c-space>for trigger completion
" inoremap <silent><expr> <NUL> coc#refresh()

" Use tab and shift tab to cycle
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> [[ <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> ]] <Plug>(coc-diagnostic-next)

" Jump through source
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Coc Action
nmap <leader>ca :CocAction<CR>

" Rename a symbol
nmap <leader>rn <Plug>(coc-rename)

" refactor
nmap <leader>cf  <Plug>(coc-fix-current)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap <C-f> and <C-b> for scroll float windows/popups.
" Note coc#float#scroll works on neovim >= 0.4.3 or vim >= 8.2.0750
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

" manually format
nnoremap <leader>lf :call CocAction('format')<CR>

""""" ALE """""
" navigate through suggestions
nnoremap <silent> <leader>lj :lprev<CR>
nnoremap <silent> <leader>lk :lnext<CR>
nnoremap <silent> <leader>ll :lfirst<CR>

hi ALEWarning cterm=underline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""" Extra """""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""" Hard Mode """""
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
""" use \h to toggle
" nnoremap \h <Esc>:call ToggleHardMode()<CR>
""" default on buffer open
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

