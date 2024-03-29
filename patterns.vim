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
let sub_match_keybind2='%s/\C\v(^.*\'')([ef])(___([ ]|[niovtc]{1,6})___\w+\''\s*:\s*\[\s*\''(\s|*)\@?\''\s*\,\s*\'')([^'']+)(\''\s*\].*$)/\=submatch(1) . submatch(2). submatch(3). toupper(submatch(6)). submatch(7) ."\r".submatch(1) . toupper(submatch(2)). submatch(3). submatch(6). submatch(7)/'
let pat_match_keybind2=sub_match_keybind2
let pat_match_keybind3='\C\v(^.*\'')(#)(___([ ]|[niovtc]{1,6})___\w+\''\s*:\s*\[\s*\''(\s|[*])(\@|[<]expr[>])?\''\s*\,\s*\'')([^'']+)(\''\s*\].*$)'
let sub2pylist='s/\%V\v[ ]+/'', ''/g |''<,''>s/\%V\v(.*)/\[ ''\1'' \]/'
let pat_popen_cmd=sub2pylist
let sub_folds_funcdef='%s/\v(\w\s*$)(\n(\s*\n)*[ ]*def[ ].*\n.*)$/\1   #}}}\2   #{{{/'
let pat_folds_funcdef=sub_folds_funcdef
let sub_emerge_outp_clean_packages='%s/\v^.*[(](.*)[-]\d.*[,].*$/\1'
let pat_emerge_outp_clean_packages=sub_emerge_outp_clean_packages
let sub_align_indent='let col=getcurpos()[2]| exe ''''''<,''''>s/\v^(\S+)\s+(%''.col.''v|\S)(\s*)(\S+.*$)/\=submatch(1) . Get_space(''.col.''-len(submatch(1))-1) .submatch(2) . submatch(4)/'''
let sub_align_right_item='echo "align_right_item"|let col=getcurpos()[2]| exe ''''''<,''''>s/\v(\s*)(%''. ( col + 1 ) .''v)(\s*)((\S+))/\=submatch(1).submatch(4).submatch(3)/'''
let sub_align_left_item='echo "align_left_item"|let col=getcurpos()[2]| exe ''''''<,''''>s/\v((\S+))(\s*)(%''. ( col + 1 ) .''v)(\s*)/\=submatch(3).submatch(1).submatch(5)/'''
let sub_mv_space_gt1_right='s/\%V\v([ ]{2,})([^ ]*)/\= submatch(2) . submatch(1) /g'
let sub_rm_vers_num_gentoo_pkg='s/\v^([^/]+[/].*)[-][0-9].*$/\1/'
let sub_scale_kicad_symbol_poly='s/\v(P\s(\d\s){4})(.*)([ ][NF]$)/\= submatch(1) . system(["python","-c","s=''" . submatch(3)."'';print('' ''.join([str(int(i)*2) for i in s.split('' '')]),end='''')"]) . submatch(4)/'
let sub_scale_kicad_symbol_box='s/\v(S\s+)([-]?\d+)\s+([-]?\d+)\s+([-]?\d+)\s+([-]?\d+)/\=submatch(1).submatch(2)*2 ." ".submatch(3)*2." ".submatch(4)*2." ".submatch(5)*2/'
let sub_scale_kicad_symbol_pin='s/\v(X\s(\S+\s+){2})(([-]?\d+\s+){3})((\S+\s+)*(\S+)$)/\= submatch(1) . system(["python","-c","s=''" . submatch(3)."'';print('' ''.join([str(int(i)*2) for i in s.strip().split('' '')]),end='' '')"]) . submatch(5)'
