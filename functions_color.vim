"######      color          #######################################################################################################################
"
"

func! Init_Common_Color()
    " setup avaiable options
    let s:mycolors_flavors_to_add=["hour_colors","daytime"]
    if ! exists("g:mycolors_flavors")
        let g:mycolors_flavors=s:mycolors_flavors_to_add
    endif
    for flavor in s:mycolors_flavors_to_add
        if count(g:mycolors_flavors,flavor)==0
            call add(g:mycolors_flavors,flavor)
        endif
    endfor

    call Color_get_hour_choice()
    if g:mycolors_flavor == "hour_colors"
        if g:hour_color_flavor == "daytime"
            let flavor = g:daytime
        else
            let flavor = g:hour_color_flavor
        endif
    elseif g:mycolors_flavor == "daytime"
        let flavor = g:daytime
    else
        let flavor = g:mycolors_default_file_flavor
    endif
    let g:mycolors   =     readfile( $HOME . "/.config/nvim/". flavor ."_colorschemes" )
    exe "colorscheme" g:colorscheme
    call Set_common_cubset_color()
endfunction

function! Color_get_available_mycolor_flavors()
    let s:available_colorscheme_pathes = systemlist("ls ". $vd. "/*_colorschemes")
    let s:available_mycolor_file_flavors = []

    for f in s:available_colorscheme_pathes
        call add(s:available_mycolor_file_flavors, substitute( f , '.*[/]\([^/]\+\)_colorschemes', '\1' ,"" ))
    endfor
    return s:available_mycolor_file_flavors
endfunction

func! Set_NormMode_Color()
    exe "colorscheme" g:colorscheme
    call Set_common_cubset_color()
    call Set_NormMode_ColorStyle()
endfunction

function! Set_common_cubset_color()
        call Set_Common_Split_Color()
        call Set_Common_Tabline_Color()
        hi    PmenuSel           guifg=#000000  guibg=#00ff00
        hi    Pmenu              guifg=#ffffff  guibg=#000000
        highlight TermCursor guibg=#ff3300 guifg=#00ffff ctermfg=cyan ctermbg=red gui=None cterm=None
        hi    StatusLineTermNC  guifg=#4400ff  guibg=#ffff00
        highlight StatusLineNC guifg=bg guibg=fg
        hi    StatusLineTerm    guifg=#4400ff  guibg=#999900
        hi clear folded
        hi default folded guifg=#ff0000
endfunction

function! Set_TermActiv_Color()
    exe "colorscheme"  g:term_active_colorscheme
    highlight TermCursor guibg=#ff3300 guifg=#00ffff ctermfg=cyan ctermbg=red gui=None cterm=None
    call Set_common_cubset_color()
    if b:background != &background
	    " need to fix the terminal colorscheme
	    if b:background == "dark"
	         let g:term_active_colorscheme = g:colorscheme_terminal_dark_fallback
            end
	    if b:background == "light"
	         let g:term_active_colorscheme = g:colorscheme_terminal_light_fallback
            end
    end
endfunction

function! Set_TermInaktiv_Color()
    exe "colorscheme"  g:term_inactiv_colorscheme
    call Set_common_cubset_color()
    if b:background != &background
	    " need to fix the terminal colorscheme
	    if b:background == "dark"
	         let g:term_inactiv_colorscheme = g:colorscheme_terminal_dark_fallback
            end
	    if b:background == "light"
	         let g:term_inactiv_colorscheme = g:colorscheme_terminal_light_fallback
            end
    end
endfunction
function! Init_TermActiv_Color()
    "init func for term creation
    "term buffer has no b:background set yet
    exe "colorscheme"  g:term_active_colorscheme
    call Set_common_cubset_color()
    let b:background=&background
endfunction


function! Init_Term_Color()
    "init func for term creation
    "term buffer has no b:background set yet
    let b:background=&background
endfunction

function! Init_TermInactiv_Color()
    "init func for term creation
    "term buffer has no b:background set yet
    exe "colorscheme"  g:term_inactiv_colorscheme
    call Set_common_cubset_color()
    let b:background=&background
endfunction

     " pattern used below
     " makes the comment at the end
     ".,+8s/\v["][ ]{0,2}(["])?([^"]{0,15})[^"]*$/\='"  "'.submatch(2).repeat(" ",(16-len(submatch(2))))."dark"/
     "clean after the first word and makes the comment
     "v.,+8s/\v["][ ]{0,2}(["])?([^" ]{0,15})[^"]*$/\='"  "'.submatch(2).repeat(" ",(16-len(submatch(2))))."default colors"/
function! Set_Term_Colors_Dark()
     let g:terminal_color_0      =      "#000000"  "black                  default colors
     let g:terminal_color_1      =      "#ff0505"  "red                    default colors
     let g:terminal_color_2      =      "#00d000"  "green                  default colors
     let g:terminal_color_3      =      "#c4c400"  "yellow                 default colors
     let g:terminal_color_4      =      "#b0b0ff"  "blue                   default colors
     let g:terminal_color_5      =      "#ff00ff"  "magenta                default colors
     let g:terminal_color_6      =      "#00d0d0"  "cyan                   default colors
     let g:terminal_color_7      =      "#ffffff"  "white                  default colors

     let g:terminal_color_8      =      "#040404"  "light black           intense, means more bright
     let g:terminal_color_9      =      "#ff8080"  "light red             intense, means more bright
     let g:terminal_color_10     =      "#80ff80"  "light green           intense, means more bright
     let g:terminal_color_11     =      "#ffff00"  "light yellow          intense, means more bright
     let g:terminal_color_12     =      "#c0c0ff"  "light blue            intense, means more bright
     let g:terminal_color_13     =      "#ff80ff"  "light magenta         intense, means more bright
     let g:terminal_color_14     =      "#80ffff"  "light cyan            intense, means more bright
     let g:terminal_color_15     =      "#ffffff"  "white                 intense, means more bright
endfunction

function! Set_Term_Colors_Light()
     let g:terminal_color_0      =      "#ffffff"  "white           default colors
     let g:terminal_color_1      =      "#ff0000"  "red             default colors
     let g:terminal_color_2      =      "#008f00"  "green           default colors
     let g:terminal_color_3      =      "#9a9a00"  "yellow          default colors
     let g:terminal_color_4      =      "#7070ff"  "blue            default colors
     let g:terminal_color_5      =      "#ff00ff"  "magenta         default colors
     let g:terminal_color_6      =      "#00a0a0"  "cyan            default colors
     let g:terminal_color_7      =      "#000000"  "black           default colors
                                                   
     let g:terminal_color_8      =      "#505050"  "dark white      intense, means darker here
     let g:terminal_color_9      =      "#9f0000"  "dark red        intense, means darker here
     let g:terminal_color_10     =      "#008000"  "dark green      intense, means darker here
     let g:terminal_color_11     =      "#555500"  "dark yellow     intense, means darker here
     let g:terminal_color_12     =      "#5555ff"  "dark blue       intense, means darker here
     let g:terminal_color_13     =      "#bb00bb"  "dark magenta    intense, means darker here
     let g:terminal_color_14     =      "#008080"  "dark cyan       intense, means darker here
     let g:terminal_color_15     =      "#000000"  "dark black      intense, means darker here

     let g:terminal_color_234    =      "#000000"  
     let g:terminal_color_235    =      "#000000"
     let g:terminal_color_236    =      "#000000"
     let g:terminal_color_237    =      "#000000"
     let g:terminal_color_238    =      "#000000"
     let g:terminal_color_239    =      "#000000"
     let g:terminal_color_240    =      "#000000"
     let g:terminal_color_241    =      "#000000"
     let g:terminal_color_242    =      "#000000"
     let g:terminal_color_243    =      "#000000"
     let g:terminal_color_244    =      "#000000"
     let g:terminal_color_245    =      "#000000"
     let g:terminal_color_246    =      "#000000"
     let g:terminal_color_247    =      "#000000"
     let g:terminal_color_248    =      "#000000"
     let g:terminal_color_249    =      "#000000"
     let g:terminal_color_250    =      "#000000"
     let g:terminal_color_251    =      "#000000"
     let g:terminal_color_252    =      "#000000"
     let g:terminal_color_253    =      "#000000"
     let g:terminal_color_254    =      "#000000"
     let g:terminal_color_255    =      "#000000"
endfunction

function! Set_Term_Colors()
        if b:background == 'dark'
                call Set_Term_Colors_Dark()
        endif
        if b:background == 'light'
                call Set_Term_Colors_Light()
        endif
endfunction

func! Set_InsMode_ColorStyle()
  if &modified
                 highlight StatusLine      guifg=#ff0000 guibg=#00aaaa gui=None
  else
                 highlight StatusLine      guifg=#000000 guibg=#00aaaa gui=None
  endif
endfunction
func! Set_NormMode_ColorStyle()
  if &modified
                 highlight StatusLine        guifg=#00ff00 guibg=#ff0000 gui=None
  else
                 highlight StatusLine       guifg=#000000 guibg=#00bf00 gui=None
  endif
endfunction





function! Set_Common_Split_Color()
    hi VertSplit ctermfg=16 ctermbg=99  guibg=#875fff  guifg=#ffffff gui=NONE cterm=NONE
endfunction


function! Set_Common_Tabline_Color()
   hi    TabLineSel              ctermfg=16  ctermbg=99  guifg=#ffff00  guibg=#55aaff
   hi    TabLineFill             ctermfg=16  ctermbg=99  guibg=#000000  guifg=#000000
   hi    TabLine                 ctermfg=16  ctermbg=99  guibg=#000000  guifg=#ffffff
endfunction


"###########################################################################################################################################################


function! Generate_function_Set_NormMode_ColorStyle()
if ! g:color_inverted
        let g:Set_NormMode_ColorStyle=function("Set_NormMode_ColorStyle_0")
endif
if g:color_inverted
        let g:Set_NormMode_ColorStyle=function("Set_NormMode_ColorStyle_1")
endif
endfunction
function! Generate_function_Set_InsMode_ColorStyle()
if ! g:color_inverted
        let g:Set_InsMode_ColorStyle=function("Set_InsMode_ColorStyle_0")
endif
if g:color_inverted
        let g:Set_InsMode_ColorStyle=function("Set_InsMode_ColorStyle_1")
endif
endfunction



function! Set_Common_Split_Color()
        execute "hi VertSplit ctermfg=16 ctermbg=99  guibg=#875fff  guifg=#ffffff gui=NONE cterm=NONE"
endfunction

function! Color_get_hour_choice()
  let hr = str2float(strftime('%H'))
  "let hr = str2float(strftime('%H')) + str2float(strftime('%M'))/60
  "set c 0;for i in (seq 1 8);for j in 0 8 16 ;set c (math $c + 1); echo '  elseif hr <= '$c;echo "    let i = "(math $j + $i );echo $i $j;end;end
  if hr <= 1
    let i = 0
  elseif hr <= 2
    let i = 8
  elseif hr <= 3
    let i = 16
  elseif hr <= 4
    let i = 1
  elseif hr <= 5
    let i = 9
  elseif hr <= 6
    let i = 17
  elseif hr <= 7
    let i = 2
  elseif hr <= 8
    let i = 10
  elseif hr <= 9
    let i = 18
  elseif hr <= 10
    let i = 3
  elseif hr <= 11
    let i = 11
  elseif hr <= 12
    let i = 19
  elseif hr <= 13
    let i = 4
  elseif hr <= 14
    let i = 12
  elseif hr <= 15
    let i = 20
  elseif hr <= 16
    let i = 5
  elseif hr <= 17
    let i = 13
  elseif hr <= 18
    let i = 21
  elseif hr <= 19
    let i = 6
  elseif hr <= 20
    let i = 14
  elseif hr <= 21
    let i = 22
  elseif hr <= 22
    let i = 7
  elseif hr <= 23
    let i = 15
  elseif hr <= 24
    let i = 23
  endif
  if g:hour_color_flavor == "daytime"
    if (hr >= g:dawntime + g:wait_for_day ) && ( hr < g:dusktime - g:preempt_dusk )
	    if (hr >= g:dawntime + g:no_bright_light_morning ) && ( hr < g:dusktime - g:no_bright_light_evening )
                  let nc  =  "g:hour_colors_bright_light"
                  let g:daytime="bright_light"
        else
                  let nc  =  "g:hour_colors_light"
                  let g:daytime="light"
        endif
        call Set_Term_Colors_Light()
	else
        " Assume sun is not far from it's apex at 12 o'clock,
        " i.e. time,dusktime,dawntime are localtimes
        " Adjust time values during night to allow comparison
        if hr > 12
            " it's late.
            let sv = 24
        else
            " it's early
            let sv = 0
        endif
	    if ( hr  >= g:dusktime + g:wait_for_night ) && ( hr < g:dawntime - g:preempt_dawn + sv )
                let nc ="g:hour_colors_dark"
                let g:daytime="dark"
        else
                let nc ="g:hour_colors_medium_dark"
                let g:daytime="medium_dark"
        endif
            call Set_Term_Colors_Dark()
	endif
  else
          let nc  =     "g:hour_colors_" . g:hour_color_flavor
  endif
  let g:python_var_0=split(eval(nc))[i]
  let counter=0
  while ! (py3eval("exists(vim.vars['python_var_0'])") || counter > 23 )
    let i+=1
    let counter+=1
    if i>23
      let i=0
    endif
    let g:python_var_0=split(eval(nc))[i]
  endwhile
  let g:colorscheme=g:python_var_0
  let g:colorscheme_terminal_dark_fallback  = split(g:hour_colors_dark )[i]
  let g:colorscheme_terminal_light_fallback = split(g:hour_colors_light)[i]
  exe "colorscheme" g:colorscheme
  call Set_common_cubset_color()
endfunction



function! Set_Common_Tabline_Color()
   hi    TabLineSel              ctermfg=16  ctermbg=99  guifg=#cc9900  guibg=#00358a
   hi    TabLineFill             ctermfg=16  ctermbg=99  guibg=#000000  guifg=#000000
   hi    TabLine                 ctermfg=16  ctermbg=99  guibg=#000000  guifg=#ffffff
endfunction


"###########################################################################################################################################################
"
" Add highlighting for function definition
function! EnhanceCppSyntax()
  syn match cppFuncDef '\v^\s?(\w+\s+)?\w+\(+.*\)+'
  hi def link cppFuncDef Special
endfunction
