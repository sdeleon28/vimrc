Plugin 'tpope/vim-markdown'
" let g:markdown_syntax_conceal = 0
let g:markdown_fenced_languages = ['javascript', 'html', 'python', 'bash=sh']

Plugin 'jtratner/vim-flavored-markdown'

augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" Preview Markdown files with Pandoc
nnoremap <leader>mm :!pandoc -i % -o ~/tmp/markdown.html && open ~/tmp/markdown.html<CR>

