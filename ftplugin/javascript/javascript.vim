let b:ale_linters = {
\   'javascript': ['prettier'],
\   'javascriptreact': ['eslint'],
\}

let b:ale_fixers = {
\   'javascript': ['prettier'],
\   'javascriptreact': ['eslint'],
\}

let b:ale_linters_explicit = 1
let b:ale_fix_on_save = 1

" let g:ale_javascript_prettier_options = '--single-quote --trailing-comma all --no-semi'
" let g:prettier#config#tab_width = '2'
" let g:prettier#config#semi = 'false'
" let g:prettier#config#single_quote = 'true'

iabbrev log console.log()<left>
