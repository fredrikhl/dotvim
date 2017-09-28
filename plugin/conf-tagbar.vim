"
" tagbar settings
"

if exists('ctags_path')
    let g:tagbar_ctags_bin=g:ctags_path
endif

let g:tagbar_left=1
let g:tagbar_autofocus=1
let g:tagbar_autoclose=1
let g:tagbar_sort=0
let g:tagbar_compact=1
let g:tagbar_indent=4

if executable('rst2ctags')
    let g:tagbar_type_rst = {
        \ 'ctagstype': 'RST',
        \ 'ctagsbin': 'rst2ctags',
        \ 'ctagsargs' : '-f - --sort=yes',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }
endif

if executable('markdown2ctags')
    let g:tagbar_type_markdown = {
        \ 'ctagstype': 'markdown',
        \ 'ctagsbin' : 'markdown2ctags',
        \ 'ctagsargs' : '-f - --sort=yes',
        \ 'kinds' : [
            \ 's:sections',
            \ 'i:images'
        \ ],
        \ 'sro' : '|',
        \ 'kind2scope' : {
            \ 's' : 'section',
        \ },
        \ 'sort': 0,
    \ }
endif
