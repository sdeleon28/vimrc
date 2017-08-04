" Adapted from unimpaired.vim by Tim Pope.
function! s:DoAction(algorithm,type)
  " backup settings that we will change
  let sel_save = &selection
  let cb_save = &clipboard
  " make selection and clipboard work the way we need
  set selection=inclusive clipboard-=unnamed clipboard-=unnamedplus
  " backup the unnamed register, which we will be yanking into
  let reg_save = @@
  " yank the relevant text, and also set the visual selection (which will be reused if the text
  " needs to be replaced)
  if a:type =~ '^\d\+$'
    " if type is a number, then select that many lines
    silent exe 'normal! V'.a:type.'$y'
  elseif a:type =~ '^.$'
    " if type is 'v', 'V', or '<C-V>' (i.e. 0x16) then reselect the visual region
    silent exe "normal! `<" . a:type . "`>y"
  elseif a:type == 'line'
    " line-based text motion
    silent exe "normal! '[V']y"
  elseif a:type == 'block'
    " block-based text motion
    silent exe "normal! `[\<C-V>`]y"
  else
    " char-based text motion
    silent exe "normal! `[v`]y"
  endif
  " call the user-defined function, passing it the contents of the unnamed register
  let repl = s:{a:algorithm}(@@)
  " if the function returned a value, then replace the text
  if type(repl) == 1
    " put the replacement text into the unnamed register, and also set it to be a
    " characterwise, linewise, or blockwise selection, based upon the selection type of the
    " yank we did above
    call setreg('@', repl, getregtype('@'))
    " relect the visual region and paste
    normal! gvp
  endif
  " restore saved settings and register value
  let @@ = reg_save
  let &selection = sel_save
  let &clipboard = cb_save
endfunction

function! s:ActionOpfunc(type)
  return s:DoAction(s:encode_algorithm, a:type)
endfunction

function! s:ActionSetup(algorithm)
  let s:encode_algorithm = a:algorithm
  let &opfunc = matchstr(expand('<sfile>'), '<SNR>\d\+_').'ActionOpfunc'
endfunction

function! MapAction(algorithm, key)
  exe 'nnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>ActionSetup("'.a:algorithm.'")<CR>g@'
  exe 'xnoremap <silent> <Plug>actions'    .a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",visualmode())<CR>'
  exe 'nnoremap <silent> <Plug>actionsLine'.a:algorithm.' :<C-U>call <SID>DoAction("'.a:algorithm.'",v:count1)<CR>'
  exe 'nmap '.a:key.'  <Plug>actions'.a:algorithm
  exe 'xmap '.a:key.'  <Plug>actions'.a:algorithm
  exe 'nmap '.a:key.a:key[strlen(a:key)-1].' <Plug>actionsLine'.a:algorithm
endfunction

"===============================================================================
"BEGIN Custom commands
"===============================================================================

function! s:ToArray(str)
  let s:start = line("'[")
  let s:lines_count = len(split(a:str, '\n'))
  " Add closing bracket
  exe "normal! ']o]\<Esc>"
  " Go to start line, create a line before it, enter "[" and go back to the
  " the first item
  exe "normal! " . s:start . "gg"
  exe "normal! O[\<Esc>j"
  " Wrap the item in qoutes and go to the next one
  let s:i = 0
  while s:i <= s:lines_count - 1
    exe "normal! I\<Tab>'\<Esc>A',\<Esc>j"
    let s:i += 1
  endwhile
  exe "normal! " . (s:start) . "gg"
endfunction
call MapAction('ToArray', '<Leader>ss')

function! Trim(str)
  let s:result = substitute(a:str, '\s\+$', '', 'g')
  return substitute(s:result, '^\s\+', '', 'g')
endfunction

function! s:ArrayToOneLiner(str)
  let s:start = line("'[") - 1
  let s:selected_lines = split(a:str, '\n')
  let s:trimmed_lines = map(s:selected_lines, "Trim(v:val) . ' '")
  let s:content = join(s:trimmed_lines, '')
  let s:content = Trim(s:content)
  " Remove the last comma
  let s:content = substitute(s:content, ',$', '', 'g')
  exe "normal! '[da[x"
  let s:line_content = Trim(getline(s:start)) . ' [' . s:content . '];' 
  call setline(s:start, s:line_content)
endfunction
call MapAction('ArrayToOneLiner', '<Leader>sl')

function! s:OneLinerToMultilineArray(str)
  let [s:start, s:start_cursor] = getpos("'[")
  let s:lines = split(a:str, ',')
  let s:lines = map(s:lines, "Trim(v:val)")
  let s:lines = map(s:lines, "'  ' . v:val . ','")
  let s:cursor_line = getline(s:start)
  let s:new_cursor_line = s:cursor_line[:s:start_cursor]
  call setline(s:start, s:new_cursor_line)
  let s:c = s:start + 1
  for line in s:lines
    exe "normal! o"
    call setline(s:c, line)
    let s:c += 1
  endfor
endfunction
call MapAction('OneLinerToMultilineArray', '<Leader>sL')
" TODO!

function! ImportCurrentSymbol()
  " Yank the current word into @a and go to the beginning of the file
  exe "normal! \"aywgg"
  " Type 'import '
  exe "normal! Oimport \<Esc>"
  " Paste the word you previously yanked
  exe "normal! \"ap"
  " Type the rest of the import statement
  exe "normal! a from '';\<Esc>"
  " Put the cursor inside the quotes
  exe "normal! h"
endfunction
" Run the function and go into insert mode
" (for some reason, putting the "i" in the normal! command doesn't work
" nnoremap <Leader>i :call ImportCurrentSymbol()<CR>i

function! s:CopyToSystemClipboard(str)
  let @+ = a:str
endfunction
call MapAction('CopyToSystemClipboard', '<Leader>kc')

function! PasteFromSystemClipboard()
  exe "normal! \"+p"
endfunction
nnoremap <Leader>kp :call PasteFromSystemClipboard()<CR>i

" Go to the first error in the current buffer
nnoremap [; :lfirst<CR>

" Open file history
nnoremap <Leader>h :Glog --follow<CR><CR><CR>:copen<CR>

" Diff current file with version under cursor in quickdiff window
nnoremap <Leader>gd /\.git<CR>wwwyw<Esc>:cclose<CR>:Gdiff <C-r>0<CR>

" Simple word refactoring shortcut. Hit <Leader>r<new word> on a word to
" refactor it. Navigate to more matches with `n` and `N` and redo refactoring
" by hitting the dot key.
map <Leader>r *Nciw

" Configure smooth scrolling
function SmoothScroll(up)
		set scroll=10
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 10m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction
nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>

function EnableSpellCheck()
  setlocal spell
  highlight clear SpellBad
  highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
endfunction
function DisableSpellCheck()
  setlocal nospell
endfunction
nnoremap <Leader>es :call EnableSpellCheck()<Enter>
nnoremap <Leader>ds :call DisableSpellCheck()<Enter>

" Follow JavaScript references with proper babel (and module-resolver)
" resolution (requires a git repo in the project's root)
function FollowJsReference()
  " Find the reference and yank it into the r register
  exec "normal ^f'\"ryi'"
  let s:filename = @r
  if s:filename[0] == '.'
    " Treat it as a relative reference
    let s:file_with_js = s:filename . ".js"
    let s:file_with_index_js = s:filename . "/index.js"
    if filereadable(s:file_with_js)
      exec ":edit " . s:file_with_js
    elseif filereadable(s:file_with_index_js)
      exec ":edit " . s:file_with_index_js
    else
      echo "Couldn't find reference"
    endif
  else
    " Create a file at the root with the code for babel-node to resolve the
    " reference. Ideally, I'd do this with babel-node's eval, but it errors out.
    " Instead, I create a script, evaluate it then delete it.
    let s:script_content = 'console.log(require.resolve("' . @r . '"));'
    let s:root_dir = systemlist('dirname $(. ~/vim/vimrc/scripts/find-ancestor.sh .babelrc)')[0]
    let s:create_command = 'tee ' . s:root_dir . '/___resolve.js'
    call system(s:create_command, s:script_content)
    " Run babel-node from the root dir
    let s:babel_command = 'cd  ' . s:root_dir . '&& babel-node ./___resolve.js'
    let s:out = system(s:babel_command)
    exec ":edit " . s:out
    " Clean up
    let s:delete_command = 'rm ' . s:root_dir . '/___resolve.js'
    call system(s:delete_command)
  endif
endfunction
nnoremap <Leader>gj :call FollowJsReference()<CR>

nnoremap <Leader>json :%!python -m json.tool<CR>

nnoremap <F7> :set conceallevel=0<CR>
nnoremap <F8> :set conceallevel=1<CR>

" Git log helper mappings
function StartLog()
  new
  silent read ! git log --graph --abbrev-commit --decorate --format=format:'\%C(bold blue)\%h\%C(reset) - \%C(bold cyan)\%aD\%C(reset) \%C(bold green)(\%ar)\%C(reset)\%C(auto)\%d\%C(reset)\%n''          \%C(white)\%s\%C(reset) \%C(dim white)- \%an\%C(reset)' --all
  normal ggdd
  setlocal filetype=gitlog
  setlocal readonly
  AnsiEsc
endfunction

nnoremap <silent> <Leader>ll :call StartLog()<cr>
augroup filetype_gitlog
  autocmd!
  autocmd FileType gitlog nnoremap <Leader>ly <^f;fmlye
  autocmd FileType gitlog nnoremap <Leader>le <^f;fml"lye:Gvsplit <C-r>l<CR>
  autocmd FileType gitlog nnoremap <Leader>lc <^f;fml"lye:Git checkout <C-r>l<CR>
  autocmd FileType gitlog nnoremap <c-n> /\v*.*([a-h0-9]{9})<cr>:nohl<cr>
  autocmd FileType gitlog nnoremap <c-p> ?\v*.*([a-h0-9]{9})<cr>:nohl<cr>
augroup END

" fbsimctl helper mappings
nnoremap <Leader>ilb :new<CR>:r!fbsimctl list \| grep Booted<CR>ggdd
nnoremap <Leader>ils :new<CR>:r!fbsimctl list \| grep Shutdown<CR>ggdd
nnoremap <Leader>ill :new<CR>:r!fbsimctl list<CR>ggdd
nnoremap <Leader>ib ^"fyiW:!fbsimctl <C-r>f boot &<CR>
nnoremap <Leader>is ^"fyiW:!fbsimctl <C-r>f shutdown &<CR>
nnoremap <Leader>if :!rm ~/Library/Preferences/com.apple.iphonesimulator.plist<CR>

" Faster searching
function FindSymbolInProject()
  exec 'normal "ryiw'
  exec "GitGrep -w '" . @r . "' -- :/"
endfunction
nnoremap <Leader>fs :call FindSymbolInProject()<CR>
nnoremap <f1> :GitGrep 
nnoremap <f2> :GitGrep -w 

" Load changes in quickfix list
" How to escape bash?
" function LoadChangesInQF()
"   new
"   exec "r!REL_FILES=$(git status --porcelain \| awk '{printf \"\\%s|1|\\n\", $2}'); for f in ${REL_FILES}; do echo $(pwd)/${f}; done;"
"   cgetbuffer
"   exec ":q!"
"   cfirst
" endfunction
" nnoremap <F10> :call LoadChangesInQF()<CR>

" Make it easier to navigate between pairs
nnoremap <tab> %

