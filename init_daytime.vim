
let s:daytime=system(['fish','-d1','-c','echo -n $daytime'])

let s:daytime = substitute( s:daytime, '\v(^bind.*\n)|(\n)' , "" ,"g" )

if  ! empty(s:daytime) > 0
    let g:hour_color_flavor = s:daytime
elseif filereadable("daytimeconf.vim") == 0
    so $vcd/daytimeconf.vim
endif
