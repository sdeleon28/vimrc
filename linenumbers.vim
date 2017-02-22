function! NumberToggle()
  if &nu == 1 && &rnu == 0
    set rnu
  else
    set nornu
    set nu
  endif
endfunc

nnoremap <C-l> :call NumberToggle()<cr>
" Use relative numbers by default
set rnu

