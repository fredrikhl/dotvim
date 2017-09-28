runtime! bundle/vim-pathogen/autoload/pathogen.vim

" path: directory where this file resides (with symlinks resolved)
let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
let s:confdir = s:path . '/common'
let s:presetdir = s:path . '/presets'
let s:hostfile = s:path . '/hosts/' . substitute(hostname(), "\\..*", "", "") . '.vim'

let s:presets = split($VIM_PRESETS, ':')

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

" Load common configs
for config in split(globpath(s:confdir, '*.vim'), '\n')
    call s:source_if(config)
endfor

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


" Load default files
if exists('*pathogen#infect()')
    call pathogen#infect()
    " call pathogen#infect('custom/{}')
endif

if exists('g:colorscheme')
    exec "colorscheme " . g:colorscheme
endif
