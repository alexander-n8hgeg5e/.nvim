function! Tmux_enter_copy_mode()
  call system(b:tmux_cmdbase . " copy-mode  -t " . b:tmux_session_name)
  "exe 'py3 p=tmux_sessions_dict.get("' . b:tmux_session_name . '").cmd("copy-mode")'
endfunction

function! Tmux_exit_copy_mode()
  call system(b:tmux_cmdbase . " send-keys -t " . b:tmux_session_name . " -X cancel")
  "exe 'py3 tmux_sessions_dict.get("' . b:tmux_session_name . '").attached_pane.send_keys("-X cancel", enter=False, suppress_history=False, literal=False)'
endfunction

function! Tmux_copymode_e()
call Tmux_enter_copy_mode()
call feedkeys("e","nt")
endfunction

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
