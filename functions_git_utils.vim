function! ListCommitFiles()
    let id=substitute( getline("."), '\S\+[ ]\+\([a-f0-9]\+\).*$', "\\1", "" )
    let l:file_list = systemlist("cd " . expand("%:p:h") . "; git show --pretty='' --name-only " . id)
    return map( l:file_list, '{"filename": "' . '".v:val, "lnum": 1}')
endfunction

function! Showqf_commitfiles()
    call setqflist(ListCommitFiles())
    copen
    resize 12
    wincmd p
endfunction

function! EnableMapping_show_commitfiles()
    nnoremap <CR> <Cmd>call Showqf_commitfiles()<CR>
endfunction
