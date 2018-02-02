Plug 'ctrlpvim/ctrlp.vim'

let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard | egrep -v "^lib/"',
    \ 'find %s -type f'
    \ ]
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

Plug 'tacahiroy/ctrlp-funky'

nnoremap <C-F> :CtrlPFunky<cr>
nnoremap <C-]> :CtrlPBuffer<cr>
" narrow the list down with a word under cursor
" nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

Plug 'kshenoy/vim-ctrlp-args'

nnoremap <C-G> :CtrlPArgs<Cr>

