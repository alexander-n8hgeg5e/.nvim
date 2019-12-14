function! Complete_em_all(findstart,base)
	  if a:findstart
              let line = getline('.')                         " current line
	      let start = col('.') - 1
	    while start > 0 && line[start - 1] =~ '\a'
	      let start -= 1
	    endwhile

            "  let lline = strpart(line, -1, col('.'))      " from the start of the current
            "  let x = matchstrpos(lline, "[^ \t]*$")           " of the cursor
            "  return   x[1]
	    return -2
        else
             return ['okiok' ,'oki']
        endif
endfunction
