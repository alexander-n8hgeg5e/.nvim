function! Create_Terminal_buffer_0(...)  "means: Action: create one
    " called from default mapping {{{ {{{
    " 2 args: a:1 = cmd , a:2 = tmux session name
    " 3 args: attach to tmux session
    if exists("a:3")
        let mode_attach = 1
    else
        let mode_attach = 0
    endif

    stopinsert
    let b:modified=0
    let tmux_cmdbase="env NVIM_LISTEN_ADDRESS=" . v:servername . " tmux -S ". g:tmux_socket
    " isTermMode ?
    let isTermMode=(GetBuffersMode() == 1 || &buftype == "terminal" )
    let has_filename=(len(expand('%:h')) > 0)

    if ! mode_attach
        "#########################
        "##  determine workdir  ##
        "#########################
        " decide whether to use the buffers opened filepath
        " or the current vim workdir
        " as the source for the terminal workdir
        if (len(expand('%:h')) > 0) && ( ! isTermMode )
            " while %:p may return no path, %:p:h always returns
            " something, homedir or so at least
            let cwdname=expand('%:p:h')
        else
            let cwdname=getcwd()
        endif
        "let cwdname_clean=substitute(cwdname,$HOME . "/" , '' ,'g')
        "let cwdname_clean=substitute(cwdname_clean,'\W','_','g')
    endif

    "############################
    "##  create new session ?  ##
    "############################
    " check if buffer has a related tmux session and if true
    " remember this and make a backup of the session name
    " if a:1 is used, make always a new session
    if exists("b:related_tmux_session_name") && ! exists("a:1")
        call system( split(tmux_cmdbase) + [ "has-session", "-t", b:related_tmux_session_name] )
        let create_new_tmux_session = !(v:shell_error == 0)
    elseif ! mode_attach
        let create_new_tmux_session = 1
    elseif mode_attach
        let create_new_tmux_session = 0
    endif

    "###################################
    "##  determine tmux session name  ##
    "###################################
    if exists("a:2") && ( strlen(a:2) > 0 )
        " if one is given, use it
        let tmux_session_name = a:2
    elseif exists("b:related_tmux_session_name")
        let tmux_session_name = b:related_tmux_session_name
    elseif mode_attach
        " choose one of the not attached ones to attach to
        " get visible tmux sessions
        let visible_tmux_sessions = []
        let buflist = []
        for i in range(tabpagenr('$'))
            call extend(buflist, tabpagebuflist(i + 1))
        endfor
        for bn in buflist
            let sn = getbufvar( bn, "tmux_session_name")
            if sn != "" && index(visible_tmux_sessions,sn) == -1
                call add(visible_tmux_sessions,sn)
            endif
        endfor
        " get available tmux sessions
        let tmux_session_names = systemlist(split(tmux_cmdbase) + ["list-sessions","-F","#{session_name}"])

        call reverse(tmux_session_names)
        for name in tmux_session_names
            if index(visible_tmux_sessions, name) == -1
                let tmux_session_name = name
                break
            endif
        endfor
    elseif create_new_tmux_session
        " no name is given, no related session,
        " and no attaching to any session
        " so need to make a name for the new session
        let tmux_session_name = g:nvim_id ."_". Get_tmux_session_time_str()
    endif


    "#############################
    "#  Need to split window ?  ##
    "#############################
    " no need to split:
    "                  buffer has no file
    "                  and no unsaved contents
    "                  and it is no terminal.
    "                  -> in summary this means
    "                     it is a empty new buffer that can be
    "                     replaced by the newly created terminal.
    "                     So the editor stays more clean.
    " need to split in the other cases
    if has_filename || &modified || isTermMode
        let do_split = 1
    else
        let do_split = 0
    endif

    "##########################################
    "##  relate buffer to tmux session name  ##
    "##########################################
    " needs to be done befor splitting
    if create_new_tmux_session && do_split
        let b:related_tmux_session_name = tmux_session_name
        if exists('b:tmux_session_name')
            let g:tmux_session_relations[b:tmux_session_name] = tmux_session_name
        endif
    endif



    if do_split
        call EventWinLeave()
        split
    endif

    "##################################
    "## Need to do more setup before ##
    "## the terminal can be started. ##
    "## Especially the colors        ##
    "## need to be setup beforehand  ##
    "##################################
    call g:DoConfigDependentTerminalConfiguration_stage0()
    call g:DoConfigDependentTerminalConfiguration_stage1()
    " Event win enter and Set_Term_Colors
    " use b:background that was setup
    " in the previous statement.
    call EventWinEnter()
    " Next statement need to run befor terminal creation
    call Set_Term_Colors()

    " Contemporary State:
    "    Current buffer is suitable
    "    for placing the terminal into.

    "##############################
    "##  create terminal buffer  ##
    "##############################
    " then attach or create tmux
    if create_new_tmux_session
        " create
        let acmd="term " . tmux_cmdbase . " new-session -s " . tmux_session_name . " -c " . cwdname
        if exists("a:1")
            let acmd = acmd . " " . a:1
        else
            let acmd = acmd . " fish"
        endif
        exe acmd
        let b:tmux_session_name=tmux_session_name
    else
        " attach
        exe "term " . tmux_cmdbase "attach-session -t" tmux_session_name
        let b:tmux_session_name=tmux_session_name
        if has_key(g:tmux_session_relations , tmux_session_name )
            let b:related_tmux_session_name = g:tmux_session_relations[tmux_session_name]
        endif
    endif

    " ####################
    " ##  setup buffer  ##
    " ####################
    " need to setup the newly
    " created buffer
    " The order of the commands is important (for the most)
    call SetBuffersMode(1)
    let b:tmux_cmdbase=tmux_cmdbase
    call Init_Keybinds(g:keybinds,'TermMode')
    if ! do_split
        call SetTabName_('Term')
    endif
    setlocal nonumber norelativenumber
    set wrap
    startinsert!
endfunction "}}}

function! Generate_funktion_Create_Terminal_buffer()
        if ! g:term_color &&  ! g:term_2color "{{{
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
endfunction "}}}}}}

function! EventTermEnter_0()  "means: Event: normal -> terminsert
endfunction "{{{{{{
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
endfunction "}}}

function! Generate_funktion_EventTermEnter()
if ! g:term_color && ! g:TerminalSpecialMovement &&  ! g:term_2color "{{{
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

call extend(g:tmux_functions,{ 'ete' : g:EventTermEnter })

endfunction "}}}}}}

"" one time terminal buffer init
"" only config dependend stuff stage0: befor insertmode
function! DoConfigDependentTerminalConfiguration_stage0_0()
    call Init_Term_Color()                                   "{{{{{{
endfunction
function! DoConfigDependentTerminalConfiguration_stage0_1()
    call Init_TermInactiv_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_stage0_2()
    call Init_Term_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_stage0_3()
    call Init_TermInactiv_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_stage0_4()
    call Color_get_hour_choice()
    call Init_Term_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_stage0_5()
    call Color_get_hour_choice()
    call Init_TermInactiv_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_stage0_6()
    call Color_get_hour_choice()
    call Init_Term_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_stage0_7()
    call Color_get_hour_choice()
    call Init_TermInactiv_Color()
endfunction  "}}}

function! Generate_funktion_DoConfigDependentTerminalConfiguration_stage0()
if ! g:term_color && ! g:TerminalSpecialMovement  && ! g:event_termdaytimecolor "{{{
let g:DoConfigDependentTerminalConfiguration_stage0=function("DoConfigDependentTerminalConfiguration_stage0_0")
endif
if g:term_color && ! g:TerminalSpecialMovement    && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage0=function("DoConfigDependentTerminalConfiguration_stage0_1")
endif
if ! g:term_color && g:TerminalSpecialMovement    && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage0=function("DoConfigDependentTerminalConfiguration_stage0_2")
endif
if g:term_color && g:TerminalSpecialMovement      && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage0=function("DoConfigDependentTerminalConfiguration_stage0_3")
endif
if ! g:term_color && ! g:TerminalSpecialMovement  &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage0=function("DoConfigDependentTerminalConfiguration_stage0_4")
endif
if g:term_color && ! g:TerminalSpecialMovement    &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage0=function("DoConfigDependentTerminalConfiguration_stage0_5")
endif
if ! g:term_color && g:TerminalSpecialMovement    &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage0=function("DoConfigDependentTerminalConfiguration_stage0_6")
endif
if g:term_color && g:TerminalSpecialMovement      &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage0=function("DoConfigDependentTerminalConfiguration_stage0_7")
endif
endfunction "}}}}}}

"" one time terminal buffer init
"" only config dependend stuff stage1: setup things used in insertmode
"" can be called befor actually entering the insertmode
"" todo: warn if &background of activ is not &background of inactiv
function! DoConfigDependentTerminalConfiguration_stage1_0() "{{{{{{
endfunction
function! DoConfigDependentTerminalConfiguration_stage1_1()
    call Init_TermActiv_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_stage1_2()
endfunction
function! DoConfigDependentTerminalConfiguration_stage1_3()
    call Init_TermActiv_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_stage1_4()
endfunction
function! DoConfigDependentTerminalConfiguration_stage1_5()
    call Init_TermActiv_Color()
endfunction
function! DoConfigDependentTerminalConfiguration_stage1_6()
endfunction
function! DoConfigDependentTerminalConfiguration_stage1_7()
    call Init_TermActiv_Color()
endfunction "}}}

function! Generate_funktion_DoConfigDependentTerminalConfiguration_stage1()
if ! g:term_2color && ! g:TerminalSpecialMovement  && ! g:event_termdaytimecolor "{{{
let g:DoConfigDependentTerminalConfiguration_stage1=function("DoConfigDependentTerminalConfiguration_stage1_0")
endif
if g:term_2color && ! g:TerminalSpecialMovement    && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage1=function("DoConfigDependentTerminalConfiguration_stage1_1")
endif
if ! g:term_2color && g:TerminalSpecialMovement    && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage1=function("DoConfigDependentTerminalConfiguration_stage1_2")
endif
if g:term_2color && g:TerminalSpecialMovement      && ! g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage1=function("DoConfigDependentTerminalConfiguration_stage1_3")
endif
if ! g:term_2color && ! g:TerminalSpecialMovement  &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage1=function("DoConfigDependentTerminalConfiguration_stage1_4")
endif
if g:term_2color && ! g:TerminalSpecialMovement    &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage1=function("DoConfigDependentTerminalConfiguration_stage1_5")
endif
if ! g:term_2color && g:TerminalSpecialMovement    &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage1=function("DoConfigDependentTerminalConfiguration_stage1_6")
endif
if g:term_2color && g:TerminalSpecialMovement      &&  g:event_termdaytimecolor
let g:DoConfigDependentTerminalConfiguration_stage1=function("DoConfigDependentTerminalConfiguration_stage1_7")
endif
endfunction "}}}}}}

function! EventTermEscape_256()
    if exists('b:termcursor') "{{{
        call setpos( '.', b:termcursor )
    else
        let col  =  float2nr(winwidth(0)/2)
        let line = float2nr(winheight(0)/2)
        call setpos( '.' , [ 0, line  , col , 0 , col ])
    endif
endfunction "}}}

function! EventTermEscape_0()       "Event
call Set_NormMode_ColorStyle()  "{{{{{{
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
endfunction "}}}

function! Generate_funktion_EventTermEscape()
if ! g:term_color && ! g:TerminalSpecialMovement && ! g:term_2color "{{{
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
endfunction "}}}}}}


function! TerminalSpecialMovementOn()
    echo "tsp on" " {{{
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
endfunction "}}}

function! TerminalSpecialMovementOff()
     echo "tsp off" "{{{
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
endfunction "}}}

function! TerminalSpecialMovementToggle()
 if exists("b:TerminalSpecialMovement") "{{{
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
  "norm G "{{{ {{{
  set sidescrolloff=0
  set sidescroll=0
endfunction
function! ConfDep_Event_TermWinEnter_1()
  call Set_TermInaktiv_Color()
  set sidescrolloff=0
  set sidescroll=0
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_2()
  call TerminalSpecialMovementUpdateOn()
  set sidescrolloff=0
  set sidescroll=0
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_3()
  call Set_TermInaktiv_Color()
  call TerminalSpecialMovementUpdateOn()
  set sidescrolloff=0
  set sidescroll=0
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_4() " Event
  set sidescrolloff=0
  set sidescroll=0
  startinsert
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_5()
  call Set_TermInaktiv_Color()
  set sidescrolloff=0
  set sidescroll=0
  startinsert
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_6()
  call TerminalSpecialMovementUpdateOn()
  set sidescrolloff=0
  set sidescroll=0
  startinsert
  "norm G
endfunction
function! ConfDep_Event_TermWinEnter_7()
  call Set_TermInaktiv_Color()
  call TerminalSpecialMovementUpdateOn()
  set sidescrolloff=0
  set sidescroll=0
  startinsert
  "norm G
endfunction "}}}

function! Generate_funktion_ConfDep_Event_TermWinEnter()
if ! g:term_color && ! g:TerminalSpecialMovement && ! g:TerminalAutoGoIn  "{{{
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
endfunction "}}} }}}

function! ConfDep_Event_TermWinLeave_0()
  call Set_NormMode_ColorStyle()  "{{{ {{{
    exe "set sidescrolloff=".g:sidescrolloff
    exe "set sidescroll=".g:sidescroll
endfunction
function! ConfDep_Event_TermWinLeave_1()
  call Set_NormMode_Color()
    exe "set sidescrolloff=".g:sidescrolloff
    exe "set sidescroll=".g:sidescroll
endfunction
function! ConfDep_Event_TermWinLeave_2()
  call Set_NormMode_ColorStyle()
    exe "set sidescrolloff=".g:sidescrolloff
    exe "set sidescroll=".g:sidescroll
endfunction
function! ConfDep_Event_TermWinLeave_3()
  call Set_NormMode_Color()
    exe "set sidescrolloff=".g:sidescrolloff
    exe "set sidescroll=".g:sidescroll
endfunction "}}}

function! Generate_funktion_ConfDep_Event_TermWinLeave()
if ! g:term_color && ! g:TerminalSpecialMovement  "{{{
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
endfunction "}}} }}}

" vim: foldnestmax=1 foldlevel=0 foldmethod=marker :
