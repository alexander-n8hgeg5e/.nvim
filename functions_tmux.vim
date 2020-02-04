
let g:tmux_functions={}

function! Tmux_enter_copy_mode()
    if b:tmux_data['mode'] != '1'
        call Tmux_pane_cmd("copy-mode","")
    end
endfunction
call extend(g:tmux_functions,{'enter_copy_mode': funcref('Tmux_enter_copy_mode') })

function! Tmux_exit_copy_mode(...)
    if b:tmux_data["mode"] !=""  
        "means data was updated successfully
        if b:tmux_data["mode"] != '0' 
            "would already done
            call chansend( g:tmux_control_job, "send-keys -t " . b:tmux_data['pane_id']. " -X cancel\n" )
        endif
    elseif len(a:000) == 0  
        " unsuccessful data update and not not yes tried this already
        call Tmux_check_and_exit_prompt()
    endif
endfunction
call extend(g:tmux_functions,{'exit_copy_mode':funcref('Tmux_exit_copy_mode')})

function! Tmux_check_and_exit_prompt()
    if has_key( b:tmux_data , "first_char" )
        if b:tmux_data["first_char"] != "|"
            startinsert
            call feedkeys("\<C-c>","nt")
            stopinsert
            " run subprocess to check, otherwise no buffer update
            call Tmux_status_line_checker_subprocess()
        endif
    endif
endfunction
call extend(g:tmux_functions,{'check_and_exit_prompt':funcref('Tmux_check_and_exit_prompt')})

function! Tmux_finish_exit_copy_mode()
    " try to get sussessful update this time
    call Tmux_update_data() 
    " prevent recursion by adding the 0
    call Tmux_exit_copy_mode(0) 
endfunction

function! Tmux_send_keys(b)
    call chansend( g:tmux_control_job, "send-keys -t " . b:tmux_data["pane_id"]." ". a:b ."\n")
endfunction
call extend(g:tmux_functions,{'send_keys':funcref('Tmux_send_keys')})

function! Tmux_pane_cmd(cmd,args)
    call chansend( g:tmux_control_job, a:cmd . " -t " . b:tmux_data['pane_id'] ." " .a:args ."\n")
endfunction
call extend(g:tmux_functions,{'pane_cmd':funcref('Tmux_pane_cmd')})

function! Tmux_command_prompt(cmd)
    call chansend( g:tmux_control_job, "command-prompt -t /dev/pts/" . b:tmux_data['client_name'] ." " .a:cmd ."\n")
endfunction
call extend(g:tmux_functions,{'command_prompt':funcref('Tmux_command_prompt')})

function! Tmux_search_up()
    call Tmux_enter_copy_mode()
    call Tmux_command_prompt('-p "(search-up)" "send -X search-backward \"%%%\""')
endfunction
call extend(g:tmux_functions,{'search_up':funcref('Tmux_search_up')})

function! Tmux_store_data(data)
    let b:tmux_data = { 
                    \   'first_char': a:data[1],
                    \   'pane_id': a:data[3] ,
                    \   'client_name':a:data[4] ,
                    \   'mode':a:data[5] ,
                    \}
endfunction
" no extend
" this func gets stored by Init_tmux_connection to g:Tmux_store_data_funcref

function! Tmux_update_data()
    let line=getline("$")
    let b:tmux_data={}
    call substitute(line,'^\([|:(]\)\([|]\([^|]*\)[|]\([^|]*\)[|]\([^|]*\)[|][|]\)\?.*$', g:Tmux_store_data_funcref ,'')
endfunction
call extend(g:tmux_functions,{'update':funcref('Tmux_update_data')})


function! Tmux_enter2copy_move_cursor()
    if mode() != "n"
        return
    end
    let p=getpos('.')
    call Tmux_enter_copy_mode()
    let s="\<S-H>0:" . p[1] . "\<CR>" . p[2] . "\<Right>"
    echo system(['xxd'], s )
    startinsert
    call feedkeys( s , "nt" )
endfunction 

function! Tmux_functions( funcnames )
    call Tmux_update_data()
    for f in a:funcnames
        call g:tmux_functions[f]() 
    endfor
endfunction

function! Tmux_functions2( funcs_args_listlist )
    call Tmux_update_data()
    for f in items(a:funcs_args_listlist)
        call g:tmux_functions[f[0]](f[1]) 
    endfor
endfunction

function! Init_tmux_connection()
    let s:callbacks = {
        \ 'on_stdout': function('To_log_on_event'),
        \ 'on_stderr': function('To_log_on_event'),
        \ 'on_exit'  : function('To_log_on_event')
        \ }
    if ! exists("g:tmux_control_job") || jobwait([g:tmux_control_job],0)[0] != -1
        let g:tmux_control_job = jobstart( ["tmux", "-S", g:tmux_socket ,"-C"], extend({"pty":"", 'shell':'tmux_control'} , s:callbacks))
    endif
    let g:Tmux_store_data_funcref = funcref('Tmux_store_data')
endfunction

function! Tmux_status_line_checker_subprocess()
    py3 pycode['tmux_status_line_checker']['code']
endfunction

function! On_tmux_control_exit()
    unlet g:tmux_control_job
endfunction


            "##############################
            "###   copymode movements   ###
            "##############################

function! Tmux_first_line()
    call Tmux_send_keys("-X top-line")
endfunction
call extend(g:tmux_functions,{'go_line1':funcref('Tmux_first_line')})

function! Tmux_middle_line()
        call Tmux_send_keys("-X middle-line")
endfunction
call extend(g:tmux_functions,{'middle_line':funcref('Tmux_middle_line')})

function! Tmux_bottom_line()
        call Tmux_send_keys("-X bottom-line")
endfunction
call extend(g:tmux_functions,{'bottom_line':funcref('Tmux_bottom_line')})


"           ########################################
"           ###     first last row conditional   ###
"           ########################################

function! Tmux_bottom_line_page_up()
    if (getcurpos()[1] - line('w0')) * 1000 / winheight(0) < 600
        call Tmux_send_keys("-X middle-line")
        call Tmux_send_keys("-X page-up")
    else
        call Tmux_send_keys("-X middle-line")
    endif
endfunction
call extend(g:tmux_functions,{'bottom_line_page_up':funcref('Tmux_bottom_line_page_up')})

function! Tmux_first_row_e()
	if line(".") == 1
        call Tmux_enter_copy_mode()
        call feedkeys("a\<S-H>eee", "nt" )
        call g:EventTermEnter()
    else
        call feedkeys("kkk","nt")
	endif
endfunction
call extend(g:tmux_functions,{'first_row_e':funcref('Tmux_first_row_e')})

function! Tmux_last_row_d()
	if line(".") == winheight(0)
        call Tmux_enter_copy_mode()
        call feedkeys("a<S-L>ddd", "nt" )
        call g:EventTermEnter()
    else
        call feedkeys("jjj","nt")
	endif
endfunction
call extend(g:tmux_functions,{'last_row_d':funcref('Tmux_last_row_d')})

function! Tmux_first_row_pgup()
	if line(".") == 1
        call Tmux_enter_copy_mode()
        call feedkeys("a\<S-H>\<PageUp>", "nt" )
        call g:EventTermEnter()
    else
        call feedkeys("\<PageUp>","nt")
	endif
endfunction
call extend(g:tmux_functions,{'first_row_pgup':funcref('Tmux_first_row_pgup')})

function! Tmux_last_row_pgdn()
    call Tmux_enter_copy_mode()
	if line(".") == winheight(0)
        call feedkeys("a\<S-L>\<PageDown>", "nt" )
        call g:EventTermEnter()
    else
        call feedkeys("\<PageDown>","nt")
	endif
endfunction
call extend(g:tmux_functions,{'last_row_pgdn':funcref('Tmux_last_row_pgdn')})

function! Tmux_first_row_up()
    call Tmux_enter_copy_mode()
	if line(".") == 1
        call feedkeys("a\<S-H>\<Up>", "nt" )
        call g:EventTermEnter()
    else
        call feedkeys("\<Up>","nt")
	endif
endfunction
call extend(g:tmux_functions,{'first_row_up':funcref('Tmux_first_row_up')})

function! Tmux_last_row_down()
    call Tmux_enter_copy_mode()
	if line(".") == winheight(0)
        call feedkeys("a\<S-L>\<Down>", "nt" )
        call g:EventTermEnter()
    else
        call feedkeys("\<Down>","nt")
	endif
endfunction
call extend(g:tmux_functions,{'last_row_down':funcref('Tmux_last_row_down')})


            "########################
            "###    seldom used   ###
            "########################

function! Tmux_copymode_d()
call Tmux_enter_copy_mode()
call feedkeys("d","nt")
endfunction

function! Tmux_copymode_f()
call Tmux_enter_copy_mode()
call feedkeys("f","nt")
endfunction

function! Tmux_copymode_s()
call Tmux_enter_copy_mode()
call feedkeys("s","nt")
endfunction

function! Tmux_copymode_3e()
call Tmux_enter_copy_mode()
call feedkeys("eee","nt")
endfunction

function! Tmux_copymode_3d()
call Tmux_enter_copy_mode()
call feedkeys("ddd","nt")
endfunction

function! Tmux_copymode_3f()
call Tmux_enter_copy_mode()
call feedkeys("fff","nt")
endfunction

function! Tmux_copymode_3s()
call Tmux_enter_copy_mode()
call feedkeys("sss","nt")
endfunction

function! Tmux_copymode_PageUp()
call Tmux_enter_copy_mode()
call feedkeys("a\<PageUp>","nt")
endfunction

function! Tmux_copymode_PageDown()
call Tmux_enter_copy_mode()
call feedkeys("a\<PageDown>","nt")
endfunction

function! Tmux_copymode_Up()
call Tmux_enter_copy_mode()
call feedkeys("\<Up>","nt")
endfunction

function! Tmux_copymode_Down()
call Tmux_enter_copy_mode()
call feedkeys("\<Down>","nt")
endfunction

function! Tmux_copymode_Right()
call Tmux_enter_copy_mode()
call feedkeys("\<Right>","nt")
endfunction

function! Tmux_copymode_Left()
call Tmux_enter_copy_mode()
call feedkeys("\<Left>","nt")
endfunction

function! Tmux_PageDown()
call Tmux_exit_copy_mode()
call feedkeys("a\<PageDown>","nt")
endfunction

function! Tmux_PageUp()
call Tmux_exit_copy_mode()
call feedkeys("a\<PageUp>","nt")
endfunction

function! Tmux_Down()
call Tmux_exit_copy_mode()
call feedkeys("a\<Down>","nt")
endfunction

function! Tmux_Up()
call Tmux_exit_copy_mode()
call feedkeys("a\<Up>","nt")
endfunction

function! Tmux_Left()
call Tmux_exit_copy_mode()
call feedkeys("a\<Left>","nt")
endfunction

function! Tmux_Right()
call Tmux_exit_copy_mode()
call feedkeys("a\<Right>","nt")
endfunction

function! Tmux_e()
call Tmux_exit_copy_mode()
call feedkeys("e","nt")
endfunction

function! Tmux_f()
call Tmux_exit_copy_mode()
call feedkeys("f","nt")
endfunction

function! Tmux_s()
call Tmux_exit_copy_mode()
call feedkeys("s","nt")
endfunction

function! Tmux_d()
call Tmux_exit_copy_mode()
call feedkeys("d","nt")
endfunction

function! Tmux_copymode_e()
    call Tmux_enter_copy_mode()
    call feedkeys("e","nt")
endfunction

" gen time string
function! Get_tmux_session_time_str()
    py3 vim.vars['tmux_session_time_str']=get_useful_localtime_string(dec_sec_sep="_")
    return g:tmux_session_time_str
endfunction
