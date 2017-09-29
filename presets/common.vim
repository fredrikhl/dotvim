"
" Basic, common settings.
"

" Override stupid locale
"
"   We want messages and menus in English, regardless of the locale.
"
language en_US
set langmenu=en_US.UTF-8


" encoding
"
"   utf-8 everything. fileencoding is only used if it cannot be detected or
"   found in 'fileencodings'
"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8


" search behaviour
"
"   search-as-we-type, and use ignorecase unless the search term contains mixed
"   case.
"
set incsearch
set ignorecase
set smartcase


" window and splits
"
"  never allow cursor within 5 lines of the window edge, and create new splits
"  below and to the right.
"
set scrolloff=5
set splitbelow
set splitright


" line length and wrapping
"
set textwidth=80


" indents and tabs
"
"   use spaces for indents, and set indent to be 4 spaces. Follow indent level
"   on newlines.
"
set tabstop=4
set expandtab
set autoindent
set shiftwidth=0


" visual stuff
"
set cursorline
" set cursorcolumn
set laststatus=2
set list
set listchars=tab:→\ ,
set number
set ruler
" set rulerformat
set showcmd
set showmatch


" folds
"
set foldlevelstart=2


" command completion
"
"  complete to longest common prefix, then show a list of all matches.  ignore
"  certain file patterns on e.g. opening/navigating to a file to open.
"
set wildmode=longest,list
set wildignore+=*.so,*.exe,*.dll
set wildignore+=*.class,*.jar
set wildignore+=*.pyc,*.pyo,*/build/*
set wildignore+=*.rpm,*.tar,*.tgz,*.gz,*.zip
set wildignore+=*.pdf,*.png,*.jpg,*.gif
set wildignore+=*.wav,*.mp3


" spelling
"
set nospell


" color
"
"  dark bg and syntax highlight by default.
"
set background=dark
syntax on


" terminal and io stuff
"
set title
" set t_Co=16
set shell=/bin/bash
set mouse=a
set backspace=indent,eol,start

if (&term == "screen")
    " hack to fix some weird escape mappings in screen
    set term=xterm
endif


" some other nice things
"
set history=500


" auto textwith
"   augroup set_textwidth
"       autocmd!
"       autocmd FileType text setlocal textwidth=80
"   augroup END


augroup last_known_cursor
    autocmd!
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     exe "normal g`\"" |
        \ endif
augroup END


" limit cursorline,cursorcolumn to current window
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
augroup END


" filetype detection
"
"   plugin - load filetype-specific plugins
"   indent - load filetype-specific indent rules
filetype plugin indent on
