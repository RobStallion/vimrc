syntax on " enable syntax

filetype plugin on " allow filetype plugins

source ~/.vim/config/config.vim
source ~/.vim/config/colours.vim
source ~/.vim/config/remappings.vim

" THINGS I'M CURRENTLY TESTING

" jump to the begining of a line
nnoremap H ^

" jump to the end of a line
nnoremap L $

" create operators to select in or around next ( { [ ' "
" in == in next
" il == in last

augroup filetype_javascript
  autocmd! filetype_javascript
  autocmd FileType javascript onoremap <buffer> in( :<c-u>execute "normal! /(\r:noh\rvi("<cr>
  autocmd FileType javascript onoremap <buffer> il( :<c-u>execute "normal! ?)\r:noh\rvi)"<cr>
augroup END
