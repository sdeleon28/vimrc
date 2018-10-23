" Returns the directory of the first file in `argv` or `cwd` if it's empty
function FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction!
let g:session_default_name = FindSessionDirectory()
let s:prettier_cmd = g:session_default_name . '/node_modules/prettier-eslint-cli/dist/index.js --stdin-filepath index.js --stdin'
let s:prettier_json_cmd = g:session_default_name . '/node_modules/prettier-eslint-cli/dist/index.js --parser json --stdin'

let s:ctags_cmd = "{CTAGS} --javascript-kinds=-c-f-m-p-v -R -a {DIRECTORY}"

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript,javascript.jsx iabbrev rr return
  autocmd FileType javascript,javascript.jsx iabbrev ff function
  autocmd FileType javascript,javascript.jsx iabbrev cc const
  autocmd FileType javascript,javascript.jsx iabbrev xx export
  autocmd FileType javascript,javascript.jsx iabbrev xc export const
  autocmd FileType javascript,javascript.jsx iabbrev xd export default
  autocmd FileType javascript,javascript.jsx iabbrev ii import from '';<left><left><left><left><left><left><left><left><left>
  autocmd FileType javascript,javascript.jsx iabbrev ni import { } from '';<left><left><left><left><left><left><left><left><left><left><left>
  autocmd FileType javascript,javascript.jsx iabbrev return NOPENOPENOPE
  autocmd FileType javascript,javascript.jsx iabbrev function NOPENOPENOPE
  autocmd FileType javascript,javascript.jsx iabbrev const NOPENOPENOPE
  autocmd FileType javascript,javascript.jsx iabbrev export NOPENOPENOPE
  autocmd FileType javascript,javascript.jsx iabbrev import NOPENOPENOPE
  autocmd FileType javascript,javascript.jsx let &formatprg = s:prettier_cmd
  autocmd FileType json let &formatprg = s:prettier_json_cmd
  autocmd FileType javascript,javascript.jsx nnoremap <Leader>p gggqG<C-O><C-O>
  " autocmd FileType javascript,javascript.jsx nnoremap <Leader>f Vi}zf
  " autocmd FileType javascript,javascript.jsx nnoremap <Leader>t Vitzf
  " autocmd FileType javascript,javascript.jsx let g:vim_tags_project_tags_command = s:ctags_cmd
  " autocmd FileType javascript,javascript.jsx nnoremap <leader>jt A<bs>: pt.func.isRequired,<esc>j^
  " autocmd FileType javascript,javascript.jsx nnoremap <leader>jp A<bs>={<c-p>}<esc>j^
  " autocmd FileType javascript,javascript.jsx nnoremap <leader>jo A<c-w><c-w><c-w>,<esc>j^
augroup END

