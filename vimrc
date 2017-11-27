runtime
            \ bundle.remote/vim-pathogen/autoload/pathogen.vim
            \ bundle/vim-pathogen/autoload/pathogen.vim
            \ autoload/pathogen.vim

" path: directory where this file resides (with symlinks resolved)
let s:root = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:confdir = s:root . '/common'
let s:hostdir = s:root . '/hosts'
let s:presetdir = s:root . '/presets'

let s:presets = split($VIMPRESETS, ':')

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
    execute 'source' config
endfor


" Try to load .vim/presets/<preset>.vim files defined in $VIMPRESETS
" This allows e.g. a `export VIMPRESET=work:linux:foo` in .bashrc
for preset in s:presets
    call s:source_if(s:presetdir . '/' . preset . '.vim')
endfor


" Try to load a .vim/hosts/<hostname>.vim
for config in split(globpath(s:hostdir, '*.vim'), '\n')
    if hostname() =~ fnamemodify(config, ':t:r')
        execute 'source' config
    endif
endfor


if exists('*pathogen#infect()')
    if isdirectory(s:root . '/bundle')
        call pathogen#infect(s:root . '/bundle/{}')
    endif
    if isdirectory(s:root . '/bundle.remote')
        call pathogen#infect(s:root . '/bundle.remote/{}')
    endif
endif

if exists('g:colorscheme')
    execute "colorscheme " . g:colorscheme
else
    colorscheme default
endif
