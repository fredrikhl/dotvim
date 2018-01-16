"
" undotree settings
"

" show relative age in short form ('1 d', not '1 day ago')
let g:undotree_ShortIndicators = 1

" show age in relative time
" let g:undotree_RelativeTimestamp = 1

" Window layout:
"
" 1: +------+-------+   2: +------+-------+
"    | tree |       |      | tree |       |
"    +------+       |      +------+-------+
"    | diff |       |      | diff         |
"    +------+-------+      +--------------+
"
" 3: +-------+------+   4: +-------+------+
"    |       | tree |      |       | tree |
"    |       +------+      +-------+------+
"    |       | diff |      |         diff |
"    +-------+------+      +--------------+
"
let g:undotree_WindowLayout = 1

" undotree window width
" if g:undotree_ShortIndicators == 1
"     let g:undotree_SplitWidth = 24
" else
"     let g:undotree_SplitWidth = 30
" endif

" diff window height
" let g:undotree_DiffpanelHeight = 10

" auto open diff window
" let g:undotree_DiffAutoOpen = 1

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
let g:undotree_SetFocusWhenToggle = 0

" tree node shape.
let g:undotree_TreeNodeShape = '*'

" let g:undotree_DiffCommand = "diff"


" Highlight changed text
" let g:undotree_HighlightChangedText = 1

" Highlight linked syntax type.
" let g:undotree_HighlightSyntaxAdd = "DiffAdd"
" let g:undotree_HighlightSyntaxChange = "DiffChange"

" Show help line
let g:undotree_HelpLine = 0
