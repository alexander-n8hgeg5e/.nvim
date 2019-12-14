func! WinIsHigh_t()
    if ((300.0*winheight(0) )/(100.0*winwidth(0))) > 1
        return 1
    else
        return 0
    endif
endfunc
func! WinIsHigh_b()
    if ((500.0*winheight(0) )/(100.0*winwidth(0))) > 1
        return 1
    else
        return 0
    endif
endfunc
func! WinIsMostLeft()
  return winnr() == winnr("h")
endfunction
func! WinIsMostRight()
  return winnr() == winnr("l")
endfunction
func! WinIsMostTop()
  return winnr() == 1
endfunction
func! WinIsMostBottom()
  return winnr() == winnr("j")
endfunction
func! TabIsMostRight()
  return tabpagenr() == tabpagenr("$")
endfunction
func! TabIsMostLeft()
  return tabpagenr()  ==# 1
endfunction
