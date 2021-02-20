let g:go_fmt_command = "goimports" " Run goimports along gofmt on each save

" Automatically show function info
let g:go_auto_type_info = 1

" Function info update delay (ms)
" set updatetime=10

" Automatically highlight identifiers
" let g:go_auto_sameids = 1

nnoremap <leader>rg :GoRun<cr>

" inoremap fn fmt.Println()<esc>i
" inoremap ff fmt.Printf()<esc>i

nnoremap <leader>R :GoRename<cr>

" created a function which returns omnicomplete or tab
" returns omnicomplete when previous char is a .
function AutoCompleter()
  let previousChar = getline('.')[col('.') - 2]
  if previousChar == '.'
    return "\<c-x>\<c-o>"
  else
    return "\<tab>"
  endif

  return ''
endfunction

" call AutoCompleter function in insert mode with tab
inoremap <tab> <c-r>=AutoCompleter()<cr>

set completeopt=menu
