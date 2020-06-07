function! CreateNerdtreeBuffer()
    call EventWinLeave()
	NERDTreeToggle
    call SetBuffersMode(5)
    call Init_Keybinds(g:keybinds,'NerdtreeMode')
    call EventNerdtreeWinEnter()
endfunction

function! EventNerdtreeWinEnter()
    call SetBuffersMode(5)
    call Init_Keybinds(g:keybinds,'NerdtreeMode')
    "hi CursorLine guibg=#ffff00 guifg=#0000ff
endfunction

function! Key_Nerdtree_preview(islocal)
    if 0==win_getid(2)
        vsplit
    else
        wincmd l
    endif
    set previewwindow
    wincmd p
    call feedkeys("p","mt")
endfunction

function! Key_scroll_3up(islocal)
       call feedkeys("\<C-e>\<C-e>\<C-e>","nt")
endfunction

function! Key_scroll_3down(islocal)
       call feedkeys("\<C-y>\<C-y>\<C-y>","nt")
endfunction

function! Key_3down(islocal)
	call feedkeys('jjj','tn')
endfunction
function! Key_3up(islocal)
	call feedkeys('kkk','tn')
endfunction
function! Key_move_to_beginning_of_word(islocal)
	call feedkeys('b','n')
endfunction
function! Key_move_to_end_of_word(islocal)
	call feedkeys('e','n')
endfunction
function! Nerdtree_Create_Dir(islocal)
	call Nerdtree#Call("NerdtreeMakeDir","")
endfunction

function! Key_Nerdtree_Quit(islocal)
    call EventNerdtreeWinLeave()<CR><Cmd>q<CR><Cmd>call EventWinEnter()<CR>'
endfunction
function! Key_Nerdtree_reload(islocal)
    call feedkeys("\<C-l>","mt")
endfunction
function! Key_Nerdtree_treeroot(islocal)
    call feedkeys("gn","mt")
endfunction


fun! EventNerdtreeWinLeave()
	"todo remove this
        "call Init_Keybinds(g:keybinds,'DefaultMode')
endfunction
