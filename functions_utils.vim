
function! SetCustomTabName(string)
  call SetTabName(a:string)
  let t:customname=1 
endfunction


function! CenterSearch()
  let cmdtype = getcmdtype()
  if cmdtype == '/' || cmdtype == '?'
    return "\<enter>zz"
  endif
  return "\<enter>"
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


function! Make_numbers(range,placeholder,line_offset )
execute a:range . 'substitute/' . a:placeholder . '/\=' . 'printf(''%-d'', line(''.'')+' . a:line_offset . ')'
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
    try
        foldclose
    catch E490
    endtry
  endif
endfunction

function! Get_space(count)
    let s:retval=' '
    for i in range(a:count)
        let s:retval=s:retval.' '
    endfor
    return s:retval
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
	if a:000[0] == 0
		call feedkeys("\<C-]>","tn")
    elseif a:000[0] == 11
	    exe "cscope find  0" a:000[1]
    elseif a:000[0] == 22
	    exe "help" a:000[1]
	else
	        exe "cscope find"  a:000[0] a:000[1]
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

function! Get_indents()
    let lastl=getpos("$")[1]
    let indents = []
    for line in range( 1 , lastl )
        call add( indents , indent( line ) )
    endfor
    return indents
endfunction

function! Get_indent_fix_python(indent_width)
    let indentspace="      "
    let indents=Get_indents()
    let lastl=len(indents)
    let indentlevel=0
    let levels=[indents[0]]
    let indenterror = indents[0]  % a:indent_width
    if indenterror != 0
        "echo "wrong: " . levels[0] "__" indents[0]
        let linefix = [ - indenterror ]
    else
        let linefix = [ 0 ]
    endif
    let fixedlevels = [ indents[0] + linefix[0] ]

    for line in range(2,lastl) "including 1 and lastl
        let i=line-1
        call add( linefix, 0 )
        "echo "line: " . line
        "echo indentspace "start" levels "[". indentlevel . "] = " indents[i]
        let ll=len(trim(getline(line)))
        if indents[i] > levels[indentlevel]
           "echo "       greater"
           " setup the levels
           call add(fixedlevels, fixedlevels[indentlevel] + a:indent_width )
           let indentlevel += 1
           call add(levels,indents[i])
        elseif indents[i] < levels[indentlevel]
            if ll != 0
                " unindent to some level ,find it 
                for j in range(indentlevel , 0 , - 1 )
                    " search for current unindent
                    if levels[j] == indents[i]
                        "found
                        "echo "unindent to level: "j
                        let levels=levels[0:j]
                        let fixedlevels=fixedlevels[0:j]
                        let indentlevel = j
                    endif
                endfor
                if levels[indentlevel] != indents[i]
                    " wrong unindent
                    "echoe indentspace "error: wrong unindent, expected " levels[indentlevel] ", but was " indents[i] " on line" line
                endif
            "else
                    "echo "empty line"
                    ""do nothing!
            endif
        endif
        " calc error and store fix
        if ll != 0 
            let indenterror = indents[i] - fixedlevels[indentlevel]
        else
            let indenterror = 0
        endif
        if (indenterror != 0)
               let linefix[i] = - indenterror
               "echo "linefix: " . linefix[i]
        endif
        "echo indentspace "  end" levels "[". indentlevel. "] = " indents[i]
        "echo " "
    endfor
    return linefix
endfunction

function! Get_fix_python_indent_cmd_list(w)
    let fixlist=Get_indent_fix_python(a:w)
    let fixcmdlist=[]
    for i in range(1,len(fixlist))
        let fix=fixlist[i-1]
        if fix > 0
            call add(fixcmdlist,  i . 's/\v^/' . repeat(" ",fix) . '/' )
        elseif fix < 0
            call add(fixcmdlist,  i . 's/\v^[ ]{' . - fix .  '}//')
        endif
    endfor
    return fixcmdlist
endfunction


function! Fix_python_indent( w )
    let foldenable=&foldenable
    set nofoldenable
    for i in Get_fix_python_indent_cmd_list(a:w)
        "let s="do: ". i. " ?"
        "call input(s)
        exe i
    endfor
    if foldenable==0
        set foldenable
    endif
endfun

function! Sub10base_divider(b,c,d)
    return substitute( a:b ,'\(\d\+\)\(\d\{3}\)['.a:c.']','\= Sub10base_divider( submatch(1) . a:d , a:c , a:d )  . submatch(2) . a:d ',"g")
endfunction

function! Sub10base_divider_tmux_time(b,c,d)
    return substitute( a:b ,'\(\d\+\)\(\d\{3}\)\(\d\{3}\)['.a:c.']','\= submatch(1) . a:d.a:d . submatch(2) . a:d . submatch(3) .a:d .a:d ', "g" )
endfunction

function! To_log(data)
  redir! >> /tmp/tmux_control_log
  echo a:data
  redir END
endfunction

function! To_log_on_event(job_id, data, event) dict
  if a:event == 'stdout'
    let str = self.shell.' stdout: '.join(a:data)
  elseif a:event == 'stderr'
    let str = self.shell.' stderr: '.join(a:data)
  else
    let str = self.shell.' exited'
  endif
  silent call To_log(str)
endfunction

function! Echo(a)
    echo a:a
endfunction

function! Goo(search_string)
    let tmux_session_name= g:nvim_id ."_". Sub10base_divider_tmux_time( py3eval("'{:.3f}'.format(time())") ,'._','_')."__"."google"
    call g:Create_Terminal_buffer( "goo " . a:search_string, tmux_session_name )
endfunction

function! DDG(search_string)
    let tmux_session_name= g:nvim_id ."_". Sub10base_divider_tmux_time( py3eval("'{:.3f}'.format(time())") ,'._','_')."__"."DDgo"
    call g:Create_Terminal_buffer( "dg " . a:search_string, tmux_session_name )
endfunction

function! Get_comment_char()
    if b:current_syntax == "vim"
        return '"'
    elseif b:current_syntax == "tex" || b:current_syntax =="plaintex"
        return "%"
    elseif b:current_syntax == "c"
        return "//"
    elseif b:current_syntax == "cpp"
        return "//"
    elseif b:current_syntax == "javascript"
        return "//"
    else
        return '#'
    endif
endfunction

function! Find_file_for_includeexpr()
    let apath=substitute(getline("."), g:pat_fname ,"\\2", "",)
    if filereadable(apath)
        return apath
    else
        let g:pyvar_includeexpr=apath
        py3 exec(pycode['find_file_for_includeexpr']['code'])
        py3 vim.vars['pyvar_includeexpr']=find_file_for_includeexpr()
        if g:pyvar_includeexpr != apath
            echo g:pyvar_includeexpr
            return g:pyvar_includeexpr
        else
            echo "no"
            return ""
        endif
    endif
endfunction
