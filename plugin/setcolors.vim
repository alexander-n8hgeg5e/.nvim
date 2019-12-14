
if v:version < 700 || exists('loaded_setcolors') || &cp
  finish
endif

let loaded_setcolors = 1

function! s:SetColor(args)
" arg 'now' actually changes the current color scheme.
  if len(a:args) == 0
    echo 'current colorschems'
    let i = 0
    while i < len(g:mycolors)
      echo '  '.join(map(g:mycolors[i : i+4], 'printf("%-14s", v:val)'))
      let i += 5
    endwhile
  elseif a:args == 'all'
    let paths = split(globpath(&runtimepath, 'colors/*.vim'), "\n")
    let g:mycolors = map(paths, 'fnamemodify(v:val, ":t:r")')
    echo 'List of colorschems set from all installed ones'
  else
    let g:mycolors = split(a:args)
    echo 'List of colorschems set from arg (space separated names)'
  endif
endfunction

command! -nargs=* SetColors call s:SetColors('<args>')

function! s:NextColor(para, echo_color)
  if len(g:mycolors) == 0
    call s:SetColors('all')
  endif
  if exists('g:colors_name')
    let current = index(g:mycolors, g:colors_name)
  else
    let current = -1
  endif
  let missing = []
  for i in range(len(g:mycolors))
    if a:para == 0
      let current = localtime() % len(g:mycolors)
      let a:para = 1  " in case random color does not exist
    else
      let current += a:para
      if !(0 <= current && current < len(g:mycolors))
        let current = (a:para > 0 ? 0 : len(g:mycolors)-1)
      endif
    endif
    try
      execute 'colorscheme '.g:mycolors[current]
      break
    catch /E185:/
      call add(missing, g:mycolors[current])
    endtry
  endfor
  redraw
  if len(missing) > 0
    echo 'Error: colorscheme not found:' join(missing)
  endif
  if (a:echo_color)
    echo g:colors_name
  endif
endfunction

" uses colorscheme list and does next/prev/random  for para  1/-1/0
function! NextColor(para)
  silent! call s:NextColor(a:para, 1)
endfunction
