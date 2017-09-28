"
" ctags config
"

"let g:ctags_path="/usr/bin/ctags"
let g:ctags_statusline=2
let g:genetate_tags=1
let g:ctags_regenerate=0

if ! ((exists('ctags_path') &&
            \ executable(g:ctags_path)) ||
            \ executable('ctags'))
    call PathogenDisable('ctags')
endif
