let b:ale_linters = ['hlint']
let b:ale_fixers = ['hlint']

" Format on save
autocmd BufWritePre call CocAction('format')
