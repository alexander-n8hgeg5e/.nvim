
if empty($daytime) == 0
    let s:daytime = $daytime
    let g:hour_color_flavor = s:daytime
elseif filereadable( $vd . "/daytimeconf.vim") == 1
    " 1 == True
    so $vcd/daytimeconf.vim
endif
