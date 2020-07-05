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
" look into how to replace f with / (or search) to allow these to be called from a different line

onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in) :<c-u>normal! f(vi(<cr>
onoremap il( :<c-u>normal! F)vi)<cr>
onoremap il) :<c-u>normal! F)vi)<cr>
onoremap an( :<c-u>normal! f(va(<cr>
onoremap an) :<c-u>normal! f(va(<cr>
onoremap al( :<c-u>normal! F)va)<cr>
onoremap al) :<c-u>normal! F)va)<cr>

onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in} :<c-u>normal! f{vi{<cr>
onoremap il{ :<c-u>normal! F}vi}<cr>
onoremap il} :<c-u>normal! F}vi}<cr>
onoremap an{ :<c-u>normal! f{va{<cr>
onoremap an} :<c-u>normal! f{va{<cr>
onoremap al{ :<c-u>normal! F}va}<cr>
onoremap al} :<c-u>normal! F}va}<cr>

onoremap in[ :<c-u>normal! f[vi[<cr>
onoremap in] :<c-u>normal! f[vi[<cr>
onoremap il[ :<c-u>normal! F]vi]<cr>
onoremap il] :<c-u>normal! F]vi]<cr>
onoremap an[ :<c-u>normal! f[va[<cr>
onoremap an] :<c-u>normal! f[va[<cr>
onoremap al[ :<c-u>normal! F]va]<cr>
onoremap al] :<c-u>normal! F]va]<cr>

onoremap in' :<c-u>normal! f'vi'<cr>
onoremap in" :<c-u>normal! f"vi"<cr>
onoremap il' :<c-u>normal! F'vi'<cr>
onoremap il" :<c-u>normal! F"vi"<cr>
onoremap an' :<c-u>normal! f'va'<cr>
onoremap an" :<c-u>normal! f"va"<cr>
onoremap al' :<c-u>normal! F'va'<cr>
onoremap al" :<c-u>normal! F"va"<cr>

" checks the filetype is a js file before allowing abbreviation
" buffer ensures command is only available in local buffer
" abbreviation to create arrow function

" not sure how to get this to work at the moment. the autocmd FileType appears
" to only run once when the file is first opened. That means if I update the
" abbreviation command in anyway then resource the vimrc, the abbreviation is
" never updated. This will not be a problem often but it would be good to
" figure out a solution to this. Also don't want vim loading the same command
" multiple times

" augroup filetype_javascript
"   autocmd!
"   abclear <buffer>
"   autocmd FileType javascript inoreab <buffer> fff const foo = () => {}<esc>?foo<cr>dw<left>i
" augroup END
