source $vcd/keybinds_apps.vim
let mapleader='\'


unlet! g:keybinds
let g:keybinds={}

let additonal_keybinds = {
\ '<C-o>___!___Common'                       :                   [    '*'    ,   '<C-V>uf42e' ],
\ '<C-y>___i___Common'                       :                   [    '*'    ,   '<C-V>' ],
\}
call extend( g:keybinds, additonal_keybinds )

" Scrolling
let additonal_keybinds = {
\ '<PageUp>___n___Mutt'     : [ '*@'     ,  'a<C-u><C-\><C-n>' ],
\ '<PageDown>___n___Mutt'   : [ '*@'     ,  'a<C-d><C-\><C-n>' ],
\ '<S-y>___ ___Common'      : [ '*'      ,  'z' ],
\ '<S-y><S-y>___ ___Common' : [ '*'      ,  'zz' ],
\ 'j___ ___Mutt'            : [ '*@'     ,  'hhhh' ],
\ 'l___ ___Mutt'            : [ '*@'     ,  'llll' ],
\ 'i___nv___NerdtreeMode'   : [ '*@'     ,  '<C-y><C-y><C-y><C-y>' ],
\ 'k___nv___NerdtreeMode'   : [ '*@'     ,  '<C-e><C-e><C-e><C-e>' ],
\ 'i___n___Mutt'            : [ '*@'     ,  '<C-e><C-e><C-e><C-e>' ],
\ 'k___ ___Mutt'            : [ '*@'     ,  '<C-y><C-y><C-y><C-y>' ],
\ '<S-a>___n___Common'      : [ '*'      ,  'a' ],
\ 'a___n___Common'          : [ '*'      ,  'i' ],
\ 'i___nv___Common'         : [ '*'      ,  '4<C-u>' ],
\ 'i___nv___Default'        : [ '*'      ,  '4<C-u><C-u>' ],
\ 'k___nv___Common'         : [ '*'      ,  '4<C-d>' ],
\ 'k___nv___Default'        : [ '*'      ,  '4<C-d>' ],
\ 'j___nv___Common'         : [ '*'      ,  'hhhh' ],
\ 'l___nv___Common'         : [ '*'      ,  'llll' ],
\ '<F5>___ ___Common'       : [ '*'      ,  'zz' ],
\ '<S-a>___nv___ExMode'     : [ '*@'     ,  'a' ],
\ 'a___n___ExMode'          : [ '*@'     ,  'i' ],
\ 'i___n___ExMode'          : [ '*@'     ,  '<C-y><C-y><C-y><C-y>' ],
\ 'k___nv___ExMode'         : [ '*@'     ,  '<C-e><C-e><C-e><C-e>' ],
\ 'j___nv___ExMode'         : [ '*@'     ,  'hhhh' ],
\ 'l___nv___ExMode'         : [ '*@'     ,  'llll' ],
\ '<S-a>___n___TermMode'    : [ '*@'     ,  'a' ],
\ 'i___n___TermMode'        : [ '*@'     ,  '<C-y><C-y><C-y><C-y>' ],
\ 'k___ ___TermMode'        : [ '*@'     ,  '<C-e><C-e><C-e><C-e>' ],
\ 'j___ ___TermMode'        : [ '*@'     ,  'hhhh' ],
\ 'l___ ___TermMode'        : [ '*@'     ,  'llll' ],
\}
call extend( g:keybinds, additonal_keybinds )

"move windows around
let additonal_keybinds = {
\ '<M-e>___ ___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveUp()<CR>' ],
\ '<M-d>___ ___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveDown()<CR>' ],
\ '<M-s>___ ___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveLeft()<CR>' ],
\ '<M-f>___ ___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveRight()<CR>' ],
\ '<M-g>___ ___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveNewTab()<CR>' ],
\ '<M-e>___!___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveUp()<CR>a' ],
\ '<M-d>___!___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveDown()<CR>a' ],
\ '<M-s>___!___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveLeft()<CR>a' ],
\ '<M-f>___!___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveRight()<CR>a' ],
\ '<M-g>___!___Common'      : [ '*', '<Cmd>call DefaultMode_WinMoveNewTab()<CR>a' ],
\ '<M-e>___t___Common'      : [ '*', '<C-\><C-N><Cmd>call DefaultMode_WinMoveUp()<CR>a' ],
\ '<M-d>___t___Common'      : [ '*', '<C-\><C-N><Cmd>call DefaultMode_WinMoveDown()<CR>a' ],
\ '<M-s>___t___Common'      : [ '*', '<C-\><C-N><Cmd>call DefaultMode_WinMoveLeft()<CR>a' ],
\ '<M-f>___t___Common'      : [ '*', '<C-\><C-N><Cmd>call DefaultMode_WinMoveRight()<CR>a' ],
\ '<M-g>___t___Common'      : [ '*', '<C-\><C-N><Cmd>call DefaultMode_WinMoveNewTab()<CR>a'],
\ '<M-e>___ ___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveUp()<CR>' ],
\ '<M-d>___ ___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveDown()<CR>' ],
\ '<M-s>___ ___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveLeft()<CR>' ],
\ '<M-f>___ ___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveRight()<CR>' ],
\ '<M-g>___ ___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveNewTab()<CR>' ],
\ '<M-e>___!___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveUp()<CR>a' ],
\ '<M-d>___!___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveDown()<CR>a' ],
\ '<M-s>___!___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveLeft()<CR>a' ],
\ '<M-f>___!___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveRight()<CR>a' ],
\ '<M-g>___!___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveNewTab()<CR>a' ],
\ '<M-e>___t___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveUp()<CR>a' ],
\ '<M-d>___t___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveDown()<CR>a' ],
\ '<M-s>___t___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveLeft()<CR>a' ],
\ '<M-f>___t___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveRight()<CR>a' ],
\ '<M-g>___t___DefaultMode' : [ '*', '<Cmd>call DefaultMode_WinMoveNewTab()<CR>a' ],
\}
call extend( g:keybinds, additonal_keybinds )


"  mutt terminal buffer keybinds
let additonal_keybinds = {
\ '<S-a>___n___Mutt'   : [ '*@', 'a' ],
\ 'a___n___Mutt'       : [ '*@', '<Cmd>call Enter_Mutt_Term()<CR>' ],
\ '<Space>___n___Mutt' : [ '*@', 'a' ],
\ '<C-e>___n___Mutt'   : [ '*@', '<Cmd>call TermKeyNCE()<CR>' ],
\ 'd___n___Mutt'       : [ '*@', 'jjjj' ],
\ 'e___n___Mutt'       : [ '*@', 'kkkk' ],
\ 'f___n___Mutt'       : [ '*@', 'E' ],
\ 'F___n___Mutt'       : [ '*@', 'e' ],
\ 's___n___Mutt'       : [ '*@', 'B' ],
\ 'S___n___Mutt'       : [ '*@', 'b' ],
\ '<C-Q>___ ___Mutt'   : [ '*@', '<Cmd>call EventWinLeave()<CR><Cmd>bunload!<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Q>___!___Mutt'   : [ '*@', '<Cmd>call EventWinLeave()<CR><Cmd>bunload!<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Q>___t___Mutt'   : [ '*@', '<Cmd>call EventWinLeave()<CR><Cmd>bunload!<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<CR>___n___Mutt'    : [ '*@', '<CR>' ],
\ '<Esc>___t___Mutt'   : [ '*' , '<C-\><C-N><Cmd>call EventTermEscape()<CR>' ],
\}
call extend( g:keybinds, additonal_keybinds )

" ex mode stuff that exits or enters the mode
let additonal_keybinds = {
\ ':___v___Common'         : [    '*'     ,    '<Cmd>call EventWinLeave()      <CR>q:<Cmd>              call EventExModeWinEnter() <CR>' ],
\ ':___n___DefaultMode'    : [    '*'     ,    '<Cmd>call EventWinLeave()      <CR>q:<Cmd>              call EventExModeWinEnter() <CR>' ],
\ ':___v___DefaultMode'    : [    '*'     ,    '<Cmd>call EventWinLeave()      <CR>q:<Cmd>              call EventExModeWinEnter() <CR>' ],
\ ':___n___Common'         : [    '*'     ,    '<Cmd>call EventWinLeave()      <CR><Esc>q:<Cmd>         call EventExModeWinEnter() <CR>' ],
\ '<C-f>___i___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoTabRight()          <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-f>___ ___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoTabRight()          <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-s>___i___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoTabLeft()           <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Right>___i___ExMode' : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoRight()             <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-f>___c___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoTabRight()          <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Left>___c___ExMode'  : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoLeft()              <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-d>___c___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoDown()              <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Left>___i___ExMode'  : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoLeft()              <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-d>___i___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoDown()              <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Down>___i___ExMode'  : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoDown()              <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-s>___c___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoTabLeft()           <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Down>___c___ExMode'  : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoDown()              <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Right>___c___ExMode' : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoRight()             <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-d>___ ___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoDown()              <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-s>___ ___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call GoTabLeft()           <CR><Cmd>call EventWinEnter()<CR>' ],
\ '<CR>___n___ExMode'      : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR>i<CR>'                                                ],
\ '<CR>___i___ExMode'      : [    '*@'    ,    '<Cmd>silent! call EventExModeWinLeave()<CR><CR>'                                         ],
\ '<C-e>___i___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><C-c><Cmd> call EventWinEnter()       <CR>' ],
\ '<Esc>___ ___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-Down>___ ___ExMode'  : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-e>___ ___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-Up>___i___ExMode'    : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-q>___ ___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-Right>___ ___ExMode' : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-e>___c___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-Left>___ ___ExMode'  : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-q>___i___ExMode'     : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-Up>___ ___ExMode'    : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\ '<C-Up>___c___ExMode'    : [    '*@'    ,    '<Cmd>call EventExModeWinLeave()<CR><C-c><C-c><Cmd>      call EventWinEnter()       <CR>' ],
\}
call extend( g:keybinds, additonal_keybinds )


" ex mode stuff that stays inside the mode
let additonal_keybinds = {
\ ':___n___ExMode'      :  [ '*@', ':' ],
\ ':___v___ExMode'      :  [ '*@', ':' ],
\ '<F15>___!___ExMode'  :  [ '*@', '<Cmd>call Win_ExMode_HeightDown()<CR>' ],
\ '<F22>___!___ExMode'  :  [ '*@', '<Cmd>call Win_ExMode_HeightUp()<CR>' ],
\ '<F22>___ ___ExMode'  :  [ '*@', '<Cmd>call Win_ExMode_HeightUp()<CR> ' ],
\ '<F15>___ ___ExMode'  :  [ '*@', '<Cmd>call Win_ExMode_HeightDown()<CR>' ],
\}
call extend( g:keybinds, additonal_keybinds )

" window switching
let additonal_keybinds = {
\ '<C-Left>___ ___DefaultMode'  : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Down>___ ___DefaultMode'  : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-d>___ ___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Up>___ ___DefaultMode'    : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-e>___ ___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Right>___ ___DefaultMode' : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Left>___c___DefaultMode'  : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Up>___c___DefaultMode'    : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-e>___c___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Right>___c___DefaultMode' : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Left>___t___DefaultMode'  : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Down>___t___DefaultMode'  : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-d>___t___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Up>___t___DefaultMode'    : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-e>___t___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Right>___t___DefaultMode' : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Left>___i___DefaultMode'  : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Down>___i___DefaultMode'  : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-d>___i___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Up>___i___DefaultMode'    : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-e>___i___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Right>___i___DefaultMode' : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Left>___v___DefaultMode'  : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Down>___v___DefaultMode'  : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-d>___v___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Up>___v___DefaultMode'    : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-e>___v___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Right>___v___DefaultMode' : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-f>___ ___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-f>___c___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-f>___t___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-f>___i___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-f>___v___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-s>___ ___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-s>___c___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-s>___t___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-s>___i___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-s>___v___DefaultMode'     : [ '*', '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\}
call extend( g:keybinds, additonal_keybinds )
"#---------#"
"#  netrw  #"
"#---------#"
"let additonal_keybinds = {'-___nv___Common'                         :                   [    '*'     ,    '<Cmd>call CreateNetrwBuffer()<CR>'   ]}
"call extend( g:keybinds, additonal_keybinds )
let g:Netrw_UserMaps= [
\                       ["e", "Key_3up" ],
\                       ["s", "Key_move_to_beginning_of_word" ],
\                       ["d", "Key_3down" ],
\                       ["f", "Key_move_to_end_of_word" ],
\                       ["D", "Netrw_Create_Dir" ],
\                       ["i", "Key_scroll_3up" ],
\                       ["k", "Key_scroll_3down" ],
\                       ["<space>", "Key_netrw_preview" ],
\                       ["C-Q", "Key_Netrw_Quit" ],
\                       ["t", "Key_Netrw_treeroot" ],
\                       ["r", "Key_Netrw_reload" ],
\]

" nerdtree
let additonal_keybinds = {
\ '-___nv___Common' : [ '*', '<Cmd>call CreateNerdtreeBuffer()<CR>' ],
\}
call extend( g:keybinds, additonal_keybinds )

let additonal_keybinds = {
\ '<Esc>___i___Common'         : [    '*',       '<Esc><Right>' ],
\ '#___v___Common'             : [    '*<expr>', '"<S-i>".Get_comment_char()."<Esc>"' ],
\ '<Space>___v___Common'       : [    '*<expr>', '"<S-i>".Get_space("<v:count>")."<Esc>"' ],
\ '<Tab>___v___Common'         : [    '*',       '<S-i><Tab><Esc>' ],
\ 'v___n___Common'             : [    '*',       '<C-v>' ],
\ '<C-v>___n___Common'         : [    '*',       'v' ],
\ '<F18>___v___Common'         : [    '*',       'c#<Esc>' ],
\ '<F18>___n___Common'         : [    '*',       '<C-v>c#<Esc>' ],
\ '<A-a>___n___Common'         : [    '*',       '<Cmd>call Toggle_auto_change_dir()<CR>' ],
\ '<F2>___n___Common'          : [    '*',       'q' ],
\ 'q___ ___Common'             : [    '*',       '<Nop>' ],
\ 'n___n___Common'             : [    '*',       'nzz' ],
\ '<F6>___n___Common'          : [    '*',       '<Cmd>cnext<CR>zz' ],
\ 'N___n___Common'             : [    '*',       'Nzz' ],
\ '<F4>___n___Common'          : [    '*',       '<Cmd>cprevious<CR>zz' ],
\ 'e___ ___Common'             : [    '*',       'kkkk' ],
\ 'e___n___Common'             : [    '*',       'kkkk' ],
\ 'B___ ___Common'             : [    '*',       'S' ],
\ '<C-Q>___!___Common'         : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>q<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-B>___i___Common'         : [    '*',       '<Esc>z=' ],
\ '<C-B>___v___Common'         : [    '*',       '<Esc>z=' ],
\ 'a___v___Common'             : [    '*',       '<Esc>i' ],
\ '<C-Right>___c___Common'     : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<M-m>___ov___Common'        : [    ' ',       '<Cmd>call EventWinLeave()<CR><Cmd>call Mutt()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-F>___c___Common'         : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<LeftMouse>___o___Common'   : [    '*',       '<Esc><LeftMouse>' ],
\ '<F22>___t___Common'         : [    '*',       '<C-\><C-N><Cmd>call WinHeightUp()<CR>a' ],
\ '<M-b>___c___Common'         : [    ' ',       '<Cmd>call OpenBrowser()<CR>' ],
\ '<M-b>___ov___Common'        : [    ' ',       '<Cmd>call OpenBrowser()<CR>' ],
\ '<C-Up>___c___Common'        : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Left>___c___Common'      : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<Tab>___i___Common'         : [    '*',       '<Cmd>call SmartTabComplete()<CR>' ],
\ '<S-Tab>___i___Common'       : [    '*',       '<Tab>' ],
\ '<S-Tab>___n___Common'       : [    '*',       '<S-r><Right><Cmd>call SmartTabComplete()<CR>' ],
\ '<C-Right>___t___Common'     : [    '*',       '<Cmd>call EventTermEscape()<CR><C-\><C-N><Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Down>___i___Common'      : [    '*',       '<Cmd>call EventTermEscape()<CR><Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-S>___c___Common'         : [    '*',       '<Cmd>call EventTermEscape()<CR><Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F19>___!___Common'         : [    '*',       'z=' ],
\ '<F17>___!___Common'         : [    '*',       'z=' ],
\ '<C-Down>___no___Common'     : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Q>___t___Common'         : [    '*',       '<C-\><C-N><Cmd>call EventWinLeave()<CR><Cmd>q<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<Del>___ ___Common'         : [    '*',       'd' ],
\ '<C-h>___i___Common'         : [    '*',       '<C-S-c>' ],
\ '<C-h>___n___Common'         : [    '*',       'i<C-S-c><Esc>' ],
\ '<C-Left>___t___Common'      : [    '*',       '<C-\><C-N><Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<Leader>o___i___Common'     : [    '*',       '<C-V>uf42e' ],
\ '<C-B>___n___Common'         : [    '*',       'z=' ],
\ '<F22>___!___Common'         : [    '*',       '<Cmd>call WinHeightUp()<CR>' ],
\ '<C-T>___t___Common'         : [    '*',       '<C-\><C-N><Cmd>call Create_Terminal_buffer()<CR>' ],
\ '<C-A-T>___t___Common'       : [    '*',       '<C-\><C-N><Cmd>call Create_Terminal_buffer("","","")<CR>' ],
\ '<M-c>___c___Common'         : [    ' ',       '<Cmd>call EventWinLeave()<CR><Cmd>Calendar<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<M-t>___n___Common'         : [    ' ',       '<Cmd>call EventWinLeave()<CR><Cmd>call Todo()<CR><Cmd>call EventNetrwWinEnter()<CR>' ],
\ '<M-t>___!___Common'         : [    ' ',       '<Cmd>call EventWinLeave()<CR><Cmd>call Todo()<CR><Cmd>call EventNetrwWinEnter()<CR>' ],
\ '<M-t>___t___Common'         : [    ' ',       '<Cmd>call EventWinLeave()<CR><Cmd>call Todo()<CR><Cmd>call EventNetrwWinEnter()<CR>' ],
\ '<3-LeftMouse>___ ___Common' : [    '*',       '<3-LeftMouse> y' ],
\ '<C-Q>___ ___Common'         : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>q<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Down>___v___Common'      : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<Up>___no___Common'         : [    '*',       'k' ],
\ '<M-m>___t___Common'         : [    ' ',       '<C-\><C-N><Cmd>call EventWinLeave()<CR><Cmd>call Mutt()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-S>___no___Common'        : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F21>___n___Common'         : [    '*',       '<Esc>:w<CR>' ],
\ '<M-m>___n___Common'         : [    ' ',       '<Cmd>call EventWinLeave()<CR><Cmd>call Mutt()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F16>___ ___Common'         : [    '*',       '<Cmd>call WinWidthR()<CR>' ],
\ '<C-Left>___no___Common'     : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F14>___!___Common'         : [    '*',       '<Cmd>call WinWidthL()<CR>a' ],
\ '<F15>___ ___Common'         : [    '*',       '<Cmd>call WinHeightDown()<CR>' ],
\ '<M-m>___c___Common'         : [    ' ',       '<Cmd>call EventWinLeave()<CR><Cmd>call Mutt()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<Down>___no___Common'       : [    '*',       'j' ],
\ '<F19>___ ___Common'         : [    '*',       'z=' ],
\ '<F17>___ ___Common'         : [    '*',       'z=' ],
\ 'E___ ___Common'             : [    '*',       'F' ],
\ '<F1>___ ___Common'          : [    '*',       'Nzz' ],
\ '<F15>___t___Common'         : [    '*',       '<C-\><C-N><Cmd>call WinHeightDown()<CR>a' ],
\ '<C-Right>___no___Common'    : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-S>___t___Common'         : [    '*',       '<C-\><C-N><Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F22>___ ___Common'         : [    '*',       '<Cmd>call WinHeightUp()<CR><Space>' ],
\ '<C-F>___no___Common'        : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F21>___i___Common'         : [    '*',       '<Esc>:w<CR>l' ],
\ '<M-m>___i___Common'         : [    ' ',       '<Cmd>call EventWinLeave()<CR><Cmd>call Mutt()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<A-:>___n___Common'         : [    '*',       ':' ],
\ 's___ ___Common'             : [    '*',       'B' ],
\ 's___n___Common'             : [    '*',       'B' ],
\ 'S___ ___Common'             : [    '*',       'b' ],
\ 'S___n___Common'             : [    '*',       'b' ],
\ 'b___ ___Common'             : [    '*',       's' ],
\ 'f___ ___Common'             : [    '*',       'E' ],
\ 'f___n___Common'             : [    '*',       'E' ],
\ 'F___ ___Common'             : [    '*',       'e' ],
\ 'F___n___Common'             : [    '*',       'e' ],
\ '<S-l>___ ___Common'         : [    '*',       'f' ],
\ '<NL>___i___Common'          : [    ' ',       '<Plug>IMAP_JumpForward' ],
\ '<C-S>___v___Common'         : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F15>___!___Common'         : [    '*',       '<Cmd>call WinHeightDown()<CR>' ],
\ '<F16>___t___Common'         : [    '*',       '<C-\><C-N><Cmd>call WinWidthR()<CR>a' ],
\ '<M-b>___n___Common'         : [    ' ',       '<Cmd>call OpenBrowser()<CR>' ],
\ 'd___ ___Common'             : [    '*',       'jjjj' ],
\ 'd___n___Common'             : [    '*',       'jjjj' ],
\ '<F14>___t___Common'         : [    '*',       '<C-\><C-N><Cmd>call WinWidthL()<CR>a' ],
\ '<F14>___ ___Common'         : [    '*',       '<Cmd>call WinWidthL()<CR>' ],
\ 'o___n___Common'             : [    '*',       'o<Esc>' ],
\ '<Down>___v___Common'        : [    '*',       'j' ],
\ '<Down>___ ___Common'        : [    '*',       'j' ],
\ '<Down>___n___Common'        : [    '*',       'j' ],
\ 'p___n___Common'             : [    '*',       'p' ],
\ '<C-Down>___t___Common'      : [    '*',       '<C-\><C-N><Cmd>call EventWinLeave()<CR><Cmd>call GoDown()<CR><Cmd>call EventWinEnter()<CR>' ],
\ 'z___ ___Common'             : [    '*',       '<C-R>' ],
\ 'Z___ ___Common'             : [    '*',       'z' ],
\ 'Zf___ ___Common'            : [    '*',       'zf' ],
\ 'Z<Del>___ ___Common'        : [    '*',       'zd' ],
\ '<2-LeftMouse>___n___Common' : [    '*',       '<LeftMouse>viwy' ],
\ '<LeftRelease>___v___Common' : [    '*',       '<LeftRelease> y' ],
\ '<C-Right>___i___Common'     : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Right>___v___Common'     : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F16>___!___Common'         : [    '*',       '<Cmd>call WinWidthR()<CR>a' ],
\ '<C-F>___i___Common'         : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-F>___v___Common'         : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<M-b>___i___Common'         : [    ' ',       '<Cmd>call OpenBrowser()<CR>' ],
\ '<CR>___o___Common'          : [    '*',       '<Esc>' ],
\ '<M-c>___n___Common'         : [    ' ',       '<Cmd>Calendar<CR><Space>' ],
\ '<C-Up>___i___Common'        : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Up>___v___Common'        : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Left>___i___Common'      : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Left>___v___Common'      : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-T>___ ___Common'         : [    '*',       '<Cmd>call Create_Terminal_buffer()<CR>' ],
\ '<C-A-T>___ ___Common'       : [    '*',       '<Cmd>call Create_Terminal_buffer("","","")<CR>' ],
\ '<C-F>___t___Common'         : [    '*',       '<C-\><C-N><Cmd>call EventWinLeave()<CR><Cmd>call GoTabRight()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-S>___i___Common'         : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoTabLeft()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-N>___ ___Common'         : [    '*',       '<Cmd>call SetCustomTabName()<CR>' ],
\ '<2-LeftMouse>___i___Common' : [    '*',       '<Esc><LeftMouse>viwy' ],
\ '<C-B>___o___Common'         : [    '*',       '<Esc>z=' ],
\ '<C-V>___!___Common'         : [    '*',       '<C-R>+' ],
\ '<Up>___ ___Common'          : [    '*',       'k' ],
\ '<Up>___n___Common'          : [    '*',       'k' ],
\ '<Up>___v___Common'          : [    '*',       'k' ],
\ '<Esc>___v___Common'         : [    '*',       '<Esc><Cmd>call Set_NormMode_ColorStyle()<CR>' ],
\ 'v___v___Common'             : [    '*',       '<Esc><Cmd>call Set_NormMode_ColorStyle()<CR>' ],
\ '<CR>___v___Common'          : [    '*',       '<Esc><Cmd>call Set_NormMode_ColorStyle()<CR>' ],
\ '<M-c>___i___Common'         : [    ' ',       '<Cmd>Calendar<CR>' ],
\ '<Right>___ ___Common'       : [    '*',       'zvl' ],
\ '<C-P>___!___Common'         : [    '*',       '<C-R>' ],
\ 'Q___ ___Common'             : [    '*',       '<Nop>' ],
\ '<4-LeftMouse>___ ___Common' : [    '*',       '<4-LeftMouse> y' ],
\ '<M-b>___t___Common'         : [    ' ',       '<C-\><C-N><Cmd>call OpenBrowser()<CR>' ],
\ '<LeftMouse>___c___Common'   : [    '*',       '<Esc>' ],
\ '<F3>___ ___Common'          : [    '*',       'nzz' ],
\ '<CR>___n___Common'          : [    '*<expr>', 'Keypress_CR_normal_mode()' ],
\ '<Space>___no___Common'      : [    '*',       '<Cmd>call Cscopefind(str2nr( v:count) , expand("<cword>")) <CR>zz' ],
\ '<Tab>___no___Common'        : [    '*',       '<C-]>zz' ],
\ '<C-U>___n___Common'         : [    '*',       '<C-R>' ],
\ '<C-Up>___no___Common'       : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<Left>___ ___Common'        : [    '*',       'zvh' ],
\ '<C-T>___!___Common'         : [    '*',       '<Cmd>call Create_Terminal_buffer()<CR>' ],
\ '<C-A-T>___!___Common'       : [    '*',       '<Cmd>call Create_Terminal_buffer("","","")<CR>' ],
\ '<C-C>___n___Common'         : [    '*',       'i<C-V>uf42e<Esc>' ],
\ 'O___n___Common'             : [    '*',       'O<Esc>' ],
\ '<C-Up>___t___Common'        : [    '*',       '<C-\><C-N><Cmd>call EventWinLeave()<CR><Cmd>call GoUp()<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F1>___!___Common'          : [    '*',       '<Nop>' ],
\ '<Home>___ ___Common'        : [    '*',       '<Cmd>call Conditional_fold()<CR><Home>' ],
\ '<C-q>___ ___DefaultMode'    : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>q<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-q>___!___DefaultMode'    : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>q<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-q>___t___DefaultMode'    : [    '*',       '<Cmd>call EventWinLeave()<CR><Cmd>q<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<F22>___ ___DefaultMode'    : [    '*',       '<Cmd>call WinHeightUp()<CR>' ],
\ '<F15>___ ___DefaultMode'    : [    '*',       '<Cmd>call WinHeightDown()<CR>' ],
\ '<F14>___ ___DefaultMode'    : [    '*',       '<Cmd>call WinWidthL()<CR>' ],
\ '<F16>___ ___DefaultMode'    : [    '*',       '<Cmd>call WinWidthR()<CR>' ],
\ '<F22>___!___DefaultMode'    : [    '*',       '<Cmd>call WinHeightUp()<CR>a' ],
\ '<F15>___!___DefaultMode'    : [    '*',       '<Cmd>call WinHeightDown()<CR>a' ],
\ '<F16>___!___DefaultMode'    : [    '*',       '<Cmd>call WinWidthR()<CR>a' ],
\ '<F14>___!___DefaultMode'    : [    '*',       '<Cmd>call WinWidthL()<CR>a' ],
\ '<F22>___t___DefaultMode'    : [    '*',       '<Cmd>call WinHeightUp()<CR>a' ],
\ '<F15>___t___DefaultMode'    : [    '*',       '<Cmd>call WinHeightDown()<CR>a' ],
\ '<F16>___t___DefaultMode'    : [    '*',       '<Cmd>call WinWidthR()<CR>a' ],
\ '<F14>___t___DefaultMode'    : [    '*',       '<Cmd>call WinWidthL()<CR>a' ],
\ 'gf___ ___DefaultMode'       : [    '*',       'gF' ],
\ 'g<S-F>___ ___DefaultMode'   : [    '*',       'gf' ],
\}
call extend( g:keybinds, additonal_keybinds )


"  ####################
"  ###   terminal   ###
"  ####################
"
let additonal_keybinds = {
\ '<C-a>___t___Common'        : [ '*',       '<C-b>' ],
\ '<C-b>___t___Common'        : [ '*',       '<C-a>' ],
\ '<S-C-A>___t___Common'      : [ '*',       '<C-a>' ],
\ '<C-V>___t___Common'        : [ '*',       '<C-\><C-N>"*pi' ],
\ '<Esc>___t___Common'        : [ '*',       '<C-\><C-N><Cmd>call EventTermEscape()<CR>' ],
\ '<Esc>___n___TermMode'      : [ '*',       'a<Esc>' ],
\ 'a___n___TermMode'          : [ '*@',      'a<Cmd>call Tmux_functions([''exit_copy_mode'',''ete''])<CR>' ],
\ '<Space>___n___TermMode'    : [ '*@',      'a<Cmd>call Tmux_functions([''enter_copy_mode'',''middle_line'',''ete''])<CR>' ],
\ 'p___n___TermMode'          : [ '*@',      'p' ],
\ 'S___n___TermMode'          : [ '*@',      '/' ],
\ '/___n___TermMode'          : [ '*@',      'a<Cmd>call Tmux_functions([''ete'',''search_up''])<CR>' ],
\ 'c___n___TermMode'          : [ '*@',      'a<Cmd>call Tmux_functions([''enter_copy_mode'',''ete''])<CR>' ],
\ 'e___n___TermMode'          : [ '*@',      '<Cmd>call Tmux_functions([''first_row_e'',''ete''])     <CR><Cmd>call EventTermEnter()<CR>' ],
\ 'd___n___TermMode'          : [ '*@',      '<Cmd>call Tmux_functions([''last_row_d'',''ete''])      <CR><Cmd>call EventTermEnter()<CR>' ],
\ '<Up>___n___TermMode'       : [ '*@',      '<Cmd>call Tmux_functions([''first_row_up'',''ete''])    <CR><Cmd>call EventTermEnter()<CR>' ],
\ '<Down>___n___TermMode'     : [ '*@',      '<Cmd>call Tmux_functions([''last_row_down'',''ete''])   <CR><Cmd>call EventTermEnter()<CR>' ],
\ '<PageUp>___n___TermMode'   : [ '*@',      'a<Cmd>call Tmux_functions([''enter_copy_mode'',''bottom_line_page_up'',''ete''])<CR>' ],
\ '<PageDown>___n___TermMode' : [ '*@',      'a<Cmd>call Tmux_functions([''enter_copy_mode'',''ete''])<CR><PageDown>' ],
\ 'i___n___TermMode'          : [ '*@',      'a<Cmd>call Tmux_functions([''enter_copy_mode'',''middle_line'',''ete''])<CR>' ],
\ 'k___n___TermMode'          : [ '*@',      'a<Cmd>call Tmux_functions([''enter_copy_mode'',''middle_line'',''ete''])<CR>' ],
\ '<C-Q>___ ___TermMode'      : [ '*@',      '<Cmd>call EventWinLeave()<CR><Cmd>bunload!<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Q>___!___TermMode'      : [ '*@',      '<Cmd>call EventWinLeave()<CR><Cmd>bunload!<CR><Cmd>call EventWinEnter()<CR>' ],
\ '<C-Q>___t___TermMode'      : [ '*@',      '<Cmd>call EventWinLeave()<CR><Cmd>bunload!<CR><Cmd>call EventWinEnter()<CR>' ],
\}

"\ 'a___n___TermMode'                        :                   [ '*@'    ,      '<Cmd>let b:termcursor=getcurpos()<CR>a<Cmd>call EventTermEnter()<CR>' ],
"\ '<Space>___n___TermMode'                  :                   [ '*@'    ,      '<Cmd>let b:termcursor=getcurpos()<CR>a<Cmd>call Tmux_functions([''enter_copy_mode'',''middle_line'',''ete''])<CR>'],
"\ '<Space>___n___TermMode'                  :                   [ '*@'    ,      '<Cmd>let b:termcursor=getcurpos()<CR>a<C-a>[<Cmd>call EventTermEnter()<CR>' ],
call extend( g:keybinds, additonal_keybinds )

" need map function for each 'Super-Mode'. So no need unset-function.
"  modes are 'Super-Modes':
"  Common:      Stuff that needs to set only during vim init.
"  DefaultMode: Not in one of the other Modes
"  TermMode:    In a terminal-window
"  ExMode:      In the ex-mode window


let additonal_keybinds = {
\ '<A-m>___ ___DefaultMode' :  [ '*'   ,     '<Cmd>call Mutt()<CR>'],
\ '<A-m>___!___DefaultMode' :  [ '*'   ,     '<Cmd>call Mutt()<CR>'],
\ '<A-m>___t___DefaultMode' :  [ '*'   ,     '<Cmd>call Mutt()<CR>'],
\ '<A-b>___ ___DefaultMode' :  [ '*'   ,     '<Cmd>call OpenBrowser()<CR>'],
\ '<A-b>___!___DefaultMode' :  [ '*'   ,     '<Cmd>call OpenBrowser()<CR>'],
\ '<A-b>___t___DefaultMode' :  [ '*'   ,     '<Cmd>call OpenBrowser()<CR>'],
\ '<A-c>___ ___DefaultMode' :  [ '*'   ,     '<Cmd>Calendar<CR>'],
\ '<A-c>___!___DefaultMode' :  [ '*'   ,     '<Cmd>Calendar<CR>'],
\ '<A-c>___t___DefaultMode' :  [ '*'   ,     '<Cmd><CR>'],
\ '-___ ___DefaultMode'     :           g:keybinds['-___nv___Common'],
\ '-___ ___ExMode'          :           g:keybinds['-___nv___Common'],
\ '<M-c>___ov___Common'                     :                   [    ' '    ,    '<Cmd>Calendar<CR>' ],
\ '<A-c>___n___ExMode'     : [ '*@' , '<Cmd>Calendar<CR> '],
\ '<A-c>___i___ExMode'     : [ '*@' , '<Cmd>Calendar<CR>'],
\ '<A-c>___c___ExMode'     : [ '*@' , '<Cmd>Calendar<CR>'],
\ '<A-b>___n___ExMode'     : [ '*@' , '<Cmd>call OpenBrowser()<CR>'],
\ '<A-b>___i___ExMode'     : [ '*@' , '<Cmd>call OpenBrowser()<CR>'],
\ '<A-b>___c___ExMode'     : [ '*@' , '<Cmd>call OpenBrowser()<CR>'],
\ '<A-m>___n___ExMode'     : [ '*@' , '<Cmd>call Mutt()<CR>'],
\ '<A-m>___i___ExMode'     : [ '*@' , '<Cmd>call Mutt()<CR>'],
\ '<A-m>___c___ExMode'     : [ '*@' , '<Cmd>call Mutt()<CR>'],
\}
call extend( g:keybinds, additonal_keybinds )

" special functions
let additonal_keybinds = {
\ '<Leader>e___ ___Common'   :       [ '*'       ,    '<Esc>:e <C-r>=expand("%:p")<CR>' ],
\ '<Leader>+___n___Common'   :       [ '*'       ,    '?\v^(\w+\s+)?\w+\(.*\)<CR>zO'],
\ '<Leader>-___n___Common'   :       [ '*'       ,    '/\v^(\w+\s+)?\w+\(.*\)<CR>zO'],
\}
call extend( g:keybinds, additonal_keybinds )

" search related
"let additonal_keybinds = {
"\ '/___n___Common' :  [ '*'   ,     '<Cmd>echo ''echo cmap <CR> <CR><Cmd>exe cunmap <CR> <CR>zO''<CR>'],
"\}
"call extend( g:keybinds, additonal_keybinds )


" repeating related
" 2 keys with 3 layers
" mapped to 6 covered actions: ".,;:<Tab><C-o>"
" keys on the keyboard layer 1: w   e   r
"                      layer 2: ,  <pu> .
"                      layer 3: ;   -   :
" memorial1:  1 column: backward, last column forward
" memorial2:  2nd layer is for positions
" memorial3:  ":" stays at its place (1)&(2) -> map "r" to ";"
"             because ";" is a forward thing
" memorial4:  repeat last change to "w" because i use it more often

" r := repeat forward subject last-f-search  -> mapto ;
" w := repeat backward subject last change -> mapto   .
" , := go back subject position            -> mapto   <C-O>
" . := go forward subject position         -> mapto   <Tab>
" ; := go backward subject last-f-search   -> mapto   ,
" : := go into ex-mode                     -> mapping already defined somewhere
let additonal_keybinds = {
\ 'r___ ___Common'                          :                   [    '*'    ,    ';' ],
\ ';___ ___Common'                          :                   [    '*'    ,    ',' ],
\ 'w___no___Common'                         :                   [    '*'    ,    '.' ],
\ 'w___v___Common'                          :                   [    '*'    ,    ':normal .<CR>' ],
\ '.___ ___Common'                          :                   [    '*'    ,    '<Tab>' ],
\ ',___ ___Common'                          :                   [    '*'    ,    '<C-O>' ],
\}
call extend( g:keybinds, additonal_keybinds )
"  vim: set nowrap :
