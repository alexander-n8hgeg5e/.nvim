" Maintainer:          Anmol Sethi <anmol@aubble.com>
" Previous Maintainer: SungHyun Nam <goweol@gmail.com>

if exists('b:did_ftplugin') || &filetype !=# 'man'
  finish
endif
let b:did_ftplugin = 1

let s:pager = get(s:, 'pager', 0) || !exists('b:man_sect')

if s:pager
  call man#init_pager()
endif

setlocal noswapfile buftype=nofile bufhidden=hide
setlocal nomodified readonly nomodifiable
setlocal noexpandtab tabstop=8 softtabstop=8 shiftwidth=8
setlocal wrap breakindent linebreak

setlocal nonumber norelativenumber
setlocal foldcolumn=0 colorcolumn=0 nolist nofoldenable

if !exists('g:no_plugin_maps') && !exists('g:no_man_maps')
  nnoremap <silent> <buffer> <Space>    :call man#show_toc()<CR>
  "nnoremap <silent> <buffer> <Space>    :call man#pop_tag()<CR>
  nnoremap <silent> <buffer> <CR>       :Man<CR>
endif

if get(g:, 'ft_man_folding_enable', 0)
  setlocal foldenable
  setlocal foldmethod=indent
  setlocal foldnestmax=1
endif

let b:undo_ftplugin = ''
" vim: set sw=2:
