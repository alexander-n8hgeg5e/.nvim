function! Mutt()
  tabnew
  silent call termopen('m')
  call SetTabName_('Mutt')
  let w:mode='mutt'
  call Init_Keybinds_(g:keybinds,'Mutt')
  call SetBuffersMode(3)
  set cursorline cursorcolumn
  call Set_NormMode_ColorStyle()
  startinsert
endfunction
"#####################################################################################

function! Enter_Mutt_Term_0()  " means Action called by keybinding: enters the term
call MuttEnter_0()
startinsert!
endfunction
function! Enter_Mutt_Term_1()
call MuttEnter_1()
startinsert!
endfunction
function! Enter_Mutt_Term_2()
call MuttEnter_2()
startinsert!
endfunction
function! Enter_Mutt_Term_3()
call MuttEnter_3()
startinsert!
endfunction
function! Enter_Mutt_Term_4()
call MuttEnter_4()
startinsert!
endfunction
function! Enter_Mutt_Term_5()
call MuttEnter_5()
startinsert!
endfunction
function! Enter_Mutt_Term_6()
call MuttEnter_6()
startinsert!
endfunction
function! Enter_Mutt_Term_7()
call MuttEnter_7()
startinsert!
endfunction



function! Generate_funktion_Enter_Mutt_Term()
if ! g:term_color && ! g:TerminalSpecialMovement &&  ! g:term_2color 
        let g:Enter_Mutt_Term=function("Enter_Mutt_Term_0")                                              
endif                                                                                      
if g:term_color && ! g:TerminalSpecialMovement   &&  !  g:term_2color
        let g:Enter_Mutt_Term=function("Enter_Mutt_Term_1")                                              
endif                                                                                      
if ! g:term_color && g:TerminalSpecialMovement   &&  ! g:term_2color
        let g:Enter_Mutt_Term=function("Enter_Mutt_Term_2")                                              
endif                                                                                      
if g:term_color && g:TerminalSpecialMovement     &&  ! g:term_2color
        let g:Enter_Mutt_Term=function("Enter_Mutt_Term_3")
endif
if ! g:term_color && ! g:TerminalSpecialMovement &&   g:term_2color 
        let g:Enter_Mutt_Term=function("Enter_Mutt_Term_4")
endif
if g:term_color && ! g:TerminalSpecialMovement   &&    g:term_2color
        let g:Enter_Mutt_Term=function("Enter_Mutt_Term_5")
endif
if ! g:term_color && g:TerminalSpecialMovement   &&   g:term_2color
        let g:Enter_Mutt_Term=function("Enter_Mutt_Term_6")
endif
if g:term_color && g:TerminalSpecialMovement     &&   g:term_2color
        let g:Enter_Mutt_Term=function("Enter_Mutt_Term_7")
endif
endfunction
"###########################################################################################
"
function! MuttWinEnter_0() " Event
  call Set_NormMode_ColorStyle()
  "norm G
endfunction
function! MuttWinEnter_1()
  call Set_TermInaktiv_Color()
  call Set_NormMode_ColorStyle()
  "norm G
endfunction
function! MuttWinEnter_2()
  call Set_NormMode_ColorStyle()
  call TerminalSpecialMovementUpdateOn()
  "norm G
endfunction
function! MuttWinEnter_3()
  call Set_TermInaktiv_Color()
  call Set_NormMode_ColorStyle()
  call TerminalSpecialMovementUpdateOn()
  "norm G
endfunction
function! MuttWinEnter_4() " Event
  call Set_NormMode_ColorStyle()
  startinsert
  "norm G
endfunction
function! MuttWinEnter_5()
  call Set_TermInaktiv_Color()
  call Set_NormMode_ColorStyle()
  startinsert
  "norm G
endfunction
function! MuttWinEnter_6()
  call Set_NormMode_ColorStyle()
  call TerminalSpecialMovementUpdateOn()
  startinsert
  "norm G
endfunction
function! MuttWinEnter_7()
  call Set_TermInaktiv_Color()
  call Set_NormMode_ColorStyle()
  call TerminalSpecialMovementUpdateOn()
  startinsert
  "norm G
endfunction

function! Generate_funktion_MuttWinEnter()
if ! g:term_color && ! g:TerminalSpecialMovement && ! g:TerminalAutoGoIn 
        let g:MuttWinEnter=function("MuttWinEnter_0")
endif
if g:term_color && ! g:TerminalSpecialMovement  && ! g:TerminalAutoGoIn
        let g:MuttWinEnter=function("MuttWinEnter_1")
endif
if ! g:term_color && g:TerminalSpecialMovement  && ! g:TerminalAutoGoIn
        let g:MuttWinEnter=function("MuttWinEnter_2")
endif
if g:term_color && g:TerminalSpecialMovement  && ! g:TerminalAutoGoIn
        let g:MuttWinEnter=function("MuttWinEnter_3")
endif
if ! g:term_color && ! g:TerminalSpecialMovement  &&  g:TerminalAutoGoIn
        let g:MuttWinEnter=function("MuttWinEnter_4")
endif
if g:term_color && ! g:TerminalSpecialMovement &&  g:TerminalAutoGoIn
        let g:MuttWinEnter=function("MuttWinEnter_5")
endif
if ! g:term_color && g:TerminalSpecialMovement &&  g:TerminalAutoGoIn
        let g:MuttWinEnter=function("MuttWinEnter_6")
endif
if g:term_color && g:TerminalSpecialMovement &&  g:TerminalAutoGoIn
        let g:MuttWinEnter=function("MuttWinEnter_7")
endif
endfunction

"######################################################################################################################

function! MuttWinLeave_0()
  call Set_NormMode_ColorStyle() 
endfunction
function! MuttWinLeave_1()
  call Set_NormMode_Color()
endfunction
function! MuttWinLeave_2()
  call Set_NormMode_ColorStyle() 
endfunction
function! MuttWinLeave_3()
  call Set_NormMode_Color()
endfunction



function! Generate_funktion_MuttWinLeave()
if ! g:term_color && ! g:TerminalSpecialMovement 
        let g:MuttWinLeave=function("MuttWinLeave_0")
endif
if g:term_color && ! g:TerminalSpecialMovement 
        let g:MuttWinLeave=function("MuttWinLeave_1")
endif
if ! g:term_color && g:TerminalSpecialMovement 
        let g:MuttWinLeave=function("MuttWinLeave_2")
endif
if g:term_color && g:TerminalSpecialMovement 
        let g:MuttWinLeave=function("MuttWinLeave_3")
endif
endfunction
"###############################################


function! MuttEnter_0()  "means: Event: normal -> terminsert
endfunction
function! MuttEnter_1()
endfunction
function! MuttEnter_2()
endfunction
function! MuttEnter_3()
endfunction
function! MuttEnter_4()
endfunction
function! MuttEnter_5()
call Set_TermActiv_Color()
endfunction
function! MuttEnter_6()
endfunction
function! MuttEnter_7()
call Set_TermActiv_Color()
endfunction


function! Generate_funktion_MuttEnter()
if ! g:term_color && ! g:TerminalSpecialMovement &&  ! g:term_2color 
        let g:MuttEnter=function("MuttEnter_0")                                              
endif                                                                                      
if g:term_color && ! g:TerminalSpecialMovement   &&  !  g:term_2color
        let g:MuttEnter=function("MuttEnter_1")                                              
endif                                                                                      
if ! g:term_color && g:TerminalSpecialMovement   &&  ! g:term_2color
        let g:MuttEnter=function("MuttEnter_2")                                              
endif                                                                                      
if g:term_color && g:TerminalSpecialMovement     &&  ! g:term_2color
        let g:MuttEnter=function("MuttEnter_3")
endif
if ! g:term_color && ! g:TerminalSpecialMovement &&   g:term_2color 
        let g:MuttEnter=function("MuttEnter_4")
endif
if g:term_color && ! g:TerminalSpecialMovement   &&    g:term_2color
        let g:MuttEnter=function("MuttEnter_5")
endif
if ! g:term_color && g:TerminalSpecialMovement   &&   g:term_2color
        let g:MuttEnter=function("MuttEnter_6")
endif
if g:term_color && g:TerminalSpecialMovement     &&   g:term_2color
        let g:MuttEnter=function("MuttEnter_7")
endif
endfunction

