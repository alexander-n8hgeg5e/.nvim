" local syntax file - set colors on a per-machine basis:
" vim: tw=0 ts=4 sw=4
" Vim color file
" Maintainer:	Ron Aaron <ron@ronware.org>
" Last Change:	2003 May 02

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let g:colors_name = "my"

highlight Directory guifg=#00FF00 ctermfg=green
hi Comment term=bold ctermfg=Red guifg=Red
hi Normal ctermfg=White  guifg=black guibg=white
hi Constant term=underline ctermfg=Magenta guifg=Magenta
hi Special term=bold ctermfg=Magenta guifg=Magenta
hi Identifier term=underline ctermfg=Blue guifg=Blue
hi Statement term=bold ctermfg=DarkRed gui=NONE guifg=Brown
hi PreProc term=underline ctermfg=Magenta guifg=Purple
hi Type term=underline ctermfg=Blue gui=NONE guifg=Blue
hi Visual term=reverse ctermfg=Yellow ctermbg=Red gui=NONE guifg=Black guibg=Yellow
hi Search term=reverse ctermfg=Black ctermbg=Cyan gui=NONE guifg=Black guibg=Cyan
hi Tag term=bold ctermfg=DarkGreen guifg=DarkGreen
hi Error term=reverse ctermfg=15 ctermbg=9 guibg=Red guifg=White
hi Todo term=standout ctermbg=Yellow ctermfg=Black guifg=Blue guibg=Yellow
hi  StatusLine term=bold,reverse cterm=NONE ctermfg=Yellow ctermbg=DarkGray gui=NONE guifg=Yellow guibg=DarkGray
hi! link MoreMsg Comment
hi! link ErrorMsg Visual
hi! link WarningMsg ErrorMsg
hi! link Question Comment
hi link String	Constant
hi link Character	Constant
hi link Number	Constant
hi link Boolean	Constant
hi link Float		Number
hi link Function	Identifier
hi link Conditional	Statement
hi link Repeat	Statement
hi link Label		Statement
hi link Operator	Statement
hi link Keyword	Statement
hi link Exception	Statement
hi link Include	PreProc
hi link Define	PreProc
hi link Macro		PreProc
hi link PreCondit	PreProc
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef	Type
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment Special
hi link Debug		Special

let g:terminal_color_0  = '#2e0036'
let g:terminal_color_1  = '#cc0000'
let g:terminal_color_2  = '#4e0006'
let g:terminal_color_3  = '#c40000'
let g:terminal_color_4  = '#3400a4'
let g:terminal_color_5  = '#75007b'
let g:terminal_color_6  = '#0b009b'
let g:terminal_color_7  = '#d300cf'
let g:terminal_color_8  = '#ff0053'
let g:terminal_color_9  = '#ff00ff'
let g:terminal_color_10 = '#8a0034'
let g:terminal_color_11 = '#fc004f'
let g:terminal_color_12 = '#7200cf'
let g:terminal_color_13 = '#ad00a8'
let g:terminal_color_14 = '#0000e9'
let g:terminal_color_15 = '#ffffff'
