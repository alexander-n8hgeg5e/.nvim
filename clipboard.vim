
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': { lines, regtype -> ClipboardWrite_p(lines,regtype) },
      \      '*': { lines, regtype -> ClipboardWrite_s(lines,regtype) },
      \    },
      \   'paste': {
      \      '+': { -> ClipboardRead_p()} ,
      \      '*': { -> ClipboardRead_s()} ,
      \   },
      \   'cache_enabled': 0,
      \ }
