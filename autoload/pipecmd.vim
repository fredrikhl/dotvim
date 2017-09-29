" Creates range commands [YyPp]<keys>, where [Yy]<keys> yanks the buffer range
" and writes it to 'to', and [Pp]<keys> puts 'from' into the buffer.
" Prefix to/from with '!' to write to/read from stdin/stdout of a command
function! pipecmd#setup(keys, to, from)
    for k in ['Y', 'y', 'P', 'p']
        if exists(':'.k.a:keys)
            echo 'Command name '.k.a:keys.' taken' | return
        endif
    endfor
    execute 'command -range Y'.a:keys.' :silent :<line1>,<line2>write '.a:to
    execute 'cabbrev y'.a:keys.' Y'.a:keys
    "execute 'command -range P'.a:keys.' :silent :<line1>,<line2>delete | read '.a:from
    execute 'command P'.a:keys.' :silent :read '.a:from
    execute 'cabbrev p'.a:keys.' P'.a:keys

endfunction
