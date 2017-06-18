let s:ctags_cmd =  "{CTAGS} -R --sort=1 --c++-kinds=+p --fields=+iaS --extra=+q --language-force=C++ {DIRECTORY} 2>/dev/null"

augroup filetype_cpp
  autocmd!
  autocmd BufNewFile,BufRead,BufEnter *.cpp,*.hpp setlocal omnifunc=omni#cpp#complete#Main
  autocmd FileType cpp let g:vim_tags_project_tags_command = s:ctags_cmd
  autocmd FileType cpp setlocal tags+=~/.vim/tags/cpp
augroup END

" OmniCppComplete
Plug 'vim-scripts/OmniCppComplete', { 'for': 'cpp' }
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

