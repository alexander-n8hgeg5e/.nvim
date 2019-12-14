


source $VIMRUNTIME/syntax/python.vim


syn region name_headline matchgroup=Quote start="^[ ]*name[ ]*[=][ ]*\z([']\{3\}\|["]\{3\}\|["']\)" end="\z1" contains=nameline_name keepend

syn region py_code matchgroup=Quote start="^[ ]*code[ ]*[=][ ]*\z([']\{3\}\|["]\{3\}\)" end="\z1" contains=ALL keepend


hi clear name_headline
hi def name_headline      guibg=#9f5f00 guifg=#ffffff

"hi def nameline_name guibg=#00ffff guifg=#ffffff 
"hi nameline_name guibg=#00ffff guifg=#000000 

let b:current_syntax = "infile_python"
