Plugin 'spf13/vim-autoclose'
let g:autoclose_vim_commentmode = 1

" inoremap {<CR> {<CR><Tab><CR>0<C-D>}<UP>
" inoremap [<CR> [<CR><Tab><CR>0<C-D>]<UP>
" inoremap (<CR> (<CR><Tab><CR>0<C-D>)<UP>
" inoremap {;<CR> {<CR><Tab><CR>0<C-D>};<UP>
" inoremap [;<CR> [<CR><Tab><CR>0<C-D>];<UP>
" inoremap (;<CR> (<CR><Tab><CR>0<C-D>);<UP>

inoremap {,<CR> {},<Esc>hi<CR><Esc>O
inoremap {;<CR> {};<Esc>hi<CR><Esc>O
inoremap {<CR> {}<Esc>hi<CR><Esc>O
inoremap [,<CR> [],<Esc>hi<CR><Esc>O
inoremap [;<CR> [];<Esc>hi<CR><Esc>O
inoremap [<CR> []<Esc>hi<CR><Esc>O
inoremap (,<CR> (),<Esc>hi<CR><Esc>O
inoremap (;<CR> ();<Esc>hi<CR><Esc>O
" For some reason, the next one behaves differently. I don't use that syntax
" very often so I won't even bother.
" inoremap (<CR> ()<Esc>hi<CR><Esc>O

