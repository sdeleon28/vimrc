" Git wrapper
Plugin 'tpope/vim-fugitive'

" Make vimdiff use vertical splits for 3-way merges
set diffopt=vertical

" Open `git lg` in new buffer
nnoremap <Leader>l :split gitlg.txt<CR>:r!git lg<CR>:AnsiEsc<CR>gg

