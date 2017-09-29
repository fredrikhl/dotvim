"
" myrsnipa.uio.no config
"

" Leader, different vim, different keyboard
let mapleader = "|"
let g:slimv_leader = ","
let g:paredit_leader = ","

" basic settings
set listchars=tab:⇥\ ,

" custom colors / color fixes
function! s:update_colors()
    hi Normal     ctermbg=234
    hi NonText    ctermbg=233
    hi CursorLine ctermbg=none
    hi Visual     ctermbg=238

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

"call PathogenDisable('pyflakes')
"call PathogenDisable('vim-over')
" let g:markdown_fold_style = 'nested'

" let g:colorscheme = 'xoria256'
let g:colorscheme = 'one'

" let g:airline_theme='molokai'
let g:airline_theme='onedark'

" do not use pylint
let g:syntastic_python_checkers = ['python', 'flake8']

" php: quiet tab warnings for files that uses tabs
let g:syntastic_php_phpcs_quiet_messages = { "regex": "Spaces must be used .*; tabs are not allowed" }

" Java: checkstyle, with SUN codestyle
let g:syntastic_java_checkers = ['checkstyle']
" let g:syntastic_java_checkstyle_classpath = '~/scripts/jar/checkstyle-5.5-all.jar'
let g:syntastic_java_checkstyle_conf_file = '/usr/share/doc/checkstyle/sun_checks.xml'
" let g:syntastic_java_checkstyle_conf_file = '/usr/share/doc/checkstyle/google_checks.xml'
