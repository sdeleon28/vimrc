" If you're interested in ctags, do yourself a favor and read this article:
" http://andrewradev.com/2011/06/08/vim-and-ctags/

set tags=./.tags,.tags;
Plug 'craigemery/vim-autotag'
" To generate tags for the first time, run this from the root of your project:
" ctags --javascript-kinds=-c-f-m-p-v -R -a -f .tags .
let g:autotagCtagsCmd="ctags --javascript-kinds=-c-f-m-p-v -a -f .tags"
let g:autotagTagsFile=".tags"

