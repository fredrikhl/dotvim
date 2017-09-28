runtime! bundle/vim-pathogen/autoload/pathogen.vim

" path: directory where this file resides (with symlinks resolved)
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:confdir = s:path . '/common'
let s:presetdir = s:path . '/presets'
let s:hostfile = s:path . '/hosts/' . substitute(hostname(), "\\..*", "", "") . '.vim'

let s:presets = split($VIM_PRESETS, ':')


" Set colorscheme by setting g:colorscheme.
let g:colorscheme = "default"


function! s:source_if(filename)
    if filereadable(a:filename)
        exec "source " . a:filename
    endif
endfunction


function! PathogenDisable(bundle)
    if (!exists('g:pathogen_disabled'))
        let g:pathogen_disabled = []
    endif
    if (0 > index(g:pathogen_disabled, a:bundle))
        call add(g:pathogen_disabled, a:bundle)
    endif
endfunction


" Those pesky files...
exec 'set undodir=' . join([s:path . '/.undo//', '/tmp//', '.'], ',')
exec 'set backupdir=' . join([s:path . '/.backup//', '/tmp//', '.'], ',')
exec 'set directory=' . join([s:path . '/.swap//', '/tmp//', '.'], ',')
exec 'set viminfo+=n' . s:path . '/.viminfo'
set backup


" Load common configs
for config in split(globpath(s:confdir, '*.vim'), '\n')
    call s:source_if(config)
endfor


" Try to load .vim/presets/<preset>.vim files defined in $VIM_PRESETS
" This allows e.g. a `export VIM_PRESET=work:linux:foo` in .bashrc
if len(s:presets) < 1
    call add(s:presets, 'common')
endif
for preset in s:presets
    call s:source_if(s:presetdir . '/' . preset . '.vim')
endfor


" Try to load a .vim/hosts/<hostname>.vim
call s:source_if(s:hostfile)


if exists('*pathogen#infect()')
    call pathogen#infect()
    " call pathogen#infect('custom/{}')
endif

if exists('g:colorscheme')
    exec "colorscheme " . g:colorscheme
else
    colorscheme default
endif
