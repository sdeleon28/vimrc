" If you're interested in ctags, do yourself a favor and read this article:
" http://andrewradev.com/2011/06/08/vim-and-ctags/

set tags=./tags,tags;
Plug 'szw/vim-tags'
" Customize the command for each different language by using a line like this
" let g:vim_tags_project_tags_command = "{CTAGS} -R {OPTIONS} {DIRECTORY} 2>/dev/null"

