function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py --tern-completer
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

let g:ycm_filetype_specific_completion_to_disable = {
      \ 'objc': 1
      \}
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
set splitbelow

" ====================================================================
" Make tern_for_vim easier to install with vim-plug
" TODO: Do the same for YCM
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
nnoremap <F4> :TernDef<CR>
" The next line is similar to :TernDef but is faster and more reliable.
" Takes you straight to the const/class/function/default export definition of
" the thing under the cursor.
nnoremap <Leader><Leader> yiwgd:YcmCompleter GoToDefinition<CR>gg/\(\(const\\|class\\|function\) <C-r>0\\|export default\)<CR>

