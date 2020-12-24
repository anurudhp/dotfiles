if has('python')
  function! Formatonsave()
    let l:formatdiff = 1
    pyf /usr/share/clang/clang-format-11/clang-format.py
  endfunction
  autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
elseif has('python3')
  function! Formatonsave()
    let l:formatdiff = 1
    py3f /usr/share/clang/clang-format-11/clang-format.py
  endfunction
  autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
endif

