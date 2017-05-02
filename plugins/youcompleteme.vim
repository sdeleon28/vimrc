" Configure completion and typechecking in this file
Plugin 'Valloric/YouCompleteMe'

let g:ycm_filetype_specific_completion_to_disable = {
      \ 'objc': 1
      \}
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set splitbelow

" ====================================================================
" Make tern_for_vim easier to install with vim-plug
" TODO: Do the same for YCM

" Install Vim Plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
nnoremap <F4> :TernDef<CR>
" The next line is similar to :TernDef but is faster and more reliable.
" Takes you straight to the const/class/function/default export definition of
" the thing under the cursor.
nnoremap <Leader><Leader> yiwgd:YcmCompleter GoToDefinition<CR>gg/\(\(const\\|class\\|function\) <C-r>0\\|export default\)<CR>

call plug#end()

