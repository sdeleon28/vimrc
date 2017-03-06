Plugin 'spf13/vim-autoclose'
inoremap {<CR> {<CR><Tab><CR>0<C-D>}<UP>
inoremap [<CR> [<CR><Tab><CR>0<C-D>]<UP>
inoremap (<CR> (<CR><Tab><CR>0<C-D>)<UP>
inoremap {;<CR> {<CR><Tab><CR>0<C-D>};<UP>
inoremap [;<CR> [<CR><Tab><CR>0<C-D>];<UP>
inoremap (;<CR> (<CR><Tab><CR>0<C-D>);<UP>
let g:autoclose_vim_commentmode = 1

