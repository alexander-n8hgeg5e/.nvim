set verbosefile=/tmp/v
"# this is nvim init file
"
"#### need funcs ####

let $c=$HOME . "/.config/nvim"
so $c/functions.vim

"##############   plugin config variables  #############################################
"                    0 <= time <  3   #    3 <= time <  7  #   7 <= time < 14   #   14 <= time < 18  #  18 <= time < 24
"let g:nowcolors ='    tesla             tender         simpleandfriendly_mod         clarity           paintbox  '
"let g:nowcolors =' tesla             tender         zarniwoop         clarity           paintbox '
let g:term_color  =  0
let g:term_2color =  0
let g:colorscheme = 'paintbox'
let g:vimwiki_list = [{'path': '~/.vimwiki/', 'path_html': '~/.vimwiki/'}]
let g:color_inverted  = 0 
let g:TerminalAutoGoIn = 1
" colorscheme notes:
"  terse: text reading contrast is nice at 9:30 am.
"            
"      daytime:           24-3                3-6                 6-9                        9-12                       12-15                    15-18                     18-21        21-24      
let g:nowcolors_dark   = 'wombat256mod        tender              vividchalk                 xorium                     paintbox                vividchalk                 xian         paintbox
\                         wombat256mod        tender              vividchalk                 xorium                     paintbox                vividchalk                 xorium       paintbox
\                         wombat256mod        tender              vividchalk                 xorium                     paintbox                vividchalk                 xorium       paintbox'   

"      daytime:            24-3                3-6              6-9                        9-12                    12-15                   15-18                   18-21        21-24      
let g:nowcolors_light  =  'summerfruit         summerfruit      eclipse                    summerfruit             peppers                 summerfruit             eclipse      fog           
\                          beauty              summerfruit      eclipse                    summerfruit             taqua                   summerfruit             newspaper    fog           
\                          beauty              summerfruit      eclipse                    summerfruit             peppers                 summerfruit             ironman      fog'

"      daytime:            24-3                3-6              6-9                       9-12                    12-15                   15-18                   18-21        21-24      
let g:nowcolors_daytime = 'chlordane           mud              tender                    summerfruit             chela_light             summerfruit             eclipse      fog           
\                          gemcolors           paintbox         terse                     thegoodluck             taqua                   tender                  newspaper    tender           
\                          darkeclipse         wombat256mod     colorful                  intellij                summerfruit             summerfruit             python       paintbox'
"      daytime_winter:             24-3                3-6              6-9                       9-12                    12-15                   15-18                 18-21          21-24      
let g:nowcolors_daytime_winter =  'astroboy            mud              tender                    summerfruit             chela_light             desert                darkeclipse    xorium
\                                  paintbox            3dglasses        terse                     thegoodluck             taqua                   tender                desertedocean  darkocean 
\                                  zephyr              wombat256mod     colorful                  intellij                summerfruit             paintbox              paintbox       xoria256m'
let g:mycolors_flavor  = 'dark'              
let $bg_color_flavor = g:mycolors_flavor
let g:nowcolors_flavor = 'daytime_winter'
let g:event_termdaytimecolor   =  0 " when new term is created , update the colorscheme according to daytime
let g:TerminalSpecialMovement  =  0
let g:term_active_colorscheme  = 'paintbox'
let g:term_inactiv_colorscheme = 'paintbox'
let g:option_terminal_buffhidden = 'unload'
let g:mode=0

"############# nvim config settings ######################################################
set runtimepath+=/usr/share/vim/vimfiles/
set synmaxcol=300
set termguicolors
"backup
exe "set undodir=" . expand("$HOME") . "/.vimundo"
exe "set backupdir=" . expand("$HOME") . "/.vimbackup"
set backupext=.vimbackup
let g:backupdir_unsaved= &backupdir . "/unsaved"
let $b=g:backupdir_unsaved
set writebackup
set backup
set autowriteall
set undolevels=1000000
set number
set undofile
set confirm
set mouse=a
set nowrap
set mousehide
set relativenumber
set number
set nohlsearch
set sessionoptions=globals,options,localoptions,blank,buffers,curdir,folds,help,tabpages,winsize
filetype plugin on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set completefunc=Complete_em_all
set completeopt=noinsert,menuone,preview
set complete=".,w,b,u,U,t,kspell"
set cpoptions=BesI_y
set showfulltag
set cscopetag
set clipboard=unnamedplus,unnamed
    let g:clipboard = {
          \   'name': 'clipster',
          \   'copy': {
          \      '+': 'clipster -c',
          \      '*': 'clipster -p',
          \    },
          \   'paste': {
          \      '+': 'clipster -c -o',
          \      '*': 'clipster -p -o',
          \   },
          \   'cache_enabled': 1,
          \ }
set ignorecase
set autoindent
set scrolljump=0
set nosmartindent 
set belloff=all
set eadirection=both
set cmdheight=4
set cmdwinheight=40
set equalalways
set shortmess=aAtT
set nomore
set splitright
set splitbelow
set noautochdir
set cursorline cursorcolumn
"terminal_double_keycode_timeout
set ttimeout
set ttimeoutlen=5
"double keypress mapping timeout
set timeout
set timeoutlen=300
"###########   netrw     #############
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
let g:netrw_hide = 1 



"#### some vars ####
let $f= $c . "/functions.vim"
let $i= $c . "/init.vim"
let $k= $c . "/keybinds.vim"
let $pch="/mnt/home/stud-uabir"

""""""""""""nerdtree
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

"yankring 
let g:yankring_window_height=30
let g:yankring_history_dir=  expand("$HOME") . "/.vim_yankring"
let g:yankring_clipboard_monitor=0
"let g:yankring_ignore_operator = 'g~ gu gU ! = gq g? > < zf g@ @'
"tmux and terminal vars
let g:tmux_socket_dir= "/tmp/tmux-" . trim(system("id -u"))
call system("mkdir -p " . tmux_socket_dir)
let g:tmux_socket= tmux_socket_dir . '/' . trim(system("hostname"))
"#####  modes setup #################################################################################
let    g:modes = [
                 \ "DefaultMode" ,
                 \ "TermMode",
                 \ "ExMode",
                 \ "Mutt",
                 \ "TermSpecialMovement",
                 \ "Netrw"
                 \]
"###### autocmd #####################################################################################
"
augroup a
autocmd!
autocmd VimEnter        *                            call VimEnter()
autocmd InsertEnter     *                            call Set_InsMode_ColorStyle()
autocmd InsertLeave     *                            call Set_NormMode_ColorStyle()
autocmd TextChangedI    *                            call Set_InsMode_ColorStyle()
autocmd TextChanged     *                            call Set_NormMode_ColorStyle()
autocmd BufWritePre     *                            call BufWritePre()
autocmd BufWritePost    *                            call BufWritePost()
autocmd BufWinEnter     [^{\[Unbenannt\]}]*          call SetTabName_(expand('%:t'))
autocmd DirChanged      *                            call DirChanged()
autocmd QuitPre         *                            call AuQuitPre()
augroup END

augroup NetrwOpenMultiTabGroup
   autocmd!
   autocmd Filetype netrw vnoremap <buffer> <expr> t ":call NetrwMultiMark(" . line(".") . "," . "v:count)\<CR>"
augroup END

"#### load stuff #####################################################################################


so $c/keybinds.vim
call Generate_funktion_Enter_Mutt_Term()
call Generate_funktion_EventTermEnter()
call Generate_funktion_MuttEnter()
call Generate_funktion_DoConfigDependentTerminalConfiguration()
call Generate_funktion_EventTermEscape()
call Generate_funktion_ConfDep_Event_TermWinEnter()
call Generate_funktion_MuttWinEnter()
call Generate_funktion_ConfDep_Event_TermWinLeave()
call Generate_funktion_MuttWinLeave()
call Generate_funktion_Create_Terminal_buffer()
call EnumerateModes( g:modes )
so $c/autostart.vim
so $c/commands.vim
so $c/insert_stuff.vim
call VimEnter()
