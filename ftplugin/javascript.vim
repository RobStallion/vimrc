let g:ale_linters = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'javascriptreact': ['eslint'],
\}

let g:ale_linters_explicit = 1

let g:ale_fix_on_save = 1

" things I'm currently testing
" abbreviation to create arrow function
iabbrev afunc constfoo = () => {}<esc>?foo<cr>cw
