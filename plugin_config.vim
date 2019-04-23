let g:TerminalSpecialMovement  =  0
let g:option_terminal_buffhidden = 'unload'
let g:TerminalAutoGoIn = 1

"###########   netrw  ##################################################################
let g:netrw_cursor=0
let g:netrw_banner=0
let g:netrw_browse_split=2
let g:netrw_winsize   = 30
let g:netrw_preview   = 1
let g:netrw_altv=1
let g:netrw_alto=1
let g:netrw_liststyle=3
let g:netrw_winsize=0
let g:netrw_compress          = 'xz'
let g:netrw_fastbrowse        = 2
let g:netrw_winsize           = 20
let g:netrw_hide      =1
let g:netrw_keepdir   =1 
let g:netrw_sort_sequence='\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'
"####################################

"#####  yankring config  ###############################################################
let g:yankring_window_height=30
let g:yankring_history_dir=  expand("$HOME") . "/.vim_yankring"
let g:yankring_clipboard_monitor=0
"let g:yankring_ignore_operator = 'g~ gu gU ! = gq g? > < zf g@ @'
"tmux and terminal vars
let g:tmux_socket_dir= "/tmp/tmux-" . trim(system("id -u"))
call system("mkdir -p " . tmux_socket_dir)
let g:tmux_socket= tmux_socket_dir . '/' . trim(system("hostname"))
"#######################################################################################

"####  nerdtree config  ################################################################
let g:NERDTreeMapOpenExpl=''
let g:NERDTreeMapToggleHidden=','
let g:NERDTreeMapQuit='-'
let g:NERDTreeMinimalUI=1
let g:nerdtree_plugin_open_cmd = 'rind pyopen'
let g:nerdtree_plugin_mail_attach_cmd = $HOME . '/code/shortcuts/mail_attach_mutt_nvim'
let g:NERDTreeSortOrder = []
let g:NERDTreeMapJumpNextSibling =""
let g:NERDTreeIgnore= []
let NERDTreeShowHidden=0
let g:NERDTreeHijackNetrw=0
let g:NERDTreeBookmarksFile= $HOME . "/.config/nvim/NERDTreeBookmark"
let g:NERDTreeShowBookmarks=1
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeWinSize=35
"####################################
