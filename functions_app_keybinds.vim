" need map function for each 'Super-Mode'. So no need unset-function.
"  modes are 'Super-Modes': 
"  Common:      Stuff that needs to set only during vim init.
"  DefaultMode: Not in one of the other Modes
"  TermMode:    In a terminal-window
"  ExMode:      In the ex-mode window



let g:keybinds_apps={
\ '<A-m>___ ___DefaultMode' :  [ ' '   ,     '<Cmd>call Mutt()<CR>'],
\ '<A-m>___!___DefaultMode' :  [ ' '   ,     '<Cmd>call Mutt()<CR>'],
\ '<A-m>___t___DefaultMode' :  [ ' '   ,     '<Cmd>call Mutt()<CR>'],
\ '<A-b>___ ___DefaultMode' :  [ ' '   ,     '<Cmd>call OpenBrowser()<CR>'],
\ '<A-b>___!___DefaultMode' :  [ ' '   ,     '<Cmd>call OpenBrowser()<CR>'],
\ '<A-b>___t___DefaultMode' :  [ ' '   ,     '<Cmd>call OpenBrowser()<CR>'],
\ '<A-c>___ ___DefaultMode' :  [ ' '   ,     '<Cmd>Calendar<CR>'],
\ '<A-c>___!___DefaultMode' :  [ ' '   ,     '<Cmd>Calendar<CR>'],
\ '<A-c>___t___DefaultMode' :  [ ' '   ,     '<Cmd><CR>'],
\ '-___ ___DefaultMode' :  [ '*'   ,     '<Cmd>call NERDTreeToggle()<CR>'],
\ '-___ ___ExMode'     : [ '*' , '<Cmd>call NERDTreeToggle()<CR>'],
\ '<A-c>___n___ExMode'     : [ ' ' , '<Cmd>Calendar<CR> '],
\ '<A-c>___i___ExMode'     : [ ' ' , '<Cmd>Calendar<CR>'],
\ '<A-c>___c___ExMode'     : [ ' ' , '<Cmd>Calendar<CR>'],
\ '<A-b>___n___ExMode'     : [ ' ' , '<Cmd>call OpenBrowser()<CR>'],
\ '<A-b>___i___ExMode'     : [ ' ' , '<Cmd>call OpenBrowser()<CR>'],
\ '<A-b>___c___ExMode'     : [ ' ' , '<Cmd>call OpenBrowser()<CR>'],
\ '<A-m>___n___ExMode'     : [ ' ' , '<Cmd>call Mutt()<CR>'],
\ '<A-m>___i___ExMode'     : [ ' ' , '<Cmd>call Mutt()<CR>'],
\ '<A-m>___c___ExMode'     : [ ' ' , '<Cmd>call Mutt()<CR>'],
\}
