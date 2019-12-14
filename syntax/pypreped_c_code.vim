source $VIMRUNTIME/syntax/python.vim


syn region pyprep matchgroup=Quote start="[/][*]" end="[*][/]" contains=pythonFunction keepend



"hi def nameline_name guibg=#00ffff guifg=#ffffff 
"hi nameline_name guibg=#00ffff guifg=#000000 

let b:current_syntax = "pypreped_c_code"
