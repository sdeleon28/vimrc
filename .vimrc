let mapleader = "\<Space>"
source ~/vim/vimrc/plugins/plugins_boilerplate.vim
source ~/vim/vimrc/template.vim
source ~/vim/vimrc/custom.vim
source ~/vim/vimrc/linenumbers.vim
source ~/vim/vimrc/abbreviations.vim
source ~/vim/vimrc/filetype/java.vim
source ~/vim/vimrc/filetype/markdown.vim
source ~/vim/vimrc/commands/index.vim
source ~/vim/vimrc/filetype/javascript.vim
source ~/vim/vimrc/overrides/index.vim
language en_US

" " TODO: Make this a mapping
" " Uncomment the following block to ignore whitespace in diffs
" "
" set diffopt+=iwhite
" set diffexpr=DiffW()
" function DiffW()
"   let opt = ""
"    if &diffopt =~ "icase"
"      let opt = opt . "-i "
"    endif
"    if &diffopt =~ "iwhite"
"      let opt = opt . "-w " " swapped vim's -b with -w
"    endif
"    silent execute "!diff -a --binary " . opt .
"      \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
" endfunction
