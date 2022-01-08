


source $VIMRUNTIME/syntax/python.vim


syn region name_headline matchgroup=Quote
        \ start="^[ ]*name[ ]*[=][ ]*\z([']\{3\}\|["]\{3\}\|["']\)" end="\z1"
        \ oneline

syn region py_code matchgroup=pythonTripleQuotes
      \ start=+\(code\s*[=]\s*\)\@<=[uU]\=\z('''\|"""\)+ skip=+\\["']+ end="^\s*\z1"
      \ keepend
      \ fold
      \ transparent


hi clear    name_headline
hi clear    py_code
hi def      name_headline   guibg=#9f5f00 guifg=#ffffff
hi def      py_code         guifg=#9f00ff

"hi def nameline_name guibg=#00ffff guifg=#ffffff 
"hi nameline_name guibg=#00ffff guifg=#000000 

let b:current_syntax = "py_worker_code"
