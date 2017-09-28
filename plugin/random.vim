"
" Fetch random input from /dev/urandom
"


" Read random text from /dev/urandom
" 1. Reads bytes from /dev/urandom
" 2. Filters bytes with tr, using trClass
" 3. Terminates read with dd after getting numChars bytes
" 4. Optionally pipes the result through pipe
"
"   trClass: SET1 for 'tr'. All characters outside the set gets filtered
"   numChars: Number of characters to get
"   pipe: An optional command to pipe the output through
function! ReadRandomTextFromTr(trClass, numChars, pipe)
    let l:readCommand = 'tr -c -d "'.escape(a:trClass, '"').'" < /dev/urandom'
    let l:readCommand .= ' | dd bs="'.escape(a:numChars, '"').'" count=1 status=none'
    if (!empty(a:pipe))
        let l:readCommand .= ' | '.a:pipe
    endif
    exec 'read !'.l:readCommand
endfunction

" Get some random alphanumeric text input.
"   num: Number of chars
function! RandomAlnum(num)
    call ReadRandomTextFromTr('[:alnum:]', a:num, '')
endfunction

" Get some random bytes as hex text.
"   num: Number of bytes
function! RandomHex(num)
    call ReadRandomTextFromTr('[:xdigit:]', a:num * 2, 'tr "[:upper:]" "[:lower:]"')
endfunction

" Get some random text.
"   selection: Character set to get chars from
"   num: Number of characters
function! RandomSelection(selection, num)
    call ReadRandomTextFromTr(a:selection, a:num, '')
endfunction
