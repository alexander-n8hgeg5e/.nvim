" Maintainer:          Anmol Sethi <anmol@aubble.com>
" Previous Maintainer: SungHyun Nam <goweol@gmail.com>

if exists('b:did_ftplugin') || &filetype !=# 'man'
  finish
endif
let b:did_ftplugin = 1

" win local opts
setlocal linebreak
setlocal wrap
setlocal wrapmargin=2
setlocal textwidth=0
setlocal nobreakindent
setlocal breakindentopt=min:20,shift:0
" hide showbreak chars that a global option
hi NonText guifg=bg guibg=bg
augroup man
au!
au BufWinLeave <buffer> hi clear NonText
augroup END

let s:pager = get(s:, 'pager', 0) || !exists('b:man_sect')

if s:pager
  call man#init_pager()
endif

setlocal noswapfile buftype=nofile bufhidden=hide
setlocal nomodified readonly nomodifiable
setlocal noexpandtab tabstop=8 softtabstop=8 shiftwidth=8

setlocal nonumber norelativenumber
setlocal foldcolumn=0 colorcolumn=0 nolist nofoldenable

if !exists('g:no_plugin_maps') && !exists('g:no_man_maps')
  nnoremap <silent> <buffer> gO         :call man#show_toc()<CR>
  nnoremap <silent> <buffer> <C-]>      :Man<CR>
  nnoremap <silent> <buffer> <space>    :Man<CR>
  nnoremap <silent> <buffer> <C-T>      :call man#pop_tag()<CR>
  if 1 == bufnr('%') || s:pager
    nnoremap <silent> <buffer> <nowait> q :lclose<CR>:q<CR>
  else
    nnoremap <silent> <buffer> <nowait> q :lclose<CR><C-W>c
  endif
endif

if get(g:, 'ft_man_folding_enable', 0)
  setlocal foldenable
  setlocal foldmethod=indent
  setlocal foldnestmax=1
endif

let b:undo_ftplugin = ''
" vim: set sw=2:
