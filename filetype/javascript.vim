" Returns the directory of the first file in `argv` or `cwd` if it's empty
function FindSessionDirectory() abort
  if len(argv()) > 0
    return fnamemodify(argv()[0], ':p:h')
  endif
  return getcwd()
endfunction!
let g:session_default_name = FindSessionDirectory()
let s:prettier_rel = finddir('node_modules', '.;') . '/prettier-eslint-cli/dist/index.js --stdin'
let s:prettier_cmd = g:session_default_name . '/' . s:prettier_rel

let s:ctags_cmd = "{CTAGS} --javascript-kinds=-c-f-m-p-v -R -a {DIRECTORY}"

augroup filetype_javascript
  autocmd!
  autocmd FileType javascript iabbrev rr return
  autocmd FileType javascript iabbrev ff function
  autocmd FileType javascript iabbrev cc const
  autocmd FileType javascript iabbrev xx export
  autocmd FileType javascript iabbrev xc export const
  autocmd FileType javascript iabbrev xd export default
  autocmd FileType javascript iabbrev ii import from '';<left><left><left><left><left><left><left><left><left>
  autocmd FileType javascript iabbrev ni import { } from '';<left><left><left><left><left><left><left><left><left><left><left>
  autocmd FileType javascript iabbrev return NOPENOPENOPE
  autocmd FileType javascript iabbrev function NOPENOPENOPE
  autocmd FileType javascript iabbrev const NOPENOPENOPE
  autocmd FileType javascript iabbrev export NOPENOPENOPE
  autocmd FileType javascript iabbrev import NOPENOPENOPE
  autocmd FileType javascript let &formatprg = s:prettier_cmd
  autocmd FileType javascript nnoremap <Leader>p gggqG<C-O><C-O>
  " autocmd FileType javascript nnoremap <Leader>f Vi}zf
  autocmd FileType javascript nnoremap <Leader>t Vitzf
  autocmd FileType javascript let g:vim_tags_project_tags_command = s:ctags_cmd
  " autocmd FileType javascript nnoremap <leader>jt A<bs>: pt.func.isRequired,<esc>j^
  " autocmd FileType javascript nnoremap <leader>jp A<bs>={<c-p>}<esc>j^
  " autocmd FileType javascript nnoremap <leader>jo A<c-w><c-w><c-w>,<esc>j^
augroup END

