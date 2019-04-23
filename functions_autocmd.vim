function! VimEnter()
    silent! call Init_Common_Color()
    silent! call Init_Keybinds_(g:keybinds,'Common')
    silent! call Set_NormMode_ColorStyle()
    call Daytimecolor()
    call system("tmux_nvim_update_nvim_listen_addr " . v:servername )
    set cursorline cursorcolumn
	" new nvim , so update socket file
    call system('e --scan .')
endfunction

function! BufWritePost()
if !exists("b:calendarfile")
     call RunJob( ['/bin/bash' , '-c' , 'nvim_commit_git_history ' . expand('%:p') ] )
endif
call Set_NormMode_ColorStyle()
endfunction

function! BufWritePre()
if !exists("b:calendarfile")
     call RunJobWait( ['/bin/bash' , '-c' , 'nvim_commit_git_history ' . expand('%:p') ] )
endif
call Set_NormMode_ColorStyle()
endfunction


function! DirChanged()
if filereadable("cscope.out")
    silent! cs add cscope.out
endif
endfunction
 
function! AuQuitPre()
        if  &modified
                exe "write " . g:backupdir_unsaved . "/" . strftime("%s") 
        endif
endfunction
