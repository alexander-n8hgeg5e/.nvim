augroup a
autocmd!
autocmd VimEnter        *                            call VimEnter()
autocmd InsertEnter     *                            call Set_InsMode_ColorStyle()
autocmd InsertLeave     *                            call Set_NormMode_ColorStyle()
autocmd BufWinEnter     *                            call BufAdd(expand("<abuf>"))
autocmd BufWinEnter     *                            exe "if &buftype == 'help'| only | endif"
autocmd TextChangedI    *                            call TextChangedI()
autocmd TextChanged     *                            call TextChanged()
autocmd BufWritePre     *                            call BufWritePre()
autocmd BufWritePost    *                            call BufWritePost()
autocmd BufWinEnter     [^{\[Unbenannt\]}]*          call SetTabName_(expand('%:t'))
autocmd DirChanged      *                            call DirChanged()
autocmd QuitPre         *                            call AuQuitPre()
autocmd CompleteDone    *                            call CompleteDone()
autocmd BufEnter        *                            call InitSmartTabCompleteBufferVars()
augroup END
