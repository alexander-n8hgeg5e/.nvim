function! VimEnter()
    call Init_Common_Color()
    call Init_Keybinds(g:keybinds,'Common')
    call Set_NormMode_ColorStyle()
    call Color_get_hour_choice()
    call system(["tmux_nvim_update_nvim_listen_addr ", v:servername ])
    "set cursorline cursorcolumn
	" new nvim , so update socket file
    "call system(['e', '--scan', '.'])
    exe "set sidescrolloff=".g:sidescrolloff
    exe "set sidescroll=".g:sidescroll
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


"        #####################################
"        ###   actions on modified-state   ###
"        #####################################

" make the variable
function! BufAdd(a)
    if bufnr(a:a) != -1
        call setbufvar( a:a , 'modified', &modified )
    else
        "echo "bufnur got from aucmd: " . a:a . "bufexists: ". bufexists(a:a) . "buflisted: " buflisted(a:a)
        let g:pyvar_0=a:a
        "py3 pwp.nvim_msg("if it's added shouldn't it somehow be there ?\\n      |BufAdd|        just after adding a buffer to the buffer list")
        py3 pwp.run_pycode(pycode['wait_buf_exists_set_bufmodified_bufvar']['code'])
    endif
endfunction

function! TextChanged()
    if ! exists("b:modified")
        echo "did not exist"
        let b:modified = &modified
        return
    endif
    if b:modified != &modified
        let b:modified=&modified
        call Set_NormMode_ColorStyle()
    endif 
endfunction

function! TextChangedI()
    if ! exists("b:modified")
        echo "did not exist"
        let b:modified = &modified
        return
    endif
    if b:modified != &modified
        let b:modified=&modified
        call Set_InsMode_ColorStyle()
    endif 
endfunction
