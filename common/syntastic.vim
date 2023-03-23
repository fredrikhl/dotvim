"
" syntastic settings
"

" Populate loclist (:Errors), so that we can navigate between errors with :lnext
" and :lprev
let g:syntastic_always_populate_loc_list = 1


"
" go linters
"
" let g:syntastic_go_checkers = ['go', 'gofmt', 'golangci_lint', 'golint', 'gometalinter', 'gotype', 'govet']
" should probably use golangci-lint (https://golangci-lint.run/)
let g:syntastic_go_checkers = ['gofmt', 'govet', 'golint', 'go']
