"######      color          #######################################################################################################################
"
"
func! Init_Common_Color()
    let g:mycolors   =     readfile( $HOME . "/.config/nvim/". g:mycolors_flavor ."_colorschemes" )
    call Daytimecolor()
    exe "colorscheme" g:colorscheme
    call Set_Subset_Color()
endfunction

func! Set_NormMode_Color()
    exe "colorscheme" g:colorscheme
    call Set_Subset_Color()
    call Set_NormMode_ColorStyle()
endfunction

function! Set_Subset_Color()
        call Set_Common_Split_Color()
        call Set_Common_Tabline_Color()
        hi    PmenuSel           guifg=#ff00ff  guibg=#00ff00
        hi    TermCursor         guifg=#ff00ff  guibg=#000000
endfunction

function! Set_TermActiv_Color()
    exe "colorscheme"  g:term_active_colorscheme
    highlight TermCursor ctermfg=16 ctermbg=99  guibg=#000000  guifg=#ff00ff
    exe Set_Subset_Color()
    if ! b:background == &background
	    " need to fix the terminal colorscheme
	    if b:background == "dark"
	         set g:term_active_colorscheme = g:colorscheme_terminal_dark_fallback
            end
	    if b:background == "light"
	         set g:term_active_colorscheme = g:colorscheme_terminal_light_fallback
            end
    end
endfunction

function! Set_TermInaktiv_Color()
    exe "colorscheme"  g:term_inactiv_colorscheme
    exe Set_Subset_Color()
    if ! b:background == &background
	    " need to fix the terminal colorscheme
	    if b:background == "dark"
	         set g:term_inactiv_colorscheme = g:colorscheme_terminal_dark_fallback
            end
	    if b:background == "light"
	         set g:term_inactiv_colorscheme = g:colorscheme_terminal_light_fallback
            end
    end
endfunction
function! Init_TermActiv_Color()
    "init func for term creation
    "term buffer has no b:background set yet
    exe "colorscheme"  g:term_active_colorscheme
    highlight TermCursor ctermfg=16 ctermbg=99  guibg=#000000  guifg=#ff00ff
    exe Set_Subset_Color()
    let b:background=&background
endfunction

function! Init_TermInaktiv_Color()
    "init func for term creation
    "term buffer has no b:background set yet
    exe "colorscheme"  g:term_inactiv_colorscheme
    exe Set_Subset_Color()
    let b:background=&background
endfunction



function! Set_Term_Colors_Dark()
     let g:terminal_color_0      =      "#000000" "black
     let g:terminal_color_1      =      "#9f0000"
     let g:terminal_color_2      =      "#009f00"
     let g:terminal_color_3      =      "#ffff00"
     let g:terminal_color_4      =      "#5555ff"
     let g:terminal_color_5      =      "#ff00ff"
     let g:terminal_color_6      =      "#00ffff"
     let g:terminal_color_7      =      "#f1f1f1" "white

     let g:terminal_color_8      =      "#040404" "light black
     let g:terminal_color_9      =      "#ff8080"
     let g:terminal_color_10     =      "#80ff80"
     let g:terminal_color_11     =      "#ffff80"
     let g:terminal_color_12     =      "#8080ff"
     let g:terminal_color_13     =      "#ff80ff"
     let g:terminal_color_14     =      "#80ffff"
     let g:terminal_color_15     =      "#ffffff" "light white
endfunction
function! Set_Term_Colors_Light()
     let g:terminal_color_0      =      "#000000"  "black
     let g:terminal_color_1      =      "#800000"  "red
     let g:terminal_color_2      =      "#008000"  "green
     let g:terminal_color_3      =      "#454500"  
     let g:terminal_color_4      =      "#1515ff"
     let g:terminal_color_5      =      "#800080"
     let g:terminal_color_6      =      "#008080"
     let g:terminal_color_7      =      "#010101"  "white
                                                   
     let g:terminal_color_8      =      "#666666"  "light black
     let g:terminal_color_9      =      "#ff5050"  "light red
     let g:terminal_color_10     =      "#009a00"  "light green
     let g:terminal_color_11     =      "#666600"  
     let g:terminal_color_12     =      "#5555ff"
     let g:terminal_color_13     =      "#ff00ff"
     let g:terminal_color_14     =      "#00ffff"
     let g:terminal_color_15     =      "#000000"  "light white
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
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guifg=#000000 guibg=#00dfff"
        execute "highlight CursorLine      guifg=#000000 guibg=#ff00ff"
        execute "highlight StatusLine      guifg=#ff00ff guibg=#00dfff"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  else
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guibg=#00dfff guifg=#000000 "
        execute "highlight CursorLine      guibg=#00dfff guifg=#000000"
        execute "highlight StatusLine      guifg=#000000 guibg=#00dfff"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  endif
endfunction
func! Set_NormMode_ColorStyle()
  if &modified
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guifg=#000000 guibg=#00ff00"
        execute "highlight StatusLine      guifg=#ff00ff guibg=#00ff00"
        execute "highlight CursorLine      guifg=#000000 guibg=#ff00ff"
        execute "highlight StatusLine      guifg=#ff00ff guibg=#00dfff"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  else
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guifg=#000000 guibg=#00ff00"
        execute "highlight CursorLine      guifg=#000000 guibg=#00ff00"
        execute "highlight StatusLine      guifg=#000000 guibg=#00ff00"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  endif
endfunction





function! Set_Common_Split_Color()
        execute "hi VertSplit ctermfg=16 ctermbg=99  guibg=#875fff  guifg=#ffffff gui=NONE cterm=NONE"
endfunction


function! Set_Common_Tabline_Color()
   hi    TabLineSel              ctermfg=16  ctermbg=99  guifg=#ffff00  guibg=#55aaff
   hi    TabLineFill             ctermfg=16  ctermbg=99  guibg=#000000  guifg=#000000
   hi    TabLine                 ctermfg=16  ctermbg=99  guibg=#000000  guifg=#ffffff
endfunction


"###########################################################################################################################################################

func! Set_InsMode_ColorStyle_2()
  if &modified
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guifg=#000000 guibg=#00dfff"
        execute "highlight CursorLine      guifg=#000000 guibg=#ff00ff"
        execute "highlight StatusLine      guifg=#ff00ff guibg=#00dfff"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  else
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guibg=#00dfff guifg=#000000 "
        execute "highlight CursorLine      guibg=#00dfff guifg=#000000"
        execute "highlight StatusLine      guifg=#000000 guibg=#00dfff"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  endif
endfunction
func! Set_NormMode_ColorStyle_()
  if &modified
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guifg=#000000 guibg=#00ff00"
        execute "highlight StatusLine      guifg=#ff00ff guibg=#00ff00"
        execute "highlight CursorLine      guifg=#000000 guibg=#ff00ff"
        execute "highlight StatusLine      guifg=#ff00ff guibg=#00dfff"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  else
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guifg=#000000 guibg=#00ff00"
        execute "highlight CursorLine      guifg=#000000 guibg=#00ff00"
        execute "highlight StatusLine      guifg=#000000 guibg=#00ff00"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  endif
endfunction

func! Set_InsMode_ColorStyle_1()
  if &modified
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guifg=#000000 guibg=#00dfff"
        execute "highlight CursorLine      guifg=#000000 guibg=#ff00ff"
        execute "highlight StatusLine      guifg=#ff00ff guibg=#00dfff"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  else
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guibg=#00dfff guifg=#000000 "
        execute "highlight CursorLine      guibg=#00dfff guifg=#000000"
        execute "highlight StatusLine      guifg=#000000 guibg=#00dfff"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  endif
endfunction
func! Set_NormMode_ColorStyle1()
  if &modified
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guifg=#000000 guibg=#00ff00"
        execute "highlight StatusLine      guifg=#ff00ff guibg=#00ff00"
        execute "highlight CursorLine      guifg=#000000 guibg=#ff00ff"
        execute "highlight StatusLine      guifg=#ff00ff guibg=#00dfff"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  else
        execute "highlight Cursor          gui=reverse"
        execute "highlight CursorColumn    guifg=#000000 guibg=#00ff00"
        execute "highlight CursorLine      guifg=#000000 guibg=#00ff00"
        execute "highlight StatusLine      guifg=#000000 guibg=#00ff00"
        execute "highlight StatusLineNC    guifg=#ffffff guibg=#000000"
  endif
endfunction

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

function! Daytimecolor()
  let hr = str2nr(strftime('%H'))
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
  if g:nowcolors_flavor == "daytime"
	  if (hr >= g:dawntime) && (hr < g:dusktime)
                  let nc  =  "g:nowcolors_light"
	  else
                  let nc  =  "g:nowcolors_dark"
	  endif
  else
          let nc  =     "g:nowcolors_" . g:nowcolors_flavor
  endif
  let g:colorscheme = split(eval(nc))[i]
  exe "colorscheme" g:colorscheme
  call Set_Subset_Color()
endfunction



function! Set_Common_Tabline_Color()
   hi    TabLineSel              ctermfg=16  ctermbg=99  guifg=#ffff00  guibg=#55aaff
   hi    TabLineFill             ctermfg=16  ctermbg=99  guibg=#000000  guifg=#000000
   hi    TabLine                 ctermfg=16  ctermbg=99  guibg=#000000  guifg=#ffffff
endfunction


"###########################################################################################################################################################
