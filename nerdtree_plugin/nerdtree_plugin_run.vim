if exists("g:loaded_nerdtree_plugin_run")
    finish
endif
let g:loaded_nerdtree_plugin_run = 1

function! s:callback_name()
    return matchstr(expand('<sfile>'), '<SNR>\d\+_') . 'callback'
endfunction

function! g:ReceiveNerdtreePluginRun(job_id, data, event)
  if a:event == 'stderr'
    let g:ReceiveNerdtreePluginRun_error = string(a:data)
  endif
  if a:event == 'stdout'
    let g:ReceiveNerdtreePluginRun_out = string(a:data)
  endif
  if a:event == 'exit'
    if a:data != 0
	    if exists("g:ReceiveNerdtreePluginRun_out")
		echom 'Output: ' . strpart(g:ReceiveNerdtreePluginRun_out,0,100) . '...'
            endif
	    if exists("g:ReceiveNerdtreePluginRun_error")
	        echom 'Error: ' . strpart(g:ReceiveNerdtreePluginRun_error,0,100) . '...'
            endif 
    else 
	    if exists("g:ReceiveNerdtreePluginRun_out")
		echom 'Output: ' .strpart(g:ReceiveNerdtreePluginRun_out,0,100) . '...'
	    endif
    endif
  endif
endfunction

function! s:callback()
    try
        let path = g:NERDTreeFileNode.GetSelected().path.str({'escape': 1})
    catch
        return
    endtry
      unlet! g:ReceiveNerdtreePluginRun_error
      unlet! g:ReceiveNerdtreePluginRun_out
      call jobstart(path,{'on_stderr':'g:ReceiveNerdtreePluginRun','on_exit':'g:ReceiveNerdtreePluginRun','on_stdout':'g:ReceiveNerdtreePluginRun'})
endfunction

call NERDTreeAddKeyMap({
    \ 'callback': s:callback_name(),
    \ 'quickhelpText': 'run',
    \ 'key': 'Z',
    \ })
