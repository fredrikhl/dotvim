"
" Highlight lines that are too long
"


" Highlighted({hl})
"
" Test if the highlight group 'hl' exists and is not cleared
"   hl: The highlight group name
"   return: 1 if group is highlighted, 0 otherwise
function! Highlighted(hl)
    if !hlexists(a:hl)
        return 0
    endif
    redir => hlstatus
        exec "silent hi" a:hl
    redir END
    return (hlstatus !~ 'cleared')
endfunction


" ToggleOverLength()
"
" Toggle highlight of the hi-group 'OverLength'
" OverLength is a group of characters in lines longer than 'tw' or 80 chars
function! ToggleOverLength()
    if !hlexists('OverLength')
        hi OverLength None
    endif

    " Define match rule
    if Highlighted('OverLength')
        " Toggle off
        hi OverLength None
        echo 'Line length hilight off'
        return
    elseif &tw > 1
        let maxLen=&tw-1
    else
        let maxLen=80
    endif
    " Toggle on
    let regex='match Overlength /\%>'.maxLen.'v.\+/'
    exec regex
    echo 'Line length hilight after col ' . maxLen
    unlet maxLen regex
    " TODO: Make the hilight group configurable
    hi OverLength ctermbg=1 guibg=#592929
endfunction
