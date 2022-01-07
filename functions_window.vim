func! GoRight()
  stopinsert
  if WinIsMostRight()
    if TabIsMostRight()
      exe "tabnew"
    else
      exe "tabnext"
    endif
  else
    exe "wincmd l"
  endif
endfunction

func! GoTabRight()
  stopinsert
    if TabIsMostRight()
      exe "tabnew"
    else
      exe "tabnext"
    endif
endfunction

func! GoTabLeft()
  stopinsert
  tabprev
endfunction

func! GoUp()
  stopinsert
  if WinIsMostTop()
    if WinIsHigh_t()
      exe "leftabove new"
    else
      exe "rightbelow vnew"
    endif
  else
    exe "wincmd k"
  endif
endfunction
func! GoDown()
  stopinsert
  if WinIsMostBottom()
    if WinIsHigh_b()
      exe "rightbelow new"
    else
      exe "rightbelow vnew"
    endif
  else
    exe "wincmd j"
  endif
endfunction

func! GoLeft()
  stopinsert
  if WinIsMostLeft()
    exe "tabprevious"
  else
    exe "wincmd h"
  endif
endfunction

function! DefaultMode_WinMoveUp()
  exe "wincmd K"
endfunction
function! DefaultMode_WinMoveDown()
  exe "wincmd J"
endfunction
function! DefaultMode_WinMoveLeft()
  exe "wincmd H"
endfunction
function! DefaultMode_WinMoveRight()
  exe "wincmd L"
endfunction
function! DefaultMode_WinMoveNewTab()
  exe "wincmd T"
endfunction
function! WinHeightUp()
  if WinIsMostTop()
    exe "wincmd -"
  elseif WinIsMostBottom()
    exe "wincmd +"
  else
    exe "wincmd -"
  endif
endfunction
function! WinHeightDown()
  if WinIsMostTop()
    exe "wincmd +"
  elseif WinIsMostBottom()
    exe "wincmd -"
  else
   exe "wincmd +"
  endif
endfunction
function! WinWidthPlus()
  if WinIsMostRight()
    exe "15wincmd >"
  elseif WinIsMostLeft()
    exe "15wincmd <"
  else
    exe "15wincmd <"
  endif
endfunction
function! WinWidthMinus()
  if WinIsMostLeft()
    exe "15wincmd >"
  elseif WinIsMostRight()
    exe "15wincmd <"
  else
    exe "15wincmd >"
  endif
endfunction
function! WinWidthL()
  if WinIsMostLeft()
    exe "15wincmd <"
  elseif WinIsMostRight()
    exe "15wincmd >"
  else
    exe "15wincmd <"
  endif
endfunction
function! WinWidthR()
  if WinIsMostLeft()
    exe "15wincmd >"
  elseif WinIsMostRight()
    exe "15wincmd <"
  else
    exe "15wincmd >"
  endif
endfunction

function! Win_ExMode_HeightUp()
    exe "wincmd +"
endfunction
function! Win_ExMode_HeightDown()
    exe "wincmd -"
endfunction
