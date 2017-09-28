"
" myrsnipa.uio.no config
"

" Leader, different vim, different keyboard
let mapleader = "|"
let g:slimv_leader = ","
let g:paredit_leader = ","


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

    let g:colors_name = g:colors_name . '-custom'
endfunction

augroup custom_colors
    autocmd!
    autocmd ColorScheme * call s:update_colors()
augroup END

" Helper functions for vimrc
" source ~/config/vim/functions.vim

" Disable pathogen bundles BEFORE vimrc is loaded
" The disable list does not actually depend on pathogen
"
" Disable pyflakes, we try to use syntastic
"call PathogenDisable('pyflakes')
"call PathogenDisable('vim-over')

" let g:markdown_fold_style = 'nested'

" let g:colorscheme = 'xoria256'
let g:colorscheme = 'one'


" Airline
" let g:airline_theme='molokai'
let g:airline_theme='onedark'

" Local settings (paths, etc...)


" Do not use pylint
let g:syntastic_python_checkers = ['python', 'flake8']

" TMP: Quiet tab warning
let g:syntastic_php_phpcs_quiet_messages = { "regex": "Spaces must be used .*; tabs are not allowed" }

" TMP: Java checkstyle checks for SUN
let g:syntastic_java_checkers = ['checkstyle']
let g:syntastic_java_checkstyle_conf_file = '/usr/share/doc/checkstyle/sun_checks.xml'
let g:syntastic_java_checkstyle_classpath = '/home/fhl/scripts/jar/checkstyle-5.5-all.jar'
set listchars=tab:⇥\ ,
