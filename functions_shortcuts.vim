function! OpenSyncTabs() range
    exe '%s/\v^[ ]*(pc)?(\d+).*$/\2/'
    let a:l=getline(a:firstline,a:lastline)
    for i in a:l
        tabnew
        call g:Create_Terminal_buffer("ssh pc".i." \'bash -l -c \\\'ii\\\'\'")
        call SetTabName("pc".i )
    endfor
endfunction
