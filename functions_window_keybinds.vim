function! Set_DefaultMode_Win_Keybinds()
     call Set_DefaultMode_WinNav_Keybinds()
     call Set_DefaultMode_WinMove_Keybinds()
     call Set_DefaultMode_WinRes_Keybinds()
endfunction

function! Set_ExMode_Win_Keybinds()
        call Set_ExMode_WinRes_Keybinds()
endfunction

function! Set_DefaultMode_WinNav_Keybinds()
     noremap <silent> <C-q> <Cmd>q<CR>
     noremap! <silent> <C-q> <Cmd>q<CR>
     tnoremap <silent> <C-q> <Cmd>q<CR>
     noremap <silent> <C-Left> <Cmd>call GoLeft()<CR>
     noremap <silent> <C-Down> <Cmd>call GoDown()<CR>
     noremap <silent> <C-Up> <Cmd>call GoUp()<CR>
     noremap <silent> <C-Right> <Cmd>call GoRight()<CR>
     cnoremap <silent> <C-Left> <Cmd>call GoLeft()<CR>
     cnoremap <silent> <C-Up> <Cmd>call GoUp()<CR>
     cnoremap <silent> <C-Right> <Cmd>call GoRight()<CR>
     tnoremap <silent> <C-Left> <Cmd>call GoLeft()<CR>
     tnoremap <silent> <C-Down> <Cmd>call GoDown()<CR>
     tnoremap <silent> <C-Up> <Cmd>call GoUp()<CR>
     tnoremap <silent> <C-Right> <Cmd>call GoRight()<CR>
     inoremap <silent> <C-Left> <Cmd>call GoLeft()<CR>
     inoremap <silent> <C-Down> <Cmd>call GoDown()<CR>
     inoremap <silent> <C-Up> <Cmd>call GoUp()<CR>
     inoremap <silent> <C-Right> <Cmd>call GoRight()<CR>
     vnoremap <silent> <C-Left> <Cmd>call GoLeft()<CR>
     vnoremap <silent> <C-Down> <Cmd>call GoDown()<CR>
     vnoremap <silent> <C-Up> <Cmd>call GoUp()<CR>
     vnoremap <silent> <C-Right> <Cmd>call GoRight()<CR>
     noremap <silent> <C-f> <Cmd>call GoTabRight()<CR>
     cnoremap <silent> <C-f> <Cmd>call GoTabRight()<CR>
     cnoremap <silent> <C-f> <Cmd>call GoTabRight()<CR>
     tnoremap <silent> <C-f> <Cmd>call GoTabRight()<CR>
     inoremap <silent> <C-f> <Cmd>call GoTabRight()<CR>
     vnoremap <silent> <C-f> <Cmd>call GoTabRight()<CR>
     noremap <silent> <C-s> <Cmd>call GoTabLeft()<CR>
     cnoremap <silent> <C-s> <Cmd>call GoTabLeft()<CR>
     cnoremap <silent> <C-s> <Cmd>call GoTabLeft()<CR>
     tnoremap <silent> <C-s> <Cmd>call GoTabLeft()<CR>
     inoremap <silent> <C-s> <Cmd>call GoTabLeft()<CR>
     vnoremap <silent> <C-s> <Cmd>call GoTabLeft()<CR>
endfunction

function! Set_DefaultMode_WinRes_Keybinds()
   noremap <silent> <F22> <Cmd>call WinHeightUp()<CR>
   noremap <silent> <F15> <Cmd>call WinHeightDown()<CR>
   noremap <silent> <F14> <Cmd>call WinWidthL()<CR>
   noremap <silent> <F16> <Cmd>call WinWidthR()<CR>
   noremap! <silent> <F22> <Cmd>call WinHeightUp()<CR>a
   noremap! <silent> <F15> <Cmd>call WinHeightDown()<CR>a
   noremap! <silent> <F16> <Cmd>call WinWidthR()<CR>a
   noremap! <silent> <F14> <Cmd>call WinWidthL()<CR>a
   tnoremap <silent> <F22> <Cmd>call WinHeightUp()<CR>a
   tnoremap <silent> <F15> <Cmd>call WinHeightDown()<CR>a
   tnoremap <silent> <F16> <Cmd>call WinWidthR()<CR>a
   tnoremap <silent> <F14> <Cmd>call WinWidthL()<CR>a
endfunction

function! Set_DefaultMode_WinMove_Keybinds()
   noremap <silent> <A-e> <Cmd>call DefaultMode_WinMoveUp()<CR>
   noremap <silent> <A-d> <Cmd>call DefaultMode_WinMoveDown()<CR>
   noremap <silent> <A-s> <Cmd>call DefaultMode_WinMoveLeft()<CR>
   noremap <silent> <A-f> <Cmd>call DefaultMode_WinMoveRight()<CR>
   noremap <silent> <A-g> <Cmd>call DefaultMode_WinMoveNewTab()<CR>
   noremap! <silent> <A-e> <Cmd>call DefaultMode_WinMoveUp()<CR>a
   noremap! <silent> <A-d> <Cmd>call DefaultMode_WinMoveDown()<CR>a
   noremap! <silent> <A-f> <Cmd>call DefaultMode_WinMoveLeft()<CR>a
   noremap! <silent> <A-s> <Cmd>call DefaultMode_WinMoveRight()<CR>a
   noremap! <silent> <A-g> <Cmd>call DefaultMode_WinMoveNewTab()<CR>a
   tnoremap <silent> <A-e> <Cmd>call DefaultMode_WinMoveUp()<CR>a
   tnoremap <silent> <A-d> <Cmd>call DefaultMode_WinMoveDown()<CR>a
   tnoremap <silent> <A-f> <Cmd>call DefaultMode_WinMoveLeft()<CR>a
   tnoremap <silent> <A-s> <Cmd>call DefaultMode_WinMoveRight()<CR>a
   tnoremap <silent> <A-g> <Cmd>call DefaultMode_WinMoveNewTab()<CR>a
endfunction


function! Set_ExMode_WinRes_Keybinds()
     noremap  <silent> <F22> <Cmd>call Win_ExMode_HeightUp()<CR> 
     noremap  <silent> <F15> <Cmd>call Win_ExMode_HeightDown()<CR>
     noremap! <silent> <F22> <Cmd>call Win_ExMode_HeightUp()<CR>
     noremap! <silent> <F15> <Cmd>call Win_ExMode_HeightDown()<CR>
endfunction
