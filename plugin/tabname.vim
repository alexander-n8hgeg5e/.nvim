" File: tab_name.vim
" Author: Nickolay Golubev
" Email: golubev.nikolay@gmail.com
" Description: script allow set names for tab pages ( "Call stack", "Help tab", "Broswser" for example ). Useful for console tab mode
" Usage:
"   :Tn 'tabname' - set name for current tab page
"   :TNoName - remove name (page name = buffer name)


let tab_name_plugin = 1

function! SetTabName(name)
    let t:tab_name = a:name
    call s:RefreshTab()
endfunction

function! RemoveTabName()
    unlet t:tab_name
    call s:RefreshTab()
endfunction

function! s:RefreshTab()
    set tabline=%!TabCaptionLineFunction()
	set guitablabel=%{TabGuiCaptionLabel()}
endfunction

function! TabCaptionLabel(number)
    let caption = ''
    let tab_name = gettabvar(a:number,'tab_name') 
    if tab_name == ''
        let buflist = tabpagebuflist(a:number)
        let winnr = tabpagewinnr(a:number)
	    let buf_name = bufname(buflist[winnr - 1])
        if len(buf_name) < 1
            let caption .= " "
        else
            let caption .= pathshorten(buf_name)
        endif
    else
        let caption .= gettabvar(a:number,'tab_name') 
    endif
    return caption
endfunction


function! TabCaptionLineFunction()
    let line = ''
    for i in range(tabpagenr('$'))

        let modified_part0 = ''
        let modified_part1 = '%* '
        let bufnrlist = tabpagebuflist(i+1)
        for bufnr in bufnrlist
            if getbufvar(bufnr, "&modified")
                let modified_part0 = '%#Error#+'
                let modified_part1 = ''
                break
            endif
        endfor

        let caption = '['.(i+1).']'.modified_part0
        let line .= '%#String#'.caption
        " select the highlighting
        if i + 1 == tabpagenr()
            let line .= '%#TabLineSel#'
        else
            let line .= '%#TabLine#'
        endif

        let line .= '%' . (i + 1) . 'T'

        let line .= TabCaptionLabel(i + 1)
        let line .= modified_part1


    endfor

    let line .= '%#TabLineFill#%T'

    return line
endfunction

function! TabGuiCaptionLabel()
    let caption = '['
    let tab_number = v:lnum
    let bufnrlist = tabpagebuflist(tab_number)
    let tab_name = gettabwinvar(tab_number, 1, 'tab_win_name') 

    let caption .= tab_number

    for bufnr in bufnrlist
        if getbufvar(bufnr, "&modified")
            let caption .= '+'
            break
        endif
    endfor

    let caption .= '] '

    let winnr = tabpagewinnr(tab_number)
	let buf_name = bufname(bufnrlist[winnr - 1])
    if tab_name == ''
        let caption .= pathshorten(buf_name)
    else
        let caption .= tab_name
    endif

    return caption
endfunction


call s:RefreshTab()








