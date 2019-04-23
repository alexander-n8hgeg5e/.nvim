
function! SetCustomTabName(string)
  call SetTabName(a:string)
  let t:customname=1 
endfunction



function! SetTabName_(string)
if !exists("t:customname")
  call SetTabName(a:string)
endif
endfunction

function! ReceiveJobstartMessages(job_id, data, event)
  if a:event == 'stderr'
    let g:ReceiveJobstartMessages_error = strtrans(string(a:data))
  endif
  if a:event == 'stdout'
    let g:ReceiveJobstartMessages_out = strtrans(string(a:data))
  endif
  if a:event == 'exit'
    if a:data != 0
	    if exists("g:ReceiveJobstartMessages_out")
	     	echom 'Exit!=0 Output: ' . g:ReceiveJobstartMessages_out
            endif
	    if exists("g:ReceiveJobstartMessages_error")
	        echom 'Error: ' . g:ReceiveJobstartMessages_error
            endif 
    endif
  endif
endfunction


function! UnhashAll()
  exe ":%s/^\#//"
endfunction


function! Make_numbers(a,n)
execute '%substitute/' . a:a . '/\=' . 'printf(''%-3d'', line(''.'')+' . a:n . ')'
endfunction



function! RunJobSilent(cmd)
      call jobstart(a:cmd)
endfunction

function! RunJob(cmd)
      unlet! g:ReceiveJobstartMessages_error
      unlet! g:ReceiveJobstartMessages_out
      call jobstart(a:cmd,{'on_stderr':'ReceiveJobstartMessages','on_exit':'ReceiveJobstartMessages','on_stdout':'ReceiveJobstartMessages',
\                           'stdout_buffered':v:true, 'sterr_buffered':v:true    })
endfunction

function! RunJobWait(cmd)
      unlet! g:ReceiveJobstartMessages_error
      unlet! g:ReceiveJobstartMessages_out
      let id = jobstart(a:cmd,{'on_stderr':'ReceiveJobstartMessages','on_exit':'ReceiveJobstartMessages','on_stdout':'ReceiveJobstartMessages'})
      call jobwait( [ id ] )
endfunction

function! RunJobWaitSilent(cmd)
      let id = jobstart(a:cmd)
      call jobwait( [ id ] )
endfunction


function! UnloadHiddenBuffers()
    redir => buffersoutput
    buffers
    redir END
    let buflist = split(buffersoutput,"\n")
    for item in filter(buflist,"v:val[5] == 'h'")
      exec 'bunload! ' . item[:2]
    endfor
endfunction


function! Is_cursor_start_of_line()
  let win = nvim_get_current_win()
  let pos = nvim_win_get_cursor(win)
  if (pos[1] == 0)
    return 1
  else
    return 0
endif
endfunction

function! Conditional_fold()
  if Is_cursor_start_of_line() == 1
    foldclose
  endif
endfunction


function! GoogleSearch(str)
  tabnew
  call termopen("goo". f:str)
endfunction
"special character input needs mapping

function! Insidetermnewterm()
           let s:vartermterm="\<C-\>\<C-n>:term\<Cr>i"
           call feedkeys( s:vartermterm , "n" )
endfunction

function! Cscopefind(...)
        if ( a:0 == 0 )
                call feedkeys(":Cscopefind " .expand("<cword>") . " 1","mt")
        else
                exe 'cscope find '  a:000[-1]  join(a:000[0:-2])
        endif
endfunction

function! LineBreakAt(bang, ...) range
  let save_search = @/
  if empty(a:bang)
    let before = ''
    let after = '\ze.'
    let repl = '&\r'
  else
    let before = '.\zs'
    let after = ''
    let repl = '\r&'
  endif
  let pat_list = map(deepcopy(a:000), "escape(v:val, '/\\.*$^~[')")
  let find = empty(pat_list) ? @/ : join(pat_list, '\|')
  let find = before . '\%(' . find . '\)' . after
  " Example: 10,20s/\%(arg1\|arg2\|arg3\)\ze./&\r/ge
  execute a:firstline . ',' . a:lastline . 's/'. find . '/' . repl . '/ge'
  let @/ = save_search
endfunction

function! Toggle_auto_change_dir()
	if &autochdir == 0
		set autochdir
		echo 'autochdir on'
	else
		set noautochdir
		echo 'autochdir off'
	endif
endfunction


function! NetrwMultiMark(current_line,...) range
   echo a:current_line
   echo a:lastline
   echo a:firstline
   " Get the number of lines.
   let n_lines =  a:lastline - a:firstline + 1

   echo n_lines

   " This is the command to be built up.
   "
   " Iterator.
   let i = 1

   " Virtually iterate over each line and build the command.
   "
   normal a:firstline . 'gg'
   while i < n_lines
      normal "mf"
      normal "j"
      let i += 1
   endwhile
   normal a:current_line . 'gg'
endfunction


function! Todo()
edit $HOME/PIM/0_todo
endfunction


function! RandomNumber()
	redir @r
        exe '!od -An -t u2 -w2 - /dev/urandom |head -n 1'
	redir end
endfunction

fun! ModeDebug( msg )
  let s = [ a:msg ,"bufname",bufname('%'),'bufwinid',bufwinid('%'),"bufwinnr", bufwinnr('%') ]
  echom printf("%10.10S:%1.1S  %12.12S:  %-12.12S %12.12S:  %-12.12S %12.12S:  %-12.12S ", s[0],GetBuffersMode(),s[1],s[2],s[3],s[4],s[5],s[6] )
endfunction
