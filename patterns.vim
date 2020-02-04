"
"     some vim pattern matching things:
"     --------------------------------
" "very magic"     ("\v") -> "[^0-9azAZ_]"          -> special
" "very nomagic"   ("\V") -> "\"  and "term-char"   -> special
"                              ############
" "magic -vs- nomagic"  -> ## ".*~[" ##
"                              ############
" 
" 
"
" "\@="	  ->  requires a match
" "\@!"	  ->  requires NO match
" "\@<="  ->  requires a match behind
" "\@<!"  ->  requires NO match behind
"
"

let pat_match_keybind= '\v\''[^_]+___([ ]|[niovtc]{1,6})___\w+\''\s*:\s*\[\s*\''(\s|*)\@?\''\s*\,\s*\''[^'']+\''\s*\]' 
let pat_match_keybind2='%s/\C\v(^.*\'')([ef])(___([ ]|[niovtc]{1,6})___\w+\''\s*:\s*\[\s*\''(\s|*)\@?\''\s*\,\s*\'')([^'']+)(\''\s*\].*$)/\=submatch(1) . submatch(2). submatch(3). toupper(submatch(6)). submatch(7) ."\r".submatch(1) . toupper(submatch(2)). submatch(3). submatch(6). submatch(7)/'
let pat_match_keybind3='\C\v(^.*\'')(#)(___([ ]|[niovtc]{1,6})___\w+\''\s*:\s*\[\s*\''(\s|[*])(\@|[<]expr[>])?\''\s*\,\s*\'')([^'']+)(\''\s*\].*$)'
let pat_popen_cmd=     '''<,''>s/\%V\v[ ]+/'', ''/g |''<,''>s/\%V\v(.*)/\[ ''\1'' \]/'
let pat_folds_funcdef=  '%s/\v(\w\s*$)(\n(\s*\n)*[ ]*def[ ].*\n.*)$/\1   #}}}\2   #{{{/'

let pat_emerge_outp_clean_packages='%s/\v^.*[(](.*)[-]\d.*[,].*$/\1'

let sub_align='let col=getcurpos()[2]| exe ''s/\v^(\S+)\s+(%''.col.''v|\S)(\s*)(\S+.*$)/\=submatch(1) . Get_space(''.col.''-len(submatch(1))-1) .submatch(2) . submatch(4)/'''



