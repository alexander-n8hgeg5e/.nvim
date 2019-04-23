func! WinIsMostLeft()
  let oldw = winnr()
  exe "wincmd h"
  let neww = winnr()
  if !(oldw ==# neww)
    exe oldw.'wincmd p'
  endif
  return oldw == neww
endfunction
func! WinIsMostRight()
  let oldw = winnr()
  exe "wincmd l"
  let neww = winnr()
  if !(oldw ==# neww)
    exe oldw.'wincmd p'
  endif
  return oldw == neww
endfunction
func! WinIsMostTop()
  let oldw = winnr()
  exe "wincmd k"
  let neww = winnr()
  if !(oldw ==# neww)
    exe oldw.'wincmd p'
  endif
  return oldw == neww
endfunction
func! WinIsMostBottom()
  let oldw = winnr()
  exe "wincmd j"
  let neww = winnr()
  if !(oldw ==# neww)
    exe oldw.'wincmd p'
  endif
  return oldw == neww
endfunction
func! TabIsMostRight()
  let ctab = tabpagenr()
  let lasttab = tabpagenr("$")
  return lasttab == ctab
endfunction
func! TabIsMostLeft()
  let ctab = tabpagenr()
  return 1 ==# ctab
endfunction
