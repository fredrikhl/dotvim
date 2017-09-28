"
" Highlight lines that are too long
"

hi OverLength ctermfg=bg ctermbg=1 guibg=#592929

function! ToggleOverLength()
    if exists("g:overlength_match_id")
        echo "Line highlight cleared (id=" . g:overlength_match_id . ")"
        silent! call matchdelete(g:overlength_match_id)
        unlet g:overlength_match_id
    else
        let maxlen=80
        if &tw > 1
            let maxlen=&tw-1
        endif
        let g:overlength_match_id = matchadd('OverLength', '\%>'.maxlen.'v.\+', 100)
        echo "Line length highlight after col" maxlen "(id=" . g:overlength_match_id . ")"
    endif
endfunction
