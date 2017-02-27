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
    echom s:i
    exe "normal! I\<Tab>'\<Esc>A',\<Esc>j"
    let s:i += 1
  endwhile
  exe "normal! " . (s:start) . "gg"
endfunction
call MapAction('ToArray', '<Leader>ss')

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
nnoremap <Leader>i :call ImportCurrentSymbol()<CR>i

function! s:CopyToSystemClipboard(str)
  let @+ = a:str
endfunction
call MapAction('CopyToSystemClipboard', '<Leader>kc')

function! PasteFromSystemClipboard()
  exe "normal! \"+p"
endfunction
nnoremap <Leader>kp :call PasteFromSystemClipboard()<CR>i
