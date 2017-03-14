" Configure completion and typechecking in this file

" Completion library
Plugin 'Valloric/YouCompleteMe'
let g:ycm_filetype_specific_completion_to_disable = {
      \ 'objc': 1
      \}
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set splitbelow

" Flow (javascript typechecking)
Plugin 'flowtype/vim-flow'
"Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow= getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif
" Autoclose quickfix window when no errors are found
let g:flow#autoclose = 1

