let b:ale_linters = ['eslint']

let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace', 'eslint']

let b:ale_linters_explicit = 1
let b:ale_fix_on_save = 1

let b:ale_javascript_prettier_options = '--single-quote --trailing-comma all --no-semi'

let g:prettier#config#tab_width = '2'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#print_width = '80'

func Eatchar(pattern)
  let char = nr2char(getchar(0))
  return (char =~ a:pattern) ? '' : char
endfunc

iabbrev log console.log()<left><c-r>=Eatchar('\s')<cr>

nnoremap <leader>ejs :vsp ~/.vim/ftplugin/javascript/javascript.vim<cr>

" TODO: add autocomplete to js vim. Look into ale for this
" inoremap <c-n> <c-x><c-o>
