fun! ActionExitExModeNormalEnter()
        call feedkeys("i\<CR>","n")
endfunction
fun! ActionExitExModeInsertEnter()
        call feedkeys("\<CR>","n")
endfunction
fun! ActionExitExMode3CC()
        call feedkeys("\<C-c>\<C-c>\<C-c>","n")
endfunction
fun! ActionExitExMode2CC()
        call feedkeys("\<C-c>\<C-c>","n")
endfunction

fun! EventExModeWinLeave()
	"" ex mode event is not intended to be called from Event[Find]WinEnter ,
	"" call only directly from keybinding

     let g:mode=GetBuffersMode()
     "set nocursorline nocursorcolumn
endfunction

function! EventExModeWinEnter()
	"" ex mode event is not intended to be called from EventWinEnter ,
	"" call only directly from keybinding
	if ! (GetBuffersMode()==2)
             let b:modified=0
             call Init_Keybinds(g:keybinds,'ExMode')
	call SetBuffersMode(2)
        endif

        let oldmode=g:mode
        let g:mode=GetBuffersMode()
        call EventFindWinEnter(oldmode, g:mode )
        silent call Set_NormMode_ColorStyle()
        "set cursorline cursorcolumn
        call Set_InsMode_ColorStyle()
        startinsert
endfunction
