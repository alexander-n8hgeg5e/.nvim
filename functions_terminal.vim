function! Create_Terminal_buffer_0()  "means: Action: create one
"       called from default mapping
        stopinsert
	let isTermMode=(GetBuffersMode() == 1)
        " get stuff
	if (len(expand('%:h')) > 0) && ( ! isTermMode )
		" while %:p may return no path, %:p:h always returns
		" something, homedir or so at least
		let cwdname=expand('%:p:h')
	else
		let cwdname=getcwd()
	endif
	let cwdname_clean=substitute(cwdname,'\W','_','g')
	let tmux_session_name= "nvim_" . localtime() . "_" . cwdname_clean
	let tmux_cmdbase="tmux -S ". g:tmux_socket
	" check if buffer has a related tmux session and in case
	" remember that and make a backup of the session name
	if exists("b:related_tmux_session_name")
		call system( tmux_cmdbase ." has-session -t " . b:related_tmux_session_name)
		let status_has_related_session=$status
		" backup the session because buffer vars will be away after splitting 
		" or cleared by term creation
		let related_tmux_session_name_backup=b:related_tmux_session_name 
	else
		let status_has_related_session=1
		" befor splitting record related session name into buffer that will be created
		" means: relate the buffer to the session name
		let b:related_tmux_session_name=tmux_session_name
	endif
	let has_related_session=(status_has_related_session==0)

	" no split in case: buffer has: no filename and nothing unsaved and to be sure not mode:Term
	" (2nd: use &modified option to check)
	" split in case: all other
	" filename:
	let has_filename=(len(expand('%:h')) > 0)
	if has_filename || &modified || isTermMode
		call EventWinLeave()
		split
	endif
	" if buffer has a tmux session
	" associated (b:related_tmux_session_name) then
	" attach it
	" else create one
	" decide whether to split window
	if has_related_session
			exe "term " . tmux_cmdbase "attach-session -t" related_tmux_session_name_backup
	                let b:tmux_session_name=related_tmux_session_name_backup
	else
			exe "term " . tmux_cmdbase . " new-session -s " . tmux_session_name . " -c " . cwdname
	                let b:tmux_session_name=tmux_session_name
	endif
	" set buffervars
	" befor here buffer vars are lost
        call SetBuffersMode(1)
	call EventWinEnter()
	let b:tmux_cmdbase=tmux_cmdbase
	call g:DoConfigDependentTerminalConfiguration()
	" init keybinds
        call Init_Keybinds_(g:keybinds,'TermMode')
        call Set_Term_Colors()      " this is needed befor terminal creation , colors are selected for background
        call SetTabName_('Term')
        startinsert!
endfunction
function! Generate_funktion_Create_Terminal_buffer()
        if ! g:term_color &&  ! g:term_2color 
		let g:Create_Terminal_buffer=function("Create_Terminal_buffer_0")
	endif
        if   g:term_color &&   ! g:term_2color 
		let g:Create_Terminal_buffer=function("Create_Terminal_buffer_0")
	endif
        if ! g:term_color &&   g:term_2color 
         "no term color -> no 2 color
		let g:Create_Terminal_buffer=function("Create_Terminal_buffer_0")
	endif
        if   g:term_color &&   g:term_2color 
		let g:Create_Terminal_buffer=function("Create_Terminal_buffer_0")
	endif
endfunction


function! EventTermEnter_0()  "means: Event: normal -> terminsert
endfunction
function! EventTermEnter_1()
endfunction
function! EventTermEnter_2()
endfunction
function! EventTermEnter_3()
endfunction
function! EventTermEnter_4()
endfunction
function! EventTermEnter_5()
call Set_TermActiv_Color()
endfunction
function! EventTermEnter_6()
endfunction
function! EventTermEnter_7()
call Set_TermActiv_Color()
endfunction


function! Generate_funktion_EventTermEnter()
if ! g:term_color && ! g:TerminalSpecialMovement &&  ! g:term_2color 
        let g:EventTermEnter=function("EventTermEnter_0")                                              
endif                                                                                      
if g:term_color && ! g:TerminalSpecialMovement   &&  !  g:term_2color
        let g:EventTermEnter=function("EventTermEnter_1")                                              
endif                                                                                      
if ! g:term_color && g:TerminalSpecialMovement   &&  ! g:term_2color
        let g:EventTermEnter=function("EventTermEnter_2")                                              
endif                                                                                      
if g:term_color && g:TerminalSpecialMovement     &&  ! g:term_2color
        let g:EventTermEnter=function("EventTermEnter_3")
endif
if ! g:term_color && ! g:TerminalSpecialMovement &&   g:term_2color 
        let g:EventTermEnter=function("EventTermEnter_4")
endif
if g:term_color && ! g:TerminalSpecialMovement   &&    g:term_2color
        let g:EventTermEnter=function("EventTermEnter_5")
endif
if ! g:term_color && g:TerminalSpecialMovement   &&   g:term_2color
        let g:EventTermEnter=function("EventTermEnter_6")
endif
if g:term_color && g:TerminalSpecialMovement     &&   g:term_2color
        let g:EventTermEnter=function("EventTermEnter_7")
endif
endfunction


"" one time terminal buffer init
"" only config dependend stuff
function! DoConfigDependentTerminalConfiguration_0()
endfunction
function! DoConfigDependentTerminalConfiguration_1()
    call Set_TermInaktiv_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_2()
endfunction
function! DoConfigDependentTerminalConfiguration_3()
    call Set_TermInaktiv_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_4()
    call Daytimecolor()
endfunction
function! DoConfigDependentTerminalConfiguration_5()
    call Set_TermInaktiv_Color()
    call Daytimecolor()
endfunction
function! DoConfigDependentTerminalConfiguration_6()
    call Daytimecolor()
endfunction
function! DoConfigDependentTerminalConfiguration_7()
    call Set_TermInaktiv_Color()
    call Daytimecolor()
endfunction

function! Generate_funktion_DoConfigDependentTerminalConfiguration()
if ! g:term_color && ! g:TerminalSpecialMovement  && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration=function("DoConfigDependentTerminalConfiguration_0")
endif
if g:term_color && ! g:TerminalSpecialMovement    && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration=function("DoConfigDependentTerminalConfiguration_1")
endif
if ! g:term_color && g:TerminalSpecialMovement    && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration=function("DoConfigDependentTerminalConfiguration_2")
endif
if g:term_color && g:TerminalSpecialMovement      && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration=function("DoConfigDependentTerminalConfiguration_3")
endif
if ! g:term_color && ! g:TerminalSpecialMovement  &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration=function("DoConfigDependentTerminalConfiguration_4")
endif
if g:term_color && ! g:TerminalSpecialMovement    &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration=function("DoConfigDependentTerminalConfiguration_5")
endif
if ! g:term_color && g:TerminalSpecialMovement    &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration=function("DoConfigDependentTerminalConfiguration_6")
endif
if g:term_color && g:TerminalSpecialMovement      &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration=function("DoConfigDependentTerminalConfiguration_7")
endif
endfunction


function! EventTermEscape_0()       "Event
call Set_NormMode_ColorStyle()
"norm G
endfunction
function! EventTermEscape_1()
call Set_NormMode_ColorStyle()
"norm G
endfunction
function! EventTermEscape_2()
call Set_NormMode_ColorStyle()
call TerminalSpecialMovementUpdateOn()
"norm G
endfunction
function! EventTermEscape_3()
call Set_NormMode_ColorStyle()
call TerminalSpecialMovementUpdateOn()
"norm G
endfunction
function! EventTermEscape_4()
call Set_NormMode_ColorStyle()
endfunction
function! EventTermEscape_5()
call Set_NormMode_ColorStyle()
call Set_TermInaktiv_Color()
"norm G
endfunction
function! EventTermEscape_6()
call Set_NormMode_ColorStyle()
call TerminalSpecialMovementUpdateOn()
"norm G
endfunction
function! EventTermEscape_7()
call Set_NormMode_ColorStyle()
call Set_TermInaktiv_Color()
call TerminalSpecialMovementUpdateOn()
"norm G
endfunction

function! Generate_funktion_EventTermEscape()
if ! g:term_color && ! g:TerminalSpecialMovement && ! g:term_2color 
        let g:EventTermEscape=function("EventTermEscape_0")
endif
if g:term_color && ! g:TerminalSpecialMovement   && ! g:term_2color 
        let g:EventTermEscape=function("EventTermEscape_1")
endif
if ! g:term_color && g:TerminalSpecialMovement   && ! g:term_2color
        let g:EventTermEscape=function("EventTermEscape_2")
endif
if g:term_color && g:TerminalSpecialMovement     && ! g:term_2color
        let g:EventTermEscape=function("EventTermEscape_3")
endif
if ! g:term_color && ! g:TerminalSpecialMovement  &&  g:term_2color 
        let g:EventTermEscape=function("EventTermEscape_4")
endif
if g:term_color && ! g:TerminalSpecialMovement   &&  g:term_2color
        let g:EventTermEscape=function("EventTermEscape_5")
endif
if ! g:term_color && g:TerminalSpecialMovement   &&  g:term_2color
        let g:EventTermEscape=function("EventTermEscape_6")
endif
if g:term_color && g:TerminalSpecialMovement   && g:term_2color
        let g:EventTermEscape=function("EventTermEscape_7")
endif
endfunction



function! TerminalSpecialMovementOn()
    echo "tsp on"
    exe "nnoremap  <buffer> <silent> p        " .    g:keybinds['p___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> <Left>   " .    g:keybinds['<Left>___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> <Right>  " .    g:keybinds['<Right>___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> <Up>     " .    g:keybinds['<Up>___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> <Down>   " .    g:keybinds['<Down>___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> s        " .    g:keybinds['s___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> f        " .    g:keybinds['f___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> e        " .    g:keybinds['e___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> d        " .    g:keybinds['d___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> <Space>  " .    g:keybinds['<Space>___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> <PageUp> " .    g:keybinds['<PageUp>___n___TermSpecialMovement'][1]
    exe "nnoremap  <buffer> <silent> <PageDown> " .  g:keybinds['<PageDown>___n___TermSpecialMovement'][1]
endfunction

function! TerminalSpecialMovementOff()
     echo "tsp off"
     exe "nnoremap <silent> <buffer>  p        " . g:keybinds['p___n___Common'][1]
     exe "nnoremap <silent> <buffer>  <Left>   " . g:keybinds['<Left>___n___Common'][1]
     exe "nnoremap <silent> <buffer>  <Right>  " . g:keybinds['<Right>___n___Common'][1]
     exe "nnoremap <silent> <buffer>  <Up>     " . g:keybinds['<Up>___n___Common'][1]
     exe "nnoremap <silent> <buffer>  <Down>   " . g:keybinds['<Down>___n___Common'][1]
     exe "nnoremap <silent> <buffer>  s        " . g:keybinds['s___n___Common'][1]
     exe "nnoremap <silent> <buffer>  f        " . g:keybinds['f___n___Common'][1]
     exe "nnoremap <silent> <buffer>  e        " . g:keybinds['e___n___TermMode'][1]
     exe "nnoremap <silent> <buffer>  d        " . g:keybinds['d___n___TermMode'][1]
     exe "nnoremap <silent> <buffer>  <Space>  " . g:keybinds['<Space>___n___TermMode'][1]
     exe "nnoremap  <buffer> <silent> <PageUp> " . g:keybinds['<PageUp>___n___TermMode'][1]
     exe "nnoremap  <buffer> <silent> <PageDown> " g:keybinds['<PageDown>___n___TermMode'][1]
endfunction

function! TerminalSpecialMovementToggle()
 if exists("b:TerminalSpecialMovement")
     if b:TerminalSpecialMovement == 0
         let b:TerminalSpecialMovement= 1
         call TerminalSpecialMovementOn()
     else
         let b:TerminalSpecialMovement= 0
         call TerminalSpecialMovementOff()
     endif 
 else
     let b:TerminalSpecialMovement= 1
     call TerminalSpecialMovementOn()
 endif
endfunction

function! TerminalSpecialMovementUpdateOn()
 if exists("b:TerminalSpecialMovement")
     if b:TerminalSpecialMovement == 1
         call TerminalSpecialMovementOn()
     endif
 endif
endfunction

function! TermKeyNCE()
	startinsert!
	call feedkeys("\<C-a>","mt")
	call feedkeys("s","mt")
	call feedkeys("\<C-\>\<C-n>",'mt')
endfunction




function! ConfDep_Event_TermWinEnter_0() " Event
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_1()
  call Set_TermInaktiv_Color()
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_2()
  call TerminalSpecialMovementUpdateOn()
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_3()
  call Set_TermInaktiv_Color()
  call TerminalSpecialMovementUpdateOn()
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_4() " Event
  startinsert
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_5()
  call Set_TermInaktiv_Color()
  startinsert
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_6()
  call TerminalSpecialMovementUpdateOn()
  startinsert
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_7()
  call Set_TermInaktiv_Color()
  call TerminalSpecialMovementUpdateOn()
  startinsert
  "norm G
endfunction

function! Generate_funktion_ConfDep_Event_TermWinEnter()
if ! g:term_color && ! g:TerminalSpecialMovement && ! g:TerminalAutoGoIn 
        let g:ConfDep_Event_TermWinEnter=function("ConfDep_Event_TermWinEnter_0")
endif
if g:term_color && ! g:TerminalSpecialMovement  && ! g:TerminalAutoGoIn
        let g:ConfDep_Event_TermWinEnter=function("ConfDep_Event_TermWinEnter_1")
endif
if ! g:term_color && g:TerminalSpecialMovement  && ! g:TerminalAutoGoIn
        let g:ConfDep_Event_TermWinEnter=function("ConfDep_Event_TermWinEnter_2")
endif
if g:term_color && g:TerminalSpecialMovement  && ! g:TerminalAutoGoIn
        let g:ConfDep_Event_TermWinEnter=function("ConfDep_Event_TermWinEnter_3")
endif
if ! g:term_color && ! g:TerminalSpecialMovement  &&  g:TerminalAutoGoIn
        let g:ConfDep_Event_TermWinEnter=function("ConfDep_Event_TermWinEnter_4")
endif
if g:term_color && ! g:TerminalSpecialMovement &&  g:TerminalAutoGoIn
        let g:ConfDep_Event_TermWinEnter=function("ConfDep_Event_TermWinEnter_5")
endif
if ! g:term_color && g:TerminalSpecialMovement &&  g:TerminalAutoGoIn
        let g:ConfDep_Event_TermWinEnter=function("ConfDep_Event_TermWinEnter_6")
endif
if g:term_color && g:TerminalSpecialMovement &&  g:TerminalAutoGoIn
        let g:ConfDep_Event_TermWinEnter=function("ConfDep_Event_TermWinEnter_7")
endif
endfunction



function! ConfDep_Event_TermWinLeave_0()
  call Set_NormMode_ColorStyle() 
endfunction
function! ConfDep_Event_TermWinLeave_1()
  call Set_NormMode_Color()
endfunction
function! ConfDep_Event_TermWinLeave_2()
  call Set_NormMode_ColorStyle() 
endfunction
function! ConfDep_Event_TermWinLeave_3()
  call Set_NormMode_Color()
endfunction



function! Generate_funktion_ConfDep_Event_TermWinLeave()
if ! g:term_color && ! g:TerminalSpecialMovement 
        let g:ConfDep_Event_TermWinLeave=function("ConfDep_Event_TermWinLeave_0")
endif
if g:term_color && ! g:TerminalSpecialMovement 
        let g:ConfDep_Event_TermWinLeave=function("ConfDep_Event_TermWinLeave_1")
endif
if ! g:term_color && g:TerminalSpecialMovement 
        let g:ConfDep_Event_TermWinLeave=function("ConfDep_Event_TermWinLeave_2")
endif
if g:term_color && g:TerminalSpecialMovement 
        let g:ConfDep_Event_TermWinLeave=function("ConfDep_Event_TermWinLeave_3")
endif
endfunction
