"######## command definitions ##############################################################################################
"
command! M call OpenMail
command! -complete=command UnloadHidden  :call UnloadHiddenBuffers()
command! -nargs=+ -complete=command Redir let @r=""|redir @r | execute <q-args> | redir END | new | put r
"command! -nargs=+ -complete=command Redir let s:reg = @@ | redir @"> | execute <q-args> | redir END
command! -complete=command C call calendar#show(1)<CR>

command! -nargs=+ -complete=cscope Cscopefind call Cscopefind(<f-args>)

" Insert a newline after each specified string (or before if use '!').
" If no arguments, use previous search.
command! -bang -nargs=* -range LineBreakAt <line1>,<line2>call LineBreakAt('<bang>', <f-args>)


command! -complete=command PutColo let @u = execute('colorscheme') | let @u = substitute(@u,'\W','','g') | normal "up
command! -complete=command Write2Colodir if !exists(expand("%:t"))|exe 'w ' . $c . "/colors/" . expand("%:t")|else| echoe "error already exists"|endif
command! -complete=command Write2ColodirAndSourceit if !exists(expand("%:t"))|let file = $c . "/colors/" . expand("%:t")|exe "w" file|exe 'source' file|else| echoe "error already exists"|endif|so 
