" Configure python versions

" defaults

function! s:set_default(varname, default)
    let l:varname = 'g:py_' . a:varname
    if !exists(l:varname)
        let {l:varname} = a:default
    endif
endfunction

" TODO: Overload the IsAvailable methods so that we can use
"   python<version> -m <checker>?
" function! SyntaxCheckers_python_python_IsAvailable() dict
"     if !executable(self.getExec())
"         return 0
"     endif
"     return syntastic#util#versionIsAtLeast(self.getVersion(), [2, 6])
" endfunction


call s:set_default('python2_python', 'python')
call s:set_default('python2_flake8', 'flake8')
call s:set_default('python2_pyflakes', 'pyflakes')
call s:set_default('python2_pep8', 'pep8')
call s:set_default('python2_pycodestyle', 'pycodestyle')
call s:set_default('python2_pylint', 'pylint')

call s:set_default('python3_python', 'python3')
call s:set_default('python3_flake8', 'python3-flake8')
call s:set_default('python3_pyflakes', 'python3-pyflakes')
call s:set_default('python3_pep8', 'python3-pep8')
call s:set_default('python3_pycodestyle', 'python3-pycodestyle')
call s:set_default('python3_pylint', 'python3-pylint')

" TODO: can we make our own autocmd event? That might be a better way to
" configure python executables individually for plugins

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


augroup set_python
    autocmd! User SetPython2 call s:set_py2()
    autocmd! User SetPython3 call s:set_py3()
    autocmd! User UnsetPython call s:unset_py()
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
