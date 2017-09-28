"
" Copy/paste to command line thingy
"

" xsel - range mappings
if executable('xsel')
    call pipecmd#setup('x', '!xsel -i -p', '!xsel -o -p')
    call pipecmd#setup('xx', '!xsel -i -b', '!xsel -o -b')
elseif executable('pbcopy') && executable('pbpaste')
    call pipecmd#setup('x', '!pbcopy', '!pbpaste')
    call pipecmd#setup('xx', '!pbcopy -pboard ruler', '!pbpaste -pboard ruler')
endif
