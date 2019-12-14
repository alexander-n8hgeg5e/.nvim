function! Foldtext()
    let numlines = v:foldend - v:foldstart + 1
    let l  = ""
    let l = l ."<+> "
    let d = v:foldlevel * &shiftwidth - len(l) - 1 
    if d > 0 
        let l = l . repeat( " " , d )
    endif
    let l = l . "_" .numlines
    let d = col([v:foldstart-1,"$"]) - 1 -len(l)
    if d > 0
        let l= l . repeat("_", d )
    endif
    return l
endfun
