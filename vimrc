runtime! autoload/pathogen.vim

" path: directory where this file resides (with symlinks resolved)
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:presets = s:path . '/presets'
let s:hostfile = s:path . '/hosts/' . substitute(hostname(), "\\..*", "", "") . '.vim'

let s:load_presets = split($VIM_PRESETS, ':')

function! s:source_if(filename)
    if filereadable(a:filename)
        exec "source " . a:filename
    endif
endfunction


" Those pesky files...
exec 'set backupdir=' . join([s:path . '/backup', '/tmp', '.'], ',')
exec 'set directory=' . join([s:path . '/swap', '/tmp', '.'], ',')
set backup


" TODO: Figure out a way to do pre- and post-pathogen stuff
" Add a bundle name to the pathogen_disabled list.
"   bundle: name in ./bundle/
"
"   function! PathogenDisable(bundle)
"       if (!exists('g:pathogen_disabled'))
"           let g:pathogen_disabled = []
"       endif
"       if (0 > index(g:pathogen_disabled, a:bundle))
"           call add(g:pathogen_disabled, a:bundle)
"       endif
"   endfunction

if exists('*pathogen#infect()')
    call pathogen#infect()
    " call pathogen#infect('custom/{}')
endif

" Try to load .vim/presets/<preset>.vim files defined in $VIM_PRESETS
" This allows e.g. a `export VIM_PRESET=work:linux:foo` in .bashrc
if len(s:load_presets) < 1
    call add(s:load_presets, 'common')
endif

for preset in s:load_presets
    call s:source_if(s:presets . '/' . preset . '.vim')
endfor

" Try to load a .vim/hosts/<hostname>.vim
call s:source_if(s:hostfile)

" Load common files
" for dropin in split(globpath(s:dropins, '*.vim'), '\n')
"     call s:source_if(dropin)
" endfor
"

"
" Load default files
"
call s:source_if(s:path . '/keys.vim')

" TODO: Where should this go?
if has("autocmd")

    " Limit cursorline, cursorcolumn to window
    augroup visualcursor
        autocmd!
        if &cursorline
            autocmd WinLeave * set nocursorline
            autocmd WinEnter * set cursorline
        endif
        if &cursorcolumn
            autocmd WinLeave * set nocursorcolumn
            autocmd WinEnter * set cursorcolumn
        endif
    augroup end

    filetype plugin indent on

    " Generic augroup
    augroup vimrcEx
        autocmd!
        " For all text files set 'textwidth' to 78 characters.
        "autocmd FileType text setlocal textwidth=80

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \     exe "normal g`\"" |
            \ endif
    augroup END

endif
