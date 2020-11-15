" File searches and more

""""" FZF: fuzzy finder """""
let g:fzf_buffers_jump = 1
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline'

nnoremap <leader>. :Files<CR>
nnoremap <M-f> :BLines<CR>
nnoremap <M-S-f> :Lines<CR>

""""" vim rooter: for project root directory support """""
let g:rooter_patterns = ['.git', '.lvimrc']
let g:rooter_change_directory_for_non_project_files = ''
" let g:rooter_silent_chdir = 1

""""" NERDTree bindings """""
nnoremap <C-\> :NERDTreeToggle<CR>
