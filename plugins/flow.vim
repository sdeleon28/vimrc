Plug 'amunra81/vim-flow', {
  \ 'autoload': {
  \   'filetypes': 'javascript'
  \ },
  \ 'build': {
  \   'mac': 'npm install -g flow-bin'
  \ }}
" Do not show quickfix on save, I use ALE for that
let g:flow#enable = 0
" Use locally installed flow
let local_flow = finddir('node_modules', '.;') . '/.bin/flow'
if matchstr(local_flow, "^\/\\w") == ''
    let local_flow = getcwd() . "/" . local_flow
endif
if executable(local_flow)
  let g:flow#flowpath = local_flow
endif
nmap <leader>t :FlowType<cr>
