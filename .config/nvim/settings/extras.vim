""""" Hard Mode """""
" use \h to toggle
nnoremap \h <Esc>:call ToggleHardMode()<CR>
" default on buffer open
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

