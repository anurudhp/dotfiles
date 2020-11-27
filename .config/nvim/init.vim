let g:ale_disable_lsp = 1

filetype plugin indent on

call plug#begin('~/.local/share/nvim/plugged')

""""" Themes """""
Plug 'liuchengxu/space-vim-dark'
" Plug 'NLKNguyen/papercolor-theme'
" Plug 'arcticicestudio/nord-vim'
" Plug 'sonph/onehalf', { 'rtp': 'vim' }
" Plug 'sickill/vim-monokai'
" Plug 'crusoexia/vim-monokai'
" Plug 'blueshirts/darcula'
" Plug 'doums/darcula'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'relastle/bluewery.vim'
Plug 'tomasiser/vim-code-dark'

""""" Airline Status Bar """""
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'

""""" LSPs and Files """""
" Language server client
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Linting engine
Plug 'dense-analysis/ale', { 'for': 'haskell' }

" fzf: fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" `cd`s to project root based on config (like .git/)
Plug 'airblade/vim-rooter'

" tree viewer
Plug 'preservim/nerdtree'

" git integration
" Plug 'tpope/vim-fugitive'

" Comment support
Plug 'tpope/vim-commentary'

" Automatic bracket matching
Plug 'jiangmiao/auto-pairs', { 'for': 'cpp' }

" multiple cursors (experimental)
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}

""""" Language specific support """""
" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': ['haskell', 'lhaskell'] }
Plug 'alx741/vim-hindent', { 'for': ['haskell', 'lhaskell'] }

" Lisp
Plug 'eraserhd/parinfer-rust', { 'for': ['lisp', 'scheme', 'clojure'] }
Plug 'Olical/conjure', {'tag': 'v4.8.0'}

"""" Extra """"
" Hard mode. Disables most normal "other editor" features.
" Use with caution
" Plug 'wikitopian/hardmode'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Load extra settings
source $HOME/.config/nvim/settings/basic.vim
source $HOME/.config/nvim/settings/theme.vim
source $HOME/.config/nvim/settings/extras.vim
source $HOME/.config/nvim/settings/files.vim
source $HOME/.config/nvim/settings/ide.vim

