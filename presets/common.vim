"
" Basic, common settings.
" Can be overloaded in other files
"

" Override stupid locale
set langmenu=en_US.UTF-8  " sets the language of the menu (gvim)
language en_US            " sets the language of the messages / ui (vim)

" set utf-8 default
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8

" command completion
set showcmd
set wildmode=longest,list
set history=50

" search
set incsearch     " do incremental searching
set ignorecase    " case-insensitive search (with /)
set smartcase     " ... except when including different casing in expr
set showmatch     " Show matching braces

" window and splits
set scrolloff=5   " Never allow cursor within 5 lines off the top/bottom lines (force scroll)
set splitbelow    " Splits appear at bottom
set splitright    " Splits appear to the right

" Tab size
set shiftwidth=4
set ts=4
set tw=80
set expandtab     " Spaces, not tabs
set autoindent    " autoindenting on

" Show tab stops
set listchars=tab:→\ ,
set list

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set mouse=a       " Mouse selection

set ruler         " Cursor position.
set number        " Line numbers
set cursorline    " Mark current line
" set cursorcolumn " Mark current column
set nospell       " Spell check off by default
set foldlevelstart=2 " Default foldlevel when opening files

" color settings
set background=dark
"set t_Co=16
syntax on

" Fix weird escape mapping in xterm/screen
if (&term == "screen")
    set term=xterm
endif

" Some nice things
set title               " alter terminal window title to file name
set shell=/bin/bash     " Ensure that my prefered shell is used
set wildignore+=*.so,*.swp,*.zip,*.class,*.exe,*/build/*
set laststatus=2
