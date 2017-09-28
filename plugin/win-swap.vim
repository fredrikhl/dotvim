"
" Functions for swapping windows
"

" Mark a window for swapping
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

" Swap window with marked window
function! DoWindowSwap()
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exec g:markedWinNum . "wincmd w"
    let markedBuf = bufnr( "%" )
    exec 'hide buf' curBuf
    exec curNum . "wincmd w"
    exec 'hide buf' markedBuf
endfunction
