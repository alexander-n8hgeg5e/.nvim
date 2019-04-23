if exists("g:loaded_nerdtree_plugin_mail_attach")
    finish
endif
let g:loaded_nerdtree_plugin_mail_attach = 1

function! s:callback_name()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . 'callback'
endfunction

function! s:callback()
    try
        let path = g:NERDTreeFileNode.GetSelected().path.str({'escape': 1})
    catch
        return
    endtry

    if exists("g:nerdtree_plugin_mail_attach")
        let cmd = g:nerdtree_plugin_mail_attach_cmd . " " . path
        call system(cmd)
    endif
endfunction

call NERDTreeAddKeyMap({
    \ 'callback': s:callback_name(),
    \ 'quickhelpText': 'attach to new email with mutt',
    \ 'key': 'a',
    \ })
