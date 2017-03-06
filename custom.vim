" Set leader key
let mapleader = ","

" Highlight search matches
set hls

" Enable incremental search
set is

" Put swap and backup files outside project dir to keep it clean
set swapfile
set dir=~/tmp
set backup
set backupdir=~/tmp

" Automatically change dir when switching files.
" This enables :compl-filename to give me proper relative filenames.
set autochdir

" Use 2 spaces for indentation
set ts=2
set et
set sw=2

" Enable autoindent
set autoindent
set smartindent

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" Configure colors
set t_Co=256
set term=xterm-256color

" Sources the current vimscript
nnoremap <leader>sop :source %<cr>

" Set Chrome as the default brower
let g:netrw_browsex_viewer='google-chrome'

" Open image in gwenview
nnoremap <leader>i :!gwenview <cfile><cr><cr>

" Swaps paste mode
set pastetoggle=<F3>

