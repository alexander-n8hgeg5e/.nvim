"######## command definitions ##############################################################################################
"
command! M call OpenMail
command! -complete=command UnloadHidden  :call UnloadHiddenBuffers()
command! -nargs=+ -complete=command R let @r=""|redir @r | execute <q-args> | redir END | new | put r
"command! -nargs=+ -complete=command Redir let s:reg = @@ | redir @"> | execute <q-args> | redir END
command! -complete=command C call calendar#show(1)<CR>

command! -nargs=+ -complete=cscope Cscopefind call Cscopefind(<f-args>)

" Insert a newline after each specified string (or before if use '!').
" If no arguments, use previous search.
command! -bang -nargs=* -range LineBreakAt <line1>,<line2>call LineBreakAt('<bang>', <f-args>)


command! -complete=command PutColo let @u = execute('colorscheme') | let @u = substitute(@u,'\W','','g') | normal "up
command! -complete=command Write2Colodir if !exists(expand("%:t"))|exe 'w ' . $c . "/colors/" . expand("%:t")|else| echoe "error already exists"|endif
command! -complete=command Write2ColodirAndSourceit if !exists(expand("%:t"))|let file = $c . "/colors/" . expand("%:t")|exe "w" file|exe 'source' file|else| echoe "error already exists"|endif|so 

command! SW SudoWrite<bang> <args>
command! SR SudoRead<bang> <args>

command! -nargs=* G call Goo("<args>")
command! -nargs=* D call DDG("<args>")

command! -nargs=* T call g:Create_Terminal_buffer("<args>")

command! -nargs=* M Man <args> | only

command! -nargs=0 Id so $vcd/init_daytime.vim
command! -nargs=0 Dl call system(['fish', '-c', 'set -U daytime light']) | so $vcd/init_daytime.vim | call Init_Common_Color()
command! -nargs=0 Dd call system(['fish', '-c', 'set -U daytime dark']) | so $vcd/init_daytime.vim | call Init_Common_Color()
command! -nargs=0 Dt call system(['fish', '-c', 'set -U daytime daytime']) | so $vcd/init_daytime.vim | call Init_Common_Color()
command! -nargs=+ -complete=file W call g:Create_Terminal_buffer("w3m <args>")

command! -nargs=+ Tn call SetTabName('<args>')
command! Tno call RemoveTabName()

command! Cr call NextColor(0)
command! Cn call NextColor(1)
command! Cp call NextColor(-1)

command! I so $i

command! Grr exe "%!grr " . expand("%:h")
command! Pla call nvim_put(["set -x NVIM_LISTEN_ADDRESS ". v:servername],'c',1,1)
command! X  exe "r! xclip -o -selection primary"
command! XX exe "r! xclip -o -selection clipboard"
