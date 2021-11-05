let g:prettier#config#tab_width = '2'
let g:prettier#config#semi = 'false'
let g:prettier#config#single_quote = 'true'
let g:prettier#config#arrow_parens = 'avoid'
let g:prettier#config#print_width = '80'

func Eatchar(pattern)
  let char = nr2char(getchar(0))
  return (char =~ a:pattern) ? '' : char
endfunc

" Shortcut for typing console.log()
iabbrev log console.log()<left><c-r>=Eatchar('\s')<cr>

" Shortcut to quickly edit this file
nnoremap <leader>ejs :vsp ~/.vim/ftplugin/javascript/javascript.vim<cr>
