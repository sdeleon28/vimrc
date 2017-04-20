" Configure completion and typechecking in this file
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'

let g:ycm_filetype_specific_completion_to_disable = {
      \ 'objc': 1
      \}
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set splitbelow

