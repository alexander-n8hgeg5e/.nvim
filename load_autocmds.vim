augroup a
autocmd!
autocmd VimEnter        *                            call VimEnter()
autocmd InsertEnter     *                            call Set_InsMode_ColorStyle()
autocmd WinLeave        Netrw*                       call EventWinLeave()
autocmd InsertLeave     *                            call Set_NormMode_ColorStyle()
autocmd TextChangedI    *                            call Set_InsMode_ColorStyle()
autocmd TextChanged     *                            call Set_NormMode_ColorStyle()
autocmd BufWritePre     *                            call BufWritePre()
autocmd BufWritePost    *                            call BufWritePost()
autocmd BufWinEnter     [^{\[Unbenannt\]}]*          call SetTabName_(expand('%:t'))
autocmd DirChanged      *                            call DirChanged()
autocmd QuitPre         *                            call AuQuitPre()
augroup END

augroup NetrwOpenMultiTabGroup
   autocmd!
   autocmd Filetype netrw vnoremap <buffer> <expr> t ":call NetrwMultiMark(" . line(".") . "," . "v:count)\<CR>"
augroup END
