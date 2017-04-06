let mapleader = "\<Space>"
source ~/vim/vimrc/plugins/plugins_boilerplate.vim
source ~/vim/vimrc/template.vim
source ~/vim/vimrc/custom.vim
source ~/vim/vimrc/linenumbers.vim
source ~/vim/vimrc/commands/index.vim
language en_US

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
autocmd FileType javascript let &formatprg = s:prettier_cmd
nnoremap <Leader>p gggqG<C-O><C-O>

