"
" taglist settings
"

if exists('ctags_path')
    let Tlist_Ctags_Cmd=g:ctags_path
endif

let Tlist_Inc_Winwidth=0

if ! ((exists('Tlist_Ctags_Cmd') &&
            \ executable(g:Tlist_Ctags_Cmd)) ||
            \ executable('ctags'))
    call PathogenDisable('taglist')
endif
