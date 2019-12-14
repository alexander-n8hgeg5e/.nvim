
let g:clipboard = {
      \   'name': 'myClipboard',
      \   'copy': {
      \      '+': { lines, regtype -> ClipboardWrite(lines,regtype) },
      \      '*': { lines, regtype -> ClipboardWrite(lines,regtype) },
      \    },
      \   'paste': {
      \      '+': { -> ClipboardRead()} ,
      \      '*': { -> ClipboardRead()} ,
      \   },
      \   'cache_enabled': 0,
      \ }
