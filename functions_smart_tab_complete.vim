function! SmartTabComplete()
    call Abort_completion()
    let line_nr = line('.')
    let col_nr = col('.')
    let line = getline('.')                         " current line
    let lline = strpart( line, -1, col_nr - 1 )
    let lline_striped = trim( lline )

    if (strlen(lline_striped)==0)
        call feedkeys("\<tab>","nt")
        return
    endif
    let startcompleteseq="\<C-X>"

   
    " check whether the last complete was a fail
    " and record the info to the b:completes var
    " for next invocations of this func
    " the fail state is recorded by autocmd
    " other things are updated here
    " the fail state is in the b:last_complete var
    " the v:completed_item var is not buffer local
    " and may be outdated
    if exists("b:last_complete")
        if b:last_complete[-1] == 1
            " last was fail, save stuff
            let lc=b:last_complete[0]
            let b:completes[ lc ][1]=b:completes[lc][1]-1
            let b:completes[ lc ][-1]=b:last_complete[-1]
            let b:completes[ lc ][-2]=b:last_complete[-2]
            let b:completes[ lc ][-3]=b:last_complete[-3]
        else
            " last was success
            " no need for failed records
            " reset them
            silent! let b:completes[lc][1]=b:completes[lc][1]+1
            call SmartTabCompleteResetFailed()
        endif
    endif
    
    " now after updateing the buffer var
    " make a copy to work on
    let completes=copy(b:completes)

    let maxval = -999999

    for k in keys(completes)
        if ( completes[k][1] > maxval )
            let maxval = completes[k][1]
            "if  maxval > 2000
            "    for kk in keys(b:completes)
            "        let b:completes[kk][1]-=500
            "    endfor
            "endif
        endif
    endfor
    
    " exclude all entries that are less than the maxval
    " or failed in prior invocation of this func
    " whereby they all failed in a row with now success
    " if all of them failed reset the failed recordings
    " and reload the completes dict

    " first,
    " exclude the failed ones with higer priority:
    for k in keys(completes)
        if completes[k][-1] == 1
            let failed_line_nr = completes[k][-2]
            if failed_line_nr == -1 || failed_line_nr==line_nr
                let s0=completes[k][-3]
                let sl0=strlen(s0)
                let partlen=float2nr(sl0*0.8)
                let sp=strpart(s0,0,partlen )
                let spq=substitute(sp, '\\' , '\\\\' ,"g")
                if  match(lline,"\V" . spq)
                    if len(completes) > 1
                        unlet completes[k]
                    else
                        " all completions failed
                        " reset the failed ones to restart
                        call SmartTabCompleteResetFailed()
                        let completes=copy(b:completes)
                    endif
                endif
            endif
        endif
    endfor


    " with lower priority
    " exclude the ones that have lower success count
    for k in keys(completes)
        let val=completes[k][1]
        if  val < maxval
            "if val < maxval - 1000
            "    let b:completes[k][1]= maxval - 500
            "endif
            if len(completes) > 1
                unlet completes[k]
            endif
        endif
    endfor



    if len(completes) == 1
        let comp_key=keys(completes)[0]
    else
        let comp_key=Get_start_complete_mode(line,lline,completes)
    endif

    let b:last_complete = [ comp_key , lline, line_nr ]
    let m=mode()
    call feedkeys(startcompleteseq . completes[comp_key][0],"nt")
endfunction

function! SmartTabCompleteResetFailed()
            for k in keys(b:completes)
                let b:completes[k][-1]=0
                let b:completes[k][-2]=-1
                let b:completes[k][-3]=""
            endfor
endfunction

function! Abort_completion()
    let c=col(".")
    if c == 1
        call feedkeys("\<Right>\<Left>","nt")
    else
        call feedkeys("\<Left>\<Right>","nt")
    endif
endfunction

function! CompleteDone()
    " the failed state in v:completed_item is not buffer local
    " so record it here immediately via autocmd
    if exists("b:last_complete")
        if !empty(v:completed_item)
            " completion successful
            " append a value
            let b:last_complete+=[0]
        else
            " failed
            " append a value
            let b:last_complete+=[1]
        endif
    endif
endfunction

function! InitSmartTabCompleteBufferVars()
    if !exists( "b:completes" )
        " key: [chars_to_send, successcount, lline ,line_nr, failed]
        silent! let b:completes = { 
        \  "f" : [ "\<C-F>" ,0,"",-1,0] ,                       
        \  "v" : [ "\<C-V>" ,0,"",-1,0] ,                       
        \  "o" : [ "\<C-O>" ,0,"",-1,0] ,                       
        \  "p" : [ "\<C-P>" ,0,"",-1,0] , 
        \}
    endif
    if empty(&omnifunc)
        silent! unlet b:completes["o"]
    endif
endfunction
    
function! Get_start_complete_mode(line,lline,completes)
    let lword = matchstr(a:lline, "[^ \t]*$")       " word till cursor
    let lword_ = substitute( lword , '/' ,  '\/' ,"g")
    let lword_noquotes = matchstr(a:lline, '\v[^ ''"\t]*$')       " word till cursor
    let lword_noquotes = substitute( lword_noquotes , '/' ,  '\/' ,"g")
    let word_has_period = match(lword, '\.') != -1
    let word_has_slash = match(lword, '\/') != -1
    let word_has_colon = match(lword, ':') != -1
    let word_has_cmd = match(lword, '\v(let|map|call|silent)[ ]+')  != -1
    let insidequote =  match(a:line, '\v["''][^"'']*\V' . lword_noquotes ) != -1
    let insideparen =  match(a:line, '\v[(][^)]*\V'.lword_noquotes ) != -1

    if has_key(a:completes,"f") && ( word_has_slash )
        return "f"

    elseif has_key(a:completes,"v") && ( !insidequote && !insideparen && word_has_cmd && word_has_colon )
        return "v"

    elseif has_key(a:completes,"o") && (!word_has_period  )
        return "o"

    elseif has_key(a:completes,"p")
        return "p"
    else
        return keys(a:completes)[0]
    endif
endfunction
