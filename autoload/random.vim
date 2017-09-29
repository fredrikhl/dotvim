" random.vim
" Read random text into buffer from /dev/urandom
"
if exists("g:loaded_random") || &cp
  finish
endif
let g:loaded_random = 1


function! random#read(cls, num, pipe)
    " read from /dev/urandom into `tr`, and delete anything not in {cls}
    let l:cmd = 'tr -c -d "' . escape(a:cls, '"') . '" < /dev/urandom'
    " cut off the read with `dd` when {num} bytes are read
    let l:cmd .= ' | dd bs="' . escape(a:num, '"') . '" count=1 status=none'
    " optionally filter/transform with {pipe}
    if (!empty(a:pipe))
        let l:cmd .= ' | '.a:pipe
    endif
    " run, and read stdout into buffer
    execute 'read !' . l:cmd
endfunction

function! random#alnum(num)
    call random#read('[:alnum:]', a:num, '')
endfunction


function! random#hexbytes(bytes)
    call random#read('[:xdigit:]', a:bytes * 2, 'tr "[:upper:]" "[:lower:]"')
endfunction


function! random#choice(charset, num)
    call random#read(a:charset, a:num, '')
endfunction
