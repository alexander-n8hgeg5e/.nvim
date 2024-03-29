fun! EnumerateModes(modesliste)
    let g:mode2modeid = {}
    let g:modeid2mode = {}
    for j in range( 0, len(a:modesliste) - 1 )
        call extend( g:modeid2mode , { j : a:modesliste[j] } )
        call extend( g:mode2modeid , { a:modesliste[j] : j } )
    endfor
endfunction

fun! g:GetBuffersMode()
if exists( "b:mode" )
	return b:mode
else
	return "0"
endif
endfunction

fun! SetBuffersMode(mode)
    let b:mode = a:mode
endfunction

function! EventFindWinEnter(oldmode, mode_new)
	"" ex mode event is not intended to be called from Event[Find]WinEnter ,
	"" call only directly from keybinding
	"if (a:oldmode == 1) && ( a:mode_new != 1 )
    "    " todo: move this
    "    set number
    "    set relativenumber
    "endif
	if (a:mode_new == 1)
		call g:ConfDep_Event_TermWinEnter()
	elseif (a:mode_new == 3)
		call g:MuttWinEnter()
    elseif (a:mode_new == 5)
		call EventNerdtreeWinEnter()
	endif
endfunction

function! EventFindWinLeave(mode)
	"" ex mode event is not intended to be called from Event[Find]WinEnter ,
	"" call only directly from keybinding
	if (a:mode == 6)
		call EventNetrwWinLeave()
    elseif (a:mode == 5)
		call EventNerdtreeWinLeave()
	elseif (a:mode == 1)
	call g:ConfDep_Event_TermWinLeave()
	elseif (a:mode == 3)
		call g:MuttWinLeave()
	endif
endfunction

function! EventWinEnter()
  let oldmode=g:mode
  let g:mode=GetBuffersMode()
  silent call Set_NormMode_ColorStyle()
  call EventFindWinEnter(oldmode, g:mode )
  "set cursorcolumn cursorline
endfunction

function! EventWinLeave()
  let g:mode=GetBuffersMode()
  call EventFindWinLeave(g:mode)
  "set nocursorcolumn nocursorline
endfunction


function! CmdwinEnter()
"set cursorcolumn
if ! exists("b:ExMode_Keybinds")
        call Init_Keybinds(g:keybinds,'ExMode')
        call Init_Keybinds(g:keybinds_apps,'ExMode')
else
        let b:ExMode_Keybinds=1
endif
endfunction
