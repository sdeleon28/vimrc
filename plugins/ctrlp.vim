Plugin 'ctrlpvim/ctrlp.vim'

let g:ctrlp_user_command = [
    \ '.git', 'cd %s && git ls-files . -co --exclude-standard',
    \ 'find %s -type f'
    \ ]
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

