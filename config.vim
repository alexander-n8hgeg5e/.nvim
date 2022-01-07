"############# nvim config settings ####################################################
if "empty"==system(['bash','-c','[[ ${EPREFIX} = "" ]]&&echo -n empty' ])
    set runtimepath+=/usr/share/vim/vimfiles
else
    set runtimepath+=${EPREFIX}/usr/share/vim/vimfiles
endif
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
set undofile
set shada=!,%,'100000,/100000,:100000,@100000,s10000
set updatetime=20000
set hidden

set confirm
set mouse=a
set nowrap
set linebreak
set wrapmargin=0
set textwidth=0
set breakat=\ ^I!@*-+;:,./?
set breakindent
set showbreak="># wrap #>"
let s:minimum=len(&showbreak)+20
exe "set breakindentopt=min:".s:minimum.",shift:25"
set mouse=""

set conceallevel=1
set listchars=tab:┈\ ,trail:…,nbsp:˽,conceal:․,extends:→,precedes:←,eol:↙
" … ‥ ․ . ⣀  ← →
" tab/indent/space settings
set smarttab
set expandtab
let g:python_recommended_style=1
set tabstop=4
set shiftwidth=4
set virtualedit=all

function! Status_line_modified()
    if &modified
        return "                                             "
    endif
    return ""
endfunction
function! Status_line_not_modified()
    if ! &modified
        return " "
    endif
    return ""
endfunction

set statusline=%<%f\ %h%=%#Error#%{Status_line_modified()}%#PMenuSel#%{Status_line_not_modified()}%*%r%=%-14.(%l,%c%V%)\ %P
set laststatus=2
set helpheight=100 
set mousehide
set relativenumber
set number
set nohlsearch
set sessionoptions=globals,options,localoptions,blank,buffers,curdir,folds,help,tabpages,winsize

" folding
set foldmethod=indent
set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set foldclose=
set fillchars=fold:\ 
set foldnestmax=1
set foldminlines=1
set foldignore=''
set foldlevelstart=99
set foldmarker={{{,}}}
set foldtext=Foldtext()
set foldcolumn=0

set diffopt=internal,filler,vertical,indent-heuristic,algorithm:histogram

filetype plugin on
filetype plugin indent on
set synmaxcol=400
"set completefunc=Smart_TabComplete
set completeopt=noinsert,menuone,preview
set complete=.,w,b,u,U,t,kspell
set cpoptions=
set iskeyword=a-z,A-Z,48-57,_,-
set keywordprg="man -s"
set showfulltag
set cscopetag
set nocscoperelative
set cscopepathcomp=2
set cscopetagorder=1
"set cscopequickfix=s+,c+,d+,i+,t+,e+,a+
"set cscopequickfix=s-,c-,d-,i-,t-,e-,a-
set cscopequickfix=

"let pat_fname='\v^.*(\s|\W|^)(([/]?(\w|(\$[{]?\w+[}]?)|[~]?|[.-]))+)(\W|\s|$).*$'
let pat_fname='\v^.*(\s|[^-0-9a-zA-Z/.~{}]|^)(([/]?(\w|\d|(\$[{]?\w+[}]?)|[-~.]))+).*$'
"let pat_fname=escape(pat_fname," \"'|\\")
"let includeexpr='substitute(getline("."),"'. pat_fname .'","\\2", "",)'
"let includeexpr=escape(includeexpr," \"'|\\")
"exe "set includeexpr=".includeexpr
set isfname=@,48-57,/,.,-,_,+,$,~,{,}
set includeexpr=Find_file_for_includeexpr()
set clipboard=unnamedplus,unnamed

set lazyredraw
set ignorecase
set autoindent
set scrolloff=2
set scrolljump=5
let g:sidescroll=5
let g:sidescrolloff=15
set nosmartindent 
set belloff=all
set eadirection=both
set cmdheight=2
set cmdwinheight=40
set noequalalways
set shortmess=aAtT
set more
set splitright
set splitbelow
set noautochdir
"set cursorline cursorcolumn

"###  timeouts ###
set ttimeout
set ttimeoutlen=5
set timeout
set timeoutlen=500
"#################

"let g:ft_ignore_pat = '\.\(Z\|gz\|bz2\|zip\|tgz\)$'
"let g:ft_ignore_pat = '.*'
"############################################

"###  terminal
"####################################################################
let g:TerminalSpecialMovement  =  0
let g:option_terminal_buffhidden = 'unload'
let g:TerminalAutoGoIn = 1
let g:last_complete=0
"tmux and terminal vars
let g:tmux_socket_dir= "/tmp/tmux-" . trim(system(["id","-u"]))
call system(["mkdir", "-p", tmux_socket_dir ])
let g:tmux_socket= tmux_socket_dir . '/' . trim(system(["hostname"])) . "_1"
"######################

"##########################################################
"##############    color setup   ##########################
"##########################################################
" #########################
" ##  general behaviour  ##
" #########################
" whether have seperate terminal color
let g:term_color  =  0
" whether have 2 seperate terminal colors, one aktiv term(insert mode) , one
" inactive term (not insert mode)
let g:term_2color =  0
" colorscheme if nothing else fancy is activated
let g:colorscheme = 'paintbox'

" fallback colorschemes in case terminal colorscheme is not compatible with
" terminal colors of the running terminal app. Need two of them.
let g:colorscheme_terminal_dark_fallback = 'paintbox'
let g:colorscheme_terminal_light_fallback = 'summerfruit'
" Inverted colors for some feature.
let g:color_inverted  = 0
let g:term_active_colorscheme  = 'prmths'
let g:term_inactiv_colorscheme = 'thegoodluck'

" when new term is created and g:event_termdaytimecolor is set
" update following colorschemes:
"  g:term_inactiv_colorscheme
"  g:colorscheme
"  g:colorscheme_terminal_light_fallback
"  g:colorscheme_terminal_dark_fallback
"  additional if is set term color in set 
"  in g:term_inactive_colorscheme is no longer static
let g:event_termdaytimecolor   =  1

" #######################
" ##  color selection  ##
" #######################
" options_g:mycolors_flavor = ['daytime','hour_colors']
let g:mycolors_flavor        =  'hour_colors'
" let options_mycolors_default_file_flavor = Color_get_available_mycolor_flavors()
let g:mycolors_default_file_flavor   =  'medium_dark'
" let options_hour_color_flavor = Color_get_available_mycolor_flavors()
let g:hour_color_flavor = 'daytime'

" #############################
" ##  hourcolor time options  ##
" #############################
let g:wait_for_light=1          " time to delay the start of the day
let g:wait_for_dark_night=3     " time to delay the start of the darker night during the night
let g:no_bright_light_morning=1.5   " at morning delay the really bright setting by this time
let g:no_bright_light_evening=1.5   " have a transition from bright light to just light
let g:preempt_dawn=2        " time to preempt the dawn (earlier medium dark )
let g:preempt_dusk=1        " time to preempt the dusk with medium dark
let g:coords={"latitude" : 49, "longitude" : 8.375 }


" colorscheme notes:
"  terse: text reading contrast is nice at 9:30 am.
"  accidentially triggered colorschemes that looked attractive: smp 
"            
"      bright light:                    24-3           3-6          6-9           9-12           12-15            15-18            18-21        21-24
let g:hour_colors_bright_light =       'summerfruit    eclipse      summerfruit   mickeysoft     thegoodluck      tango-morning    eclipse      fog
\                                       beauty         PapayaWhip   terse         summerfruit    habiLight        scite            newspaper    fog
\                                       PapayaWhip     PapayaWhip   colorful      tcsoft         mellow           mellow           ironman      fog'

"      light:                           24-3           3-6          6-9           9-12           12-15            15-18            18-21        21-24
let g:hour_colors_light =              'fog            codepaper    biogoo        nuvola         thegoodluck      tango-morning    carrot       fog
\                                       habiLight      clarity      terse         codepaper      habiLight        MountainDew      newspaper    fog
\                                       PapayaWhip     PapayaWhip   colorful      intellij       thegoodluck      scite            ironman      fog'

"      medium dark:                    24-3       3-6           6-9             9-12          12-15           15-18            18-21           21-24
let g:hour_colors_medium_dark  =      'mdark      mushroom      vividchalk      chlordane     cobaltish      evening           wuye            xorium
\                                      atom       3dglasses     native          wolfpack      psclone        symfony           desertedocean   darkocean
\                                      wolfpack   wombat256mod  bluecloud       darkeclipse   atom           asu1dark          tabula          xoria256m'

"      dark:                           24-3       3-6           6-9             9-12          12-15           15-18            18-21           21-24
let g:hour_colors_dark   =            'fnaqevan   mushroom      vividchalk      chlordane     paintbox       vividchalk        darkeclipse     xorium
\                                      nature     3dglasses     oceandeep       wolfpack      camo           wintersday        desertedocean   darkocean
\                                      wolfpack   wombat256mod  mdark           darkeclipse   paintbox       vividchalk        paintbox        xoria256m'

"      dark:                           24-3       3-6           6-9             9-12          12-15           15-18            18-21           21-24
let g:hour_colors_dark2  =            'forneus    mushroom      baobaozhu       chlordane     paintbox       vividchalk        darkeclipse     xorium
\                                      deveiate   3dglasses     oceandeep       wolfpack      camo           wintersday        desertedocean   darkocean
\                                      asu1dark   wombat256mod  mdark           darkeclipse   paintbox       vividchalk        paintbox        xoria256m'

let g:hour_colors_dark=g:hour_colors_dark2
"##########################################################################################
