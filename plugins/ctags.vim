" If you're interested in ctags, do yourself a favor and read this article:
" http://andrewradev.com/2011/06/08/vim-and-ctags/

set tags=./tags,tags;
Plug 'craigemery/vim-autotag'
let g:autotagCtagsCmd="ctags --javascript-kinds=-c-f-m-p-v -R ."
let g:autotagTagsFile="tags"

