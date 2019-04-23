function! Init_Keybinds(...)
    for i in a:1
         for j in range(len(i[0]))
             let s:cmd=''
             if i[0][j]=="n"
                     let s:cmd="n"
             elseif i[0][j]=="o"
                     let s:cmd="o"
             elseif i[0][j]=="v"
                     let s:cmd="v"
             elseif i[0][j]=="t"
                     let s:cmd="t"
             elseif i[0][j]==" "
                     let s:cmd=""
             elseif i[0][j]=="c"
                     let s:cmd="c"
             elseif i[0][j]=="!"
                     let s:cmd="!"
             elseif i[0][j]=="i"
                     let s:cmd="i"
             else
                     echoe "error  i0j is not ovt... listelement: " . i 
                     echoe "s:cmd: " . s:cmd 
             endif
             if i[2][0]=='*'
                     if  s:cmd!="!"
                             let s:cmd= s:cmd . 'noremap'
                     elseif s:cmd=="!"
                             let s:cmd= 'noremap!'
                     else
                         echoe "error cmd is not '!' nor not '!' . listelement: " . string(i) 
                         echoe "s:cmd: " . s:cmd 
                     endif
             elseif i[2][0]==" "
                     if s:cmd!="!"
                             let s:cmd= s:cmd . 'map'
                     elseif s:cmd=="!"
                             let s:cmd= 'map!'
                     else
                         echoe "error cmd is not '!' nor not '!' . listelement: " . string(i) 
                         echoe "s:cmd: " . s:cmd 
                     endif 
             else
                    echoe "error i2 not as expected listelement: " . string(i) 
                    echoe "s:cmd: " . s:cmd 
    
             endif
             if  len(i[2]) > 1
                     if i[2][1]=='@'
                            let s:cmd=  s:cmd  . ' <buffer>'
                     else
                            echoe "error unknown symbol in listelement: " . string(i) 
                            echoe "s:cmd: " . s:cmd 
                     endif
             endif
             if  len(i[2]) > 2
                     if i[2][2:]=='<nowait>'
                            let s:cmd=  s:cmd  . ' <nowait>'
                     else
                            echoe "error unknown symbol in listelement: " . string(i) 
                            echoe "s:cmd: " . s:cmd 
                     endif
             endif
             let s:cmd= s:cmd . "   " .  i[1]  .  "   "  .   i[3]
             exe s:cmd
         endfor
    endfor
endfunction

function! Init_Keybinds_(dictt,modestring)
     if (a:modestring == "TermMode") && GetBuffersMode() != 1
	     echoe ("error: wrong keybinds call")
    endif
    for k in keys(a:dictt)
	 let k_key = split(k,'___')
         let i=[ k_key[1] , k_key[0] , a:dictt[k][0] ]
	 let entrys_modestring = k_key[2]
	 if a:modestring == entrys_modestring
            for j in range(len(i[0]))
                let s:cmd=''
                if i[0][j]=="n"
                        let s:cmd="n"
                elseif i[0][j]=="o"
                        let s:cmd="o"
                elseif i[0][j]=="v"
                        let s:cmd="v"
                elseif i[0][j]=="t"
                        let s:cmd="t"
                elseif i[0][j]==" "
                        let s:cmd=""
                elseif i[0][j]=="c"
                        let s:cmd="c"
                elseif i[0][j]=="!"
                        let s:cmd="!"
                elseif i[0][j]=="i"
                        let s:cmd="i"
                else
                        echoe "error  i0j is not ovt... listelement: " . i 
                        echoe "s:cmd: " . s:cmd 
                endif
                if i[2][0]=='*'
                        if  s:cmd!="!"
                                let s:cmd= s:cmd . 'noremap'
                        elseif s:cmd=="!"
                                let s:cmd= 'noremap!'
                        else
                            echoe "error cmd is not '!' nor not '!' . listelement: " . string(i) 
                            echoe "s:cmd: " . s:cmd 
                        endif
                elseif i[2][0]==" "
                        if s:cmd!="!"
                                let s:cmd= s:cmd . 'map'
                        elseif s:cmd=="!"
                                let s:cmd= 'map!'
                        else
                            echoe "error cmd is not '!' nor not '!' . listelement: " . string(i) 
                            echoe "s:cmd: " . s:cmd 
                        endif 
                else
                       echoe "error i2 not as expected listelement: " . string(i) 
                       echoe "s:cmd: " . s:cmd 
    
                endif
                if  len(i[2]) > 1
                        if i[2][1]=='@'
                               let s:cmd=  s:cmd  . ' <buffer>'
                        else
                               echoe "error unknown symbol in listelement: " . string(i) 
                               echoe "s:cmd: " . s:cmd 
                        endif
                endif
                if  len(i[2]) > 2
                        if i[2][2:]=='<nowait>'
                               let s:cmd=  s:cmd  . ' <nowait>'
                        else
                               echoe "error unknown symbol in listelement: " . string(i) 
                               echoe "s:cmd: " . s:cmd 
                        endif
                endif
                let s:cmd= s:cmd . "   " .  i[1]  .  "   "  .   a:dictt[k][1]
                exe  s:cmd
            endfor
	 endif
    endfor
endfunction

