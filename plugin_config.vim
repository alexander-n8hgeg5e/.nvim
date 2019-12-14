"##### Man
let g:hardwrap=1
"let g:no_plugin_maps=1
"###########   netrw  ##################################################################
let g:netrw_cursor=0
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize=30
let g:netrw_preview=1
let g:netrw_altv=1
let g:netrw_alto=1
let g:netrw_liststyle=3
let g:netrw_compress='xz'
let g:netrw_fastbrowse=2
let g:netrw_hide=1
let g:netrw_use_errorwindow=0
let g:netrw_keepdir=1 
let g:netrw_sort_sequence='\<core\%(\.\d\+\)\=,\.[a-np-z]$,\.h$,\.c$,\.cpp$,*,\.o$,\.obj$,\.info$,\.swp$,\.bak$,\~$'
"####################################

"#####  yankring config  ###############################################################
let g:yankring_window_height=30
let g:yankring_history_dir=  expand("$HOME") . "/.vim_yankring"
let g:yankring_clipboard_monitor=1
"let g:yankring_ignore_operator = 'g~ gu gU ! = gq g? > < zf g@ @'
let g:yankring_record_insert = 1
let g:yankring_window_use_horiz = 0  " Use vertical split
let g:yankring_window_width = 30
let g:yankring_window_height = 8
let g:yankring_window_use_bottom = 1
let g:yankring_window_use_right = 1
let g:yankring_window_increment = 50
let g:yankring_manual_clipboard_check = 0
let  g:yankring_default_menu_mode = 3
let  g:yankring_menu_priority = 30
let g:yankring_record_insert = 1
let g:yankring_window_auto_close = 1
let g:yankring_max_display = 70
let g:yankring_max_history = 100
"#######################################################################################

"####  nerdtree config  ################################################################
let g:NERDTreeMinimalUI=1
let g:nerdtree_plugin_open_cmd = 'rind pyopen'
let g:nerdtree_plugin_mail_attach_cmd = $HOME . '/code/shortcuts/mail_attach_mutt_nvim'
let g:NERDTreeSortOrder = []

let g:NERDTreeMapToggleHidden='h'
let g:NERDTreeMapQuit='-'
let g:NERDTreeMapJumpNextSibling =""
let g:NERDTreeMapCWD="C"
let g:NERDTreeMapActivateNode="<CR>"
let g:NERDTreeMapPreview="<Space>"
let g:NERDTreeMapOpenExpl="<S-e>"
let g:NERDTreeMapOpenSplit="<S-i>"

let g:NERDTreeIgnore= []
let g:NERDTreeShowHidden=0
let g:NERDTreeHijackNetrw=1
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

"####### colorizer ########
let g:colorizer_textchangedi = 0


