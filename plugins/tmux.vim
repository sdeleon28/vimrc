Plugin 'christoomey/vim-tmux-navigator'
" Hack to make C-H binding work in NeoVim. Read more at:
" https://github.com/christoomey/vim-tmux-navigator#it-doesnt-work-in-neovim-specifically-c-h
nnoremap <silent> <BS> :TmuxNavigateLeft<cr>
