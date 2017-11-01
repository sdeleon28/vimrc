Plug 'lifepillar/vim-solarized8'
" Plug 'micha/vim-colors-solarized'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

set rtp+=~/.vim/plugged/vim-colors-solarized
syntax enable
set background=dark
let g:solarized_termcolors = 16
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized8_dark_high
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" let g:airline_theme='solarized'
" let g:airline_skip_empty_sections = 1
