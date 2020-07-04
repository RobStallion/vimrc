syntax on " enable syntax

filetype plugin on " allow filetype plugins

source ~/.vim/config/config.vim
source ~/.vim/config/colours.vim
source ~/.vim/config/remappings.vim


" THINGS I'M CURRENTLY TESTING

" checks the filetype is a react file before allowing abbreviation
" abbreviation to create arrow function
autocmd FileType javascriptreact iabbrev afunc constfoo = () => {}<esc>?foo<cr>cw
