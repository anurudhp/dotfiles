""""" Theme Configuration """""
"""""""""""""""""""""""""""""""
set t_Co=256

" FOR: liuchengxu/space-vim-dark
colorscheme space-vim-dark
hi Comment cterm=italic guifg=#5C6370 ctermfg=59
set termguicolors

" FOR: NLKNguyen/papercolor-theme
" colorscheme PaperColor
" set background=dark
" set background=light

" FOR: arcticicestudio/nord-vim
" colorscheme nord

" FOR: sonph/onehalf
" colorscheme onehalflight

""""" Airline """""
"""""""""""""""""""
let g:airline_theme='dark'
let g:airline_powerline_fonts = 1 " use powerline fonts

set noshowmode " Don't show mode explicitly, Airline tab shows it anyway

" display tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1

let g:airline#extensions#tabline#show_close_button = 1
let g:airline#extensions#tabline#close_symbol = 'X'

" tabline formatting
let g:airline#extensions#tabline#formatter = 'unique_tail'
" show folder name on the top right
" note: vim-rooter takes care of making it the project folder
let g:airline#extensions#tabline#buffers_label = 'buffers | ' . fnamemodify(getcwd(), ':t')
" let g:airline#extensions#tabline#tabs_label = 'tabs'

