" Creates range commands [YyPp]<keys>, where [Yy]<keys> yanks the buffer range
" and writes it to 'to', and [Pp]<keys> puts 'from' into the buffer.
" Prefix to/from with '!' to write to/read from stdin/stdout of a command
function! pipecmd#setup(keys, to, from)
    for k in ['Y', 'y', 'P', 'p']
        if exists(':'.k.a:keys)
            echo 'Command name '.k.a:keys.' taken' | return
        endif
    endfor
    " :Y<keys> - write range to <to> on stdin
    execute 'command -range Y'.a:keys.' :silent :<line1>,<line2>write !'.a:to
    execute 'cabbrev y'.a:keys.' Y'.a:keys
    " :P<keys> - read from <from>
    execute 'command P'.a:keys.' :silent :read !'.a:from
    execute 'cabbrev p'.a:keys.' P'.a:keys

    " TODO: should probably support -register
    let reg = "'" . '"' . "'"
    " PipeY<keys> - write the unnamed register to <to>
    execute 'command PipeY'.a:keys.' :silent call system("'.a:to.'", getreg('.reg.', 1, 1))'
    " PipeP<keys> - read from <from> into the unnamed register
    execute 'command PipeP'.a:keys.' :silent let @" = system("'.a:from.'")'

endfunction
