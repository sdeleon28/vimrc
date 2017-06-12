Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-line'

" Inner-heading text object for Markdown files
" TODO: Wrap this in an autocommand to make sure it's only enabled for
" Markdown files
onoremap ih :<c-u>execute "normal! ?^#\r:nohlsearch\rwvg_"<cr>

" Next/last block (all and inner)
" (using last instead of previous to avoid clash with paragraph)

" ()
onoremap in( :<c-u>execute "normal! /(\r:nohlsearch\rvi("<cr>
onoremap in) :<c-u>execute "normal! /(\r:nohlsearch\rvi("<cr>
onoremap an( :<c-u>execute "normal! /(\r:nohlsearch\rva("<cr>
onoremap an) :<c-u>execute "normal! /(\r:nohlsearch\rva("<cr>
onoremap il( :<c-u>execute "normal! ?(\r:nohlsearch\rvi("<cr>
onoremap il) :<c-u>execute "normal! ?(\r:nohlsearch\rvi("<cr>
onoremap al( :<c-u>execute "normal! ?(\r:nohlsearch\rva("<cr>
onoremap al) :<c-u>execute "normal! ?(\r:nohlsearch\rva("<cr>

" {}
onoremap in{ :<c-u>execute "normal! /{\r:nohlsearch\rvi{"<cr>
onoremap in} :<c-u>execute "normal! /{\r:nohlsearch\rvi{"<cr>
onoremap an{ :<c-u>execute "normal! /{\r:nohlsearch\rva{"<cr>
onoremap an} :<c-u>execute "normal! /{\r:nohlsearch\rva{"<cr>
onoremap il{ :<c-u>execute "normal! ?{\r:nohlsearch\rvi{"<cr>
onoremap il} :<c-u>execute "normal! ?{\r:nohlsearch\rvi{"<cr>
onoremap al{ :<c-u>execute "normal! ?{\r:nohlsearch\rva{"<cr>
onoremap al} :<c-u>execute "normal! ?{\r:nohlsearch\rva{"<cr>

" []
onoremap in[ :<c-u>execute "normal! /[\r:nohlsearch\rvi["<cr>
onoremap in] :<c-u>execute "normal! /[\r:nohlsearch\rvi["<cr>
onoremap an[ :<c-u>execute "normal! /[\r:nohlsearch\rva["<cr>
onoremap an] :<c-u>execute "normal! /[\r:nohlsearch\rva["<cr>
onoremap il[ :<c-u>execute "normal! ?[\r:nohlsearch\rvi["<cr>
onoremap il] :<c-u>execute "normal! ?[\r:nohlsearch\rvi["<cr>
onoremap al[ :<c-u>execute "normal! ?[\r:nohlsearch\rva["<cr>
onoremap al] :<c-u>execute "normal! ?[\r:nohlsearch\rva["<cr>

" Portion of a path between slashes /
onoremap i/ :<c-u>execute "normal! T/vt/"<cr>
onoremap a/ :<c-u>execute "normal! F/vf/"<cr>

