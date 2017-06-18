syntax enable
colorscheme lucario
" basic-dark
" basic-light
" solarized
set background=dark

" vim-airline configs
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" let g:airline_theme='solarized'
" let g:airline_skip_empty_sections = 1

function! StatuslineInit()
  " let s:branch = system('git rev-parse --abbrev-ref HEAD')
  " let s:branch = substitute(s:branch, '[\n\r]', '', 'g')
  " let &statusline = '%F%=' . s:branch
  let &statusline = '%F%m%r'
endfunction
autocmd VimEnter * call StatuslineInit()

