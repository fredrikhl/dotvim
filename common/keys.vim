"
" Key mappings
"

" Emacs style mappings
"cnoremap <C-a>  <Home>
"cnoremap <C-b>  <Left>
"cnoremap <C-f>  <Right>
"cnoremap <C-d>  <Delete>
"cnoremap <M-b>  <S-Left>
"cnoremap <M-f>  <S-Right>
"cnoremap <M-d>  <S-right><Delete>
"cnoremap <Esc>b <S-Left>
"cnoremap <Esc>f <S-Right>
"cnoremap <Esc>d <S-right><Delete>
"cnoremap <C-g>  <C-c>


" Opening/swapping tabs
nmap <C-t> :tabnew<CR>
nmap <C-j> :tabp<CR>
nmap <A-Left> :tabp<CR>
nmap <C-k> :tabn<CR>
nmap <A-Right> :tabn<CR>

" Movement between windows/splits
nmap <tab><Left>  :wincmd h<CR>
nmap <tab><Down>  :wincmd j<CR>
nmap <tab><Up>    :wincmd k<CR>
nmap <tab><Right> :wincmd l<CR>
nmap <tab><tab> <C-w><C-p>

" Disable some unfortunate shortcuts
nnoremap Q <nop>" Remove ex-mode shortcut
nnoremap <F1> <nop>" Remove F1 help-shortcut

" Clear search hilights
nnoremap <silent><Space> :silent noh<Bar>echo<CR>

"
" Addon-keys
"
function! s:setup_keybinds(force)
    " o: vim-over
    if exists(':OverCommandLine') || a:force
        noremap <silent><leader>o :OverCommandLine<CR>
    endif

    " t: taglist/tagbar
    if exists(':TagbarToggle') || a:force
        nmap <silent><leader>t :TagbarToggle<CR>
    elseif exists(':TlistToggle')
        nmap <silent><leader>t :TlistToggle<CR>
    endif

    " s: syntastic
    if exists(':SyntasticToggleMode') || a:force
        nmap <silent><leader>s :SyntasticToggleMode<CR>
    endif

    " n: NERDTree
    if exists(':NERDTreeToggle') || a:force
        nmap <silent><leader>n :NERDTreeToggle<CR>
    endif

    " i: indent-guides
    if exists(':IndentGuidesToggle') || a:force
        nmap <silent><leader>i :IndentGuidesToggle<CR>
    endif

    " w: better-whitespace
    if exists(':ToggleWhitespace') || a:force
        nmap <silent><leader>w :ToggleWhitespace<CR>
    endif

    " l: plugin/hi-length.vim
    if exists('*ToggleOverLength') || a:force
        nnoremap <silent><leader>l :call ToggleOverLength()<CR>
    endif

    " y, p: plugin/win-swap.vim
    if (exists('*DoWindowSwap') && exists('*MarkWindowSwap')) || a:force
        " yank/put window:
        nmap <silent><leader>y :call MarkWindowSwap()<CR>
        nmap <silent><leader>p :call DoWindowSwap()<CR>

        " Move window left/down/up/right
        nnoremap <silent><leader><Left> :call MarkWindowSwap()<CR><C-w>h :call DoWindowSwap()<CR>
        nnoremap <silent><leader><Down> :call MarkWindowSwap()<CR><C-w>j :call DoWindowSwap()<CR>
        nnoremap <silent><leader><Up> :call MarkWindowSwap()<CR><C-w>k :call DoWindowSwap()<CR>
        nnoremap <silent><leader><Right> :call MarkWindowSwap()<CR><C-w>l :call DoWindowSwap()<CR>
    endif

    " g: git-gutter
    if exists(':GitGutterToggle')  || a:force
        nmap <silent><leader>g :GitGutterToggle<CR>
    endif
endfunction


if has("autocmd")
    autocmd VimEnter * call s:setup_keybinds(0)
else
    call s:setup_keybinds(1)
endif
