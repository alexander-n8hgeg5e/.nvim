function! Complete_em_all(findstart,base)
        if (a:findstart == 1)
              let line = getline('.')                         " current line
              let lline = strpart(line, -1, col('.'))      " from the start of the current
                                                              " line to one character right
              let x = matchstrpos(lline, "[^ \t]*$")           " of the cursor
              return   x[1]
        elseif (a:findstart == 0)
             return ['okiok' ,'oki']
        endif
endfunction
