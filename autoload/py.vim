" Configure python binaries for syntastic
"
" This is a hack that lets us swap the python binaries.

function! s:set_default(varname, default)
    let l:varname = 'g:py_' . a:varname
    if !exists(l:varname)
        let {l:varname} = a:default
    endif
endfunction

" TODO:
" Provide custom IsAvailable functions, so we can change the executables to
" `python -m <module>`.
"
"   function! SyntaxCheckers_python_python_IsAvailable() dict
"       if !executable(self.getExec())
"           return 0
"       endif
"       return syntastic#util#versionIsAtLeast(self.getVersion(), [2, 6])
"   endfunction


" TODO:
" Make all this into a dict, so we can have an arbitrary amount of
" named setups:
"
"   py_versions = {
"     py2 = {
"       python = python2,
"       flake8 = flake8-2.7,
"     },
"     py3 = { ...},
"   }
"
" And can swap with a single function call:
"
"   call py#set_version('py2')
"
" existing setups should be in a stack, so we can call
"
"   call py#clear_version()
"
" to revert to any settings that were set before the call
"

let s:py2bin = g:vimroot . '/.py2-env/bin/'
let s:py3bin = g:vimroot . '/.py3-env/bin/'

call s:set_default('python2_python', s:py2bin . 'python')
call s:set_default('python2_flake8', s:py2bin . 'flake8')
call s:set_default('python2_pyflakes', s:py2bin . 'pyflakes')
call s:set_default('python2_pep8', s:py2bin . s:py2bin . 'pep8')
call s:set_default('python2_pycodestyle', s:py2bin . 'pycodestyle')
call s:set_default('python2_pylint', s:py2bin . 'pylint')

call s:set_default('python3_python', s:py3bin . 'python')
call s:set_default('python3_flake8', s:py3bin . 'flake8')
call s:set_default('python3_pyflakes', s:py3bin . 'pyflakes')
call s:set_default('python3_pep8', s:py3bin . s:py3bin . 'pep8')
call s:set_default('python3_pycodestyle', s:py3bin . 'pycodestyle')
call s:set_default('python3_pylint', s:py3bin . 'pylint')


" TODO: Move to syntastic config?
function! s:set_py2()
    let g:syntastic_python_python_exec = g:py_python2_python
    let g:syntastic_python_flake8_exec = g:py_python2_flake8
    let g:syntastic_python_pyflakes_exec = g:py_python2_pyflakes
    let g:syntastic_python_pep8_exec = g:py_python2_pep8
    let g:syntastic_python_pycodestyle_exec = g:py_python2_pycodestyle
    let g:syntastic_python_pylint_exec = g:py_python2_pylint
endfunction

function! s:set_py3()
    let g:syntastic_python_python_exec = g:py_python3_python
    let g:syntastic_python_flake8_exec = g:py_python3_flake8
    let g:syntastic_python_pyflakes_exec = g:py_python3_pyflakes
    let g:syntastic_python_pep8_exec = g:py_python3_pep8
    let g:syntastic_python_pycodestyle_exec = g:py_python3_pycodestyle
    let g:syntastic_python_pylint_exec = g:py_python3_pylint
endfunction

function! s:unset_py()
    unlet g:syntastic_python_python_exec
    unlet g:syntastic_python_flake8_exec
    unlet g:syntastic_python_pyflakes_exec
    unlet g:syntastic_python_pep8_exec
    unlet g:syntastic_python_pycodestyle_exec
    unlet g:syntastic_python_pylint_exec
endfunction


" TODO: A FileType autocmd that tries to figure out which version the buffer
" uses and changes version?

augroup set_python
    autocmd!
    autocmd User SetPython2 call s:set_py2()
    autocmd User SetPython3 call s:set_py3()
    autocmd User UnsetPython call s:unset_py()
augroup END


function! py#set_py2()
    doautocmd User SetPython2
endfunction
function! py#set_py3()
    doautocmd User SetPython3
endfunction
function! py#unset_py()
    doautocmd User UnsetPython
endfunction
