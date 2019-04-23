function! CreateNetrwBuffer()
    call EventWinLeave()
    Lexplore
    call SetBuffersMode(5)
    call Init_Keybinds_(g:keybinds,'NetrwMode')
    call EventWinEnter()
endfunction

function! Key_3down(islocal)
	call feedkeys('jjj','tn')
endfunction
function! Key_3up(islocal)
	call feedkeys('kkk','tn')
endfunction
function! Key_move_to_beginning_of_word(islocal)
	call feedkeys('b','n')
endfunction
function! Key_move_to_end_of_word(islocal)
	call feedkeys('e','n')
endfunction
function! Netrw_Create_Dir(islocal)
	call netrw#Call("NetrwMakeDir","")
endfunction

fun! EventNetrwWinLeave()
	"todo remove this
        call Init_Keybinds_(g:keybinds,'DefaultMode')
endfunction
