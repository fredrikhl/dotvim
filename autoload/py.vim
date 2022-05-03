" Configure python binaries for syntastic
"
" This autoload script lets us quickly set groups of python scripts available to
" syntastic when linting python files.
"

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
"

let s:py2bin = g:vimroot . '/.py2-env/bin/'
let s:py2env = {
    \ 'python': s:py2bin . 'python',
    \ 'flake8': s:py2bin . 'flake8',
    \ 'pyflakes': s:py2bin . 'pyflakes',
    \ 'pep8': s:py2bin . s:py2bin . 'pep8',
    \ 'pycodestyle': s:py2bin . 'pycodestyle',
    \ 'pylint': s:py2bin . 'pylint',
    \ }

let s:py3bin = g:vimroot . '/.py3-env/bin/'
let s:py3env = {
    \ 'python': s:py3bin . 'python',
    \ 'flake8': s:py3bin . 'flake8',
    \ 'pyflakes': s:py3bin . 'pyflakes',
    \ 'pep8': s:py3bin . 'pep8',
    \ 'pycodestyle': s:py3bin . 'pycodestyle',
    \ 'pylint': s:py3bin . 'pylint',
    \ }


" TODO:
"
" Make all this into a dict, so we can have an arbitrary amount of
" named setups:
"
" let s:envs = {
"     \ 'py2': s:py2env,
"     \ 'py3': s:py3env,
"     \ }

" And can swap with a single function call:
"
"   call py#set_version('py2')
"
" existing setups should be in a stack, so we can call
"
"   call py#clear_version()
"
" to revert to any settings that were set before the call


let s:items = ['python', 'flake8', 'pyflakes', 'pep8', 'pycodestyle', 'pylint']


" clear all g:syntastic_python_<item>_exec globals
function! s:clear_env()
    for item in s:items
        let l:syntastic_name = 'g:syntastic_python_' . l:item . '_exec'
        unlet {l:syntastic_name}
    endfor
endfunction


" set or clear g:syntastic_python_<item>_exec globals from a:env
function! s:set_env(env)
    for item in s:items
        let l:syntastic_name = 'g:syntastic_python_' . l:item . '_exec'
        if has_key(a:env, l:item)
            let {l:syntastic_name} = a:env[l:item]
        else
            unlet {l:syntastic_name}
        endif
    endfor
endfunction


" update g:syntastic_python_<item>_exec globals with a:env
"
" Like s:set_env, but doesnt unlet any s:items missing from a:env
function! s:update_env(env)
    for item in s:items
        let l:syntastic_name = 'g:syntastic_python_' . l:item . '_exec'
        if has_key(a:env, l:item)
            let {l:syntastic_name} = a:env[l:item]
        endif
    endfor
endfunction


" TODO: A FileType autocmd that tries to figure out which version the buffer
" uses and changes version?

augroup set_python
    autocmd!
    autocmd User SetPython2 call s:set_env(s:py2env)
    autocmd User SetPython3 call s:set_env(s:py3env)
    autocmd User UnsetPython call s:clear_env()
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
