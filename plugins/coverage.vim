Plugin 'retorillo/istanbul.vim'
"
" Uncomment the next line to customize the coverage file
" let g:istanbul#jsonPath = ['coverage/custom.json', 'coverage/coverage.json']

" Mappings

" Changing modes
" Toggle between line and branch coverage
nnoremap <Leader>vm :IstanbulMode
" Change to line coverage
" nnoremap <Leader>vl :IstanbulMode line
" Change to branch coverage
" nnoremap <Leader>vb :IstanbulMode branch

" Moving around
nnoremap ]v :IstanbulNext<CR>
nnoremap [v :IstanbulBack<CR>

" Clearing coverage signs
" Current buffer
" :IstanbulClear
" Current buffer and quickfix
nnoremap <Leader>vc :IstanbulClear!<CR>

" Update coverage
function UpdateCoverage()
  wall
  !npm test
  IstanbulUpdate
endfunction
nnoremap <Leader>vv :call UpdateCoverage()<CR>

