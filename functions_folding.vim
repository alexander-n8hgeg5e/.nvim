function! Foldtext()
    let numlines = v:foldend - v:foldstart + 1
	let indentw =  (v:foldlevel - 1 ) * &shiftwidth
    let l = repeat( " " , indentw )
    let l = l . "+" . numlines 
    let d = col([v:foldstart-1,"$"]) - 1 -len(l)
	" The case of foldmethods that put
	" the first line into the fold, so that no
	" headline is visible
	if &foldmethod != "indent"
		let l = l . " " . strcharpart(getline(v:foldstart),indentw)
	else
    	if d > 0
    	    let l= l . repeat("=", d )
    	endif
	endif

    return l
endfun
