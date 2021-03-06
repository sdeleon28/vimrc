function! DoRemote(arg)
  UpdateRemotePlugins
endfunction
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
" Plug 'neomake/neomake', { 'on': 'Neomake' }
" Plug 'ludovicchabant/vim-gutentags'

"Javascript Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
Plug 'carlitux/deoplete-ternjs'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
"Plug 'wokalski/autocomplete-flow'
" For func argument completion
"Plug 'Shougo/neosnippet'
"Plug 'Shougo/neosnippet-snippets'

" typescript Plugins
" Plug 'Shougo/vimproc.vim', { 'do': 'make' }
" Plug 'Quramy/tsuquyomi'
" Plug 'mhartington/deoplete-typescript'

" deoplete configs
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
" let g:deoplete#enable_refresh_always = 1
" let g:deoplete#max_abbr_width = 0
" let g:deoplete#max_menu_width = 0
let g:deoplete#omni#input_patterns = get(g:,'deoplete#omni#input_patterns',{})
" call deoplete#custom#set('_', 'matchers', ['matcher_full_fuzzy'])

" neosnippet configs
"let g:neosnippet#enable_completed_snippet = 1

" tern configs
" let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = ["--persistent"]
" let g:deoplete#sources#tss#javascript_support = 1
" let g:tsuquyomi_javascript_support = 1
" let g:tsuquyomi_auto_open = 1
" let g:tsuquyomi_disable_quickfix = 1

" autocmd! BufWritePost * Neomake
" let g:neomake_warning_sign = {
"   \ 'text': '?',
"   \ 'texthl': 'WarningMsg',
"   \ }

" let g:neomake_error_sign = {
"   \ 'text': 'X',
"   \ 'texthl': 'ErrorMsg',
"   \ }

