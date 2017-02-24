" Set leader key
let mapleader = ","

" Highlight search matches
set hls

" Enable incremental search
set is

" Put swap files outside project dir to keep it clean
set swapfile
set dir=~/tmp

" Automatically change dir when switching files.
" This enables :compl-filename to give me proper relative filenames.
set autochdir

" Use 2 spaces for indentation
set ts=2
set et
set sw=2

" Enable autoindent
set autoindent

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" Configure colors
set t_Co=256
set term=xterm-256color

