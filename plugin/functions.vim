" Test if python version is greater or equal to 'min'
"   min: The minimum version (e.g. '3', '2.5', '2.6.6')
"   return: 0 if version < 'min', 1 if version >= 'min'
"           Also returns 0 if there's no :python command ma,e
function! PythonVersionGe(min)
    if !has('python')
        return 0
    endif
    python << EOF
import sys, vim
def comp(min):
    assert min, "No minimum version given"
    require = tuple([int(v) for v in min.split('.')])
    current = sys.version_info[:len(require)]
    return current >= require
vim.command('return %d' % int(comp(vim.eval('a:min'))))
EOF
endfunction

function! VimOverCompat()
    return (exists('*InsertCharPre') && exists('*InsertEnter') && exists('*InsertLeave'))
endfunction

" Add a bundle name to the pathogen_disabled list.
" Initializes the disabled variable if it doesn't exist.
"   bundle: The bundle name (folder name in .vim/bundle/)
function! PathogenDisable(bundle)
    " Initialize
    if (!exists('g:pathogen_disabled'))
        let g:pathogen_disabled = []
    endif
    " Add if not in list
    if (0 > index(g:pathogen_disabled, a:bundle))
        call add(g:pathogen_disabled, a:bundle)
    endif
endfunction

" Dump colors
function! PrintColors()
    let num = 255
    while num >= 0
        exec 'hi col_'.num.' ctermbg='.num.' ctermfg=white'
        exec 'syn match col_'.num.' "ctermbg='.num.':..." containedIn=ALL'
        call append(0, 'ctermbg='.num.':...')
        let num = num - 1
    endwhile
    unlet num
endfunction
