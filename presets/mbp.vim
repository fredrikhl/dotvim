let mapleader = "§"

let g:colorscheme = "xoria256"

" Local settings (paths, etc...)
function! s:update_colors()

    " IndentGuides
    " There's a bug in vim where ctermbg=234 sets background=light
    hi IndentGuidesOdd ctermfg=237 ctermbg=233
    hi IndentGuidesEven ctermfg=232 ctermbg=235

    " Better whitespace
    hi ExtraWhitespace ctermbg=236

    let g:colors_name = g:colors_name . '-custom'
endfunction

augroup custom_colors
    autocmd!
    autocmd ColorScheme * call s:update_colors()
augroup END
