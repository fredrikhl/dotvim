"
" Copy/paste to command line thingy
"

" TODO: This needs a rewrite?

" Creates range commands [YyPp]<keys>, where [Yy]<keys> yanks the buffer range
" and writes it to 'to', and [Pp]<keys> puts 'from' into the buffer.
" Prefix to/from with '!' to write to/read from stdin/stdout of a command
function! SetupRangePipeCmd(keys, to, from)
    for k in ['Y', 'y', 'P', 'p']
        if exists(':'.k.a:keys)
            echo 'Command name '.k.a:keys.' taken' | return
        endif
    endfor
    exec 'command -range Y'.a:keys.' :silent :<line1>,<line2>write '.a:to
    exec 'cabbrev y'.a:keys.' Y'.a:keys
    exec 'command -range P'.a:keys.' :silent :<line1>,<line2>delete | read '.a:from
    exec 'cabbrev p'.a:keys.' P'.a:keys
endfunction

" xsel - range mappings
if executable('xsel')
    call SetupRangePipeCmd('x', '!xsel -i -p', '!xsel -o -p')
    call SetupRangePipeCmd('xx', '!xsel -i -b', '!xsel -o -b')
elseif executable('pbcopy') && executable('pbpaste')
    call SetupRangePipeCmd('x', '!pbcopy', '!pbpaste')
    call SetupRangePipeCmd('xx', '!pbcopy -pboard ruler', '!pbpaste -pboard ruler')
endif
