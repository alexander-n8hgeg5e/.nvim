function! Autostart()
  call feedkeys("\<C-t>","t")
  call feedkeys("\<C-Down>","t")
  call feedkeys("\<A-f>","t")
  call termopen('bash')
  call feedkeys("i","t")
  "silent! call termopen('m')
  "call SetTabName_('Mutt')
  "tabnew
  "call feedkeys(":Calendar\<CR>t\<Space>:NERDTree ~/PIM/0_todo\<CR>:vertical resize 40:\<CR>")
  "call feedkeys("\<C-Down>\<C-t>\<Esc>","t")
endfunction
