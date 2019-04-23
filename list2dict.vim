function! List2dict_keybind_edition(liste,modestring)
        let sep="___"
        let d = {}
        "let w = len(a:liste[0])
             for i in a:liste
                           call extend( d ,   { i[1] . sep . i[0] . sep .  a:modestring : [ i[2] ,  i[3] ] } )
             endfor
       return d
endfunction


function! Print_dict(dictt)
   echo 'dictt={'
   for i in keys(a:dictt)
	   echo '\ ''' . i .'''                              :                           [    '''  . a:dictt[i][0] .'''    ,    ''' . a:dictt[i][1] .'''   ],'
   endfor
   echo '\}'
endfunction
