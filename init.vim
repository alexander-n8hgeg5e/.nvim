"set verbosefile=/tmp/v
" this is nvim init file

"######  basic stuff ################################################################################
let $vcd=stdpath("config")
let $SHELL="fish"
let $f= $vcd . "/functions.vim"
let $i= $vcd . "/init.vim"
let $k= $vcd . "/keybinds.vim"
so  $vcd/p.vim
let $c=$vcd . "/config.vim"
let $p=$vcd . "/plugin_config.vim"
"###########################################

"##############   plugin config variables  ##########################################################
let g:vimwiki_list = [{'path': '~/.vimwiki/', 'path_html': '~/.vimwiki/'}]
"###########################################
"
"#####  modes setup #################################################################################
let    g:modes = [
                 \ "DefaultMode" ,
                 \ "TermMode",
                 \ "ExMode",
                 \ "Mutt",
                 \ "TermSpecialMovement",
                 \ "Netrw"
                 \]
let g:mode=0
"###########################################

"#### load stuff #####################################################################################
" load config
so $vcd/config.vim
so $vcd/plugin_config.vim
so $vcd/load_autocmds.vim
so $vcd/functions.vim
so $vcd/keybinds.vim
so $vcd/generate_functions.vim
call EnumerateModes( g:modes )
so $vcd/autostart.vim
so $vcd/commands.vim
so $vcd/insert_stuff.vim
call VimEnter()
"###########################################
