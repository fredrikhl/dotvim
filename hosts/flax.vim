let mapleader = "|"
let g:slimv_leader = ","
let g:paredit_leader = ","

let g:colorscheme = "xoria256"
let g:airline_theme='molokai'


" do not use pylint
let g:syntastic_python_checkers = ['python', 'flake8']

" php: quiet tab warnings for files that uses tabs
let g:syntastic_php_phpcs_quiet_messages = { "regex": "Spaces must be used .*; tabs are not allowed" }


" custom colors / color fixes
function! s:update_colors()

    hi Pmenu      ctermfg=7 ctermbg=0
    hi PmenuSel   ctermfg=15 ctermbg=8

    " TODO: Keep the diff bg dark, and keep the fg?
    hi DiffAdd    term=bold ctermfg=234 ctermbg=151 guifg=bg guibg=#afdfaf
    hi DiffChange term=bold ctermfg=234 ctermbg=181 guifg=bg guibg=#dfafaf
    hi DiffDelete term=bold ctermfg=234 ctermbg=246 guifg=bg guibg=#949494
    hi DiffText   term=reverse ctermfg=234 ctermbg=174 guifg=bg guibg=#df8787

    " IndentGuides
    " Setting ctermbg=234 sets background=light in some versions of vim
    hi IndentGuidesOdd ctermfg=237 ctermbg=233
    hi IndentGuidesEven ctermfg=239 ctermbg=235

    " Better whitespace
    hi ExtraWhitespace ctermfg=239 ctermbg=236

    " spelling
    hi SpellBad   term=underline cterm=underline ctermfg=LightRed
    hi SpellCap   term=underline cterm=underline ctermfg=Yellow
    hi SpellRare  term=underline cterm=underline
    hi SpellLocal term=underline cterm=underline

    if ! exists('g:colors_name')
        " incidate that no theme was set?
        let g:colors_name = '<none>'
    endif
    let g:colors_name = g:colors_name . '-custom'
endfunction

augroup custom_colors
    autocmd!
    autocmd ColorScheme * call s:update_colors()
augroup END
