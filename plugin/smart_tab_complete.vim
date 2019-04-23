function! Smart_TabComplete()
"  inoremap <CR> <C-r>=Smart_TabComplete_ResetKeys()<CR><CR>
"  inoremap <Esc> <C-r>=Smart_TabComplete_ResetKeys()<CR><Esc>
"  inoremap <C-c> <C-c><C-r>=Smart_TabComplete_ResetKeys()<CR><C-c>
"  inoremap <Space> <Space><C-r>=Smart_TabComplete_ResetKeys()<CR>
"  inoremap <tab> <C-r>=Smart_TabComplete_ResetKeys()<CR><Esc>a

  let line = getline('.')                         " current line
  let lline = strpart(line, -1, col('.'))      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let lword = matchstr(lline, "[^ \t]*$")       " word till cursor
  let lword_ = substitute( lword , '/' ,  '\/' ,"g")
  let lword_noquotes = matchstr(lline, '\v[^ ''"\t]*$')       " word till cursor
  let lword_noquotes = substitute( lword_noquotes , '/' ,  '\/' ,"g")

  if (strlen(lline)==0)                          " nothing to match on empty string
    "call Smart_TabComplete_ResetKeys()
    return "\<tab>"
  endif

  let word_has_period = match(lword, '\.') != -1
  let word_has_slash = match(lword, '\/') != -1
  let word_has_colon = match(lword, ':') != -1
  let word_has_cmd = match(lword, '\v(let|map|call|silent)[ ]')  != -1
  let insidequote =  match(line, '\v["''][^"'']*\V' . lword_noquotes ) != -1
  let insideparen =  match(line, '\v[(][^)]*\V'.lword_noquotes ) != -1
  if (0)
      call nonexistent()

  elseif ( word_has_slash )
    return "\<C-X>\<C-F>"                         " file

  elseif ( !insidequote && !insideparen && word_has_cmd && word_has_colon )
    return "\<C-X>\<C-V>"                         " commandline

  elseif (!word_has_period)
    return "\<C-X>\<C-P>"                         " existing text

  else
    return "\<C-X>\<C-O>"                         " omni/plugin

  endif

endfunction


function! Smart_TabComplete_ResetKeys()
  inoremap <tab> <C-r>=Smart_TabComplete()<CR>
  inoremap <CR> <CR>
  return ""
endfunction
