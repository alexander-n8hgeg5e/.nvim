"set verbosefile=/tmp/v
" this is nvim init file

"######  basic stuff ################################################################################
let $vcd=stdpath("config")
let $SHELL="fish"
let $f= $vcd . "/functions.vim"
let $i= $vcd . "/init.vim"
let $k= $vcd . "/keybinds.vim"
"so  $vcd/p.vim this is for gentoo prefix
let $C=$vcd . "/config.vim"
let $p=$vcd . "/plugin_config.vim"
"#################################
"
"###### load config to get settings#####################
so $vcd/config.vim
"#################

so $vcd/init_python.vim
"################################
"make id of this nvim
let g:nvim_id=substitute( split(v:servername,'[/]')[-2] , "nvim" ,"" ,"")
"################

"######  git history  ###############################################################################
if ! exists('g:prepared_nvim_git_history')
    let g:enable_nvim_git_history = 0
    if "empty"==system(['bash','-c','[[ ${disable_nvim_git_history} = "" ]]&&echo -n empty' ])
	    let job_id = jobstart(['prepare_nvim_git_history'])
        if job_id > 0
            if jobwait([job_id]) == [0]
	            let g:enable_nvim_git_history = 1
                let g:prepared_nvim_git_history = 1
            endif
        endif
    else
        let g:prepared_nvim_git_history = 1
    endif
endif
"########################################

"##############   plugin config variables  ##########################################################
let g:vimwiki_list = [{'path': '~/.vimwiki/', 'path_html': '~/.vimwiki/'}]
"#########################################################################
"
"#####  modes setup #################################################################################
let    g:modes = [
                 \ "DefaultMode" ,
                 \ "TermMode",
                 \ "ExMode",
                 \ "Mutt",
                 \ "TermSpecialMovement",
                 \ "Netrw",
                 \ "Nerdtree",
                 \]
let g:mode=0
let g:tmux_session_relations={}
"########################################

"#### load stuff #####################################################################################
call system(["rind", "clipster", "-d"])
so $vcd/plugin_config.vim
so $vcd/functions.vim
so $vcd/clipboard.vim
so $vcd/generate_functions.vim
so $vcd/keybinds.vim
so $vcd/load_autocmds.vim
call EnumerateModes( g:modes )
so $vcd/autostart.vim
so $vcd/commands.vim
so $vcd/insert_stuff.vim
so $vcd/patterns.vim

"######################
"###   init stuff   ###
"######################
so $vcd/init_daytime.vim
call VimEnter()
call Init_tmux_connection()
""##############################

" ### less important stuff in background ###
let s:py_varname=py3eval("pycode['load_and_run_python_script']['uses_vim_vars'][0]")
exe "let ". s:py_varname . " = '" . $vcd . "/gen_vimfiles.py'"
py3 pwp.run_pycode(pycode['load_and_run_python_script']['code'])
