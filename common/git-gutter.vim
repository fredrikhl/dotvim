"
" git-gutter settings
"

" always show the signcolumn
"
"   if exists('&signcolumn')  " Vim 7.4.2201
"     set signcolumn=yes
"   else
"     let g:gitgutter_sign_column_always = 1
"   endif


" git-gutter hilight groups:
"
"   GitGutterAdd
"   GitGutterChange
"   GitGutterDelete
"   GitGutterChangeDelete
"
"   GitGutterAddLine
"   GitGutterChangeLine
"   GitGutterDeleteLine
"   GitGutterChangeDeleteLine


" symbols for the signcolumn:
"
"   let g:gitgutter_sign_added = '+'
"   let g:gitgutter_sign_modified = '~'
"   let g:gitgutter_sign_removed = '-'
"   let g:gitgutter_sign_removed_first_line = '_'
"   let g:gitgutter_sign_modified_removed = '~_'


" diff base
"
" By default buffers are diffed against the index. However you can diff against
" any commit by setting:
"
"   let g:gitgutter_diff_base = '<commit SHA>'
"

" extra arguments for git diff
"   let g:gitgutter_diff_args = '-w'

" disable all key mappings
let g:gitgutter_map_keys = 0

" custom grep command
"   let g:gitgutter_grep_command = 'grep'

" turn off vim-gitgutter by default
let g:gitgutter_enabled = 0

" turn off signs by default
"   let g:gitgutter_signs = 0

" turn on line highlighting by default
"   let g:gitgutter_highlight_lines = 1

" turn off asynchronous updates
"   let g:gitgutter_async = 0
