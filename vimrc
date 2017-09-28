runtime! bundle/vim-pathogen/autoload/pathogen.vim

" path: directory where this file resides (with symlinks resolved)
let s:root = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:confdir = s:root . '/common'
let s:presetdir = s:root . '/presets'
let s:hostfile = s:root . '/hosts/' . substitute(hostname(), "\\..*", "", "") . '.vim'

let s:presets = split($VIM_PRESETS, ':')

silent! execute 'helptags' s:root . '/doc'

" This is how we set the colorscheme now.
" This way, the colorscheme only gets set once, and we can set it to a
" colorscheme before it is added to runtimepath.
let g:colorscheme = "default"


" source a file if it exists
function! s:source_if(filename)
    if filereadable(a:filename)
        execute 'source' a:filename
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
execute 'set undodir=' . join([s:root . '/.undo', '/tmp', '.'], ',')
set undofile
execute 'set backupdir=' . join([s:root . '/.backup', '/tmp', '.'], ',')
set backup
execute 'set directory=' . join([s:root . '/.swap//', '/tmp//', '.'], ',')
execute 'set viminfo+=n' . s:root . '/.viminfo'


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
    execute "colorscheme " . g:colorscheme
else
    colorscheme default
endif
