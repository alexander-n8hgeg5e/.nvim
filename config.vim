"############# nvim config settings ####################################################
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
"set cpoptions=aABceFs
set showfulltag
set cscopetag
set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
set clipboard=unnamedplus,unnamed
let g:clipboard = {
\   'name': 'c1',
\   'copy':  {
\      '+': 'xclip -i -selection secondary',
\      '*': 'xclip -i',
\            },
\   'paste': {
\      '+': 'xclip -o -selection secondary',
\      '*': 'xclip -o',
\            },
\   'cache_enabled': 1,
\ }
set ignorecase
set autoindent
set scrolljump=-5
set sidescroll=5
set sidescrolloff=5
set scrolloff=5
set nosmartindent 
set belloff=all
set eadirection=both
set cmdheight=4
set cmdwinheight=40
set equalalways
set shortmess=aAtT
set more
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
"############################################

"###############   color setup  #########################################################
" whether have seperate terminal color
let g:term_color  =  0
" whether have 2 seperate terminal colors, one aktiv term(insert mode) , one
" inactive term (not insert mode)
let g:term_2color =  0
" colorscheme if nothing else fancy is activated
let g:colorscheme = 'paintbox'
" color flavor used if nothing else is activated
let g:mycolors_flavor  = 'dark'
" fallback colorschemes in case terminal colorscheme is not compatible with
" terminal colors of the running terminal app. Need two of them.
let g:colorscheme_terminal_dark_fallback = 'paintbox'
let g:colorscheme_terminal_light_fallback = 'summerfruit'
" Inverted colors for some feature.
let g:color_inverted  = 0
let g:term_active_colorscheme  = 'paintbox'
let g:term_inactiv_colorscheme = 'paintbox'
" when new term is created , update the colorscheme according to daytime
let g:event_termdaytimecolor   =  1 
let g:nowcolors_flavor = 'daytime'
" setup time of dawn and dusk
let g:dawntime=6
let g:dusktime=20

" colorscheme notes:
"  terse: text reading contrast is nice at 9:30 am.
"            
"      daytime:           24-3       3-6           6-9             9-12          12-15           15-18            18-21           21-24      
let g:nowcolors_dark   = 'astroboy   mud           vividchalk      chlordane     paintbox       vividchalk        darkeclipse     xorium
\                         paintbox   3dglasses     vividchalk      gemcolors     paintbox       vividchalk        desertedocean   darkocean 
\                         zephyr     wombat256mod  vividchalk      darkeclipse   paintbox       vividchalk        paintbox        xoria256m'  

"      daytime:            24-3           3-6       6-9           9-12           12-15            15-18            18-21        21-24      
let g:nowcolors_light  =  'summerfruit    eclipse   summerfruit   summerfruit    thegoodluck      summerfruit      eclipse      fog           
\                          beauty         desert    terse         summerfruit    taqua            summerfruit      newspaper    fog           
\                          beauty         python    colorful      intellij       thegoodluck      summerfruit      ironman      fog'

"      daytime:            24-3                3-6              6-9         9-12             12-15             15-18             18-21        21-24      
let g:nowcolors_daytime = 'chlordane           mud              tender      summerfruit      chela_light       summerfruit       eclipse      fog           
\                          gemcolors           paintbox         terse       thegoodluck      taqua             tender            desert       tender           
\                          darkeclipse         wombat256mod     colorful    intellij         summerfruit       summerfruit       python       paintbox'

"      daytime_winter:             24-3         3-6            6-9          9-12           12-15           15-18        18-21          21-24      
let g:nowcolors_daytime_winter =  'astroboy     mud            tender       summerfruit    summerfruit     desert       darkeclipse    xorium
\                                  paintbox     3dglasses      terse        thegoodluck    taqua           tender       desertedocean  darkocean 
\                                  zephyr       wombat256mod   colorful     intellij       summerfruit     paintbox     paintbox       xoria256m'
"##########################################################################################
