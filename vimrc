" MY CONFIG
syntax on

" Remap keys
nmap ; :

" Spaces & Tabs

set tabstop=2 " number of visual spaces per TAB
set softtabstop=2 " number of spaces in tab when editing
set expandtab " tabs are spaces
set shiftwidth=2
set number " show line numbers
set showcmd " show command in bottom bar
set cursorline " highlight current line
set hlsearch " highlight search

let g:ale_linters = {
\   'javascript': ['eslint'],
\}

" LEARN VIMSCRIPT THE HARD WAY
" My remappings
" Change case of current word
inoremap <c-u> <esc>viw~A
nnoremap <c-u> viw~e

" let mapleader = "\<space>"
let mapleader = "\\"
let maplocalleader = "\\"

nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Abbreviations are good for updating text.
" better than mapping for this as they take into
" account the surrounding letters
iabbrev foofffff const foo =

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>f"
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>f'
vnoremap ' <esc>`<i'<esc>`>a'<esc>
vnoremap " <esc>`<i"<esc>`>a"<esc>
vnoremap " <esc>`<i"<esc>`>a"<esc>
vnoremap {} <esc>`<O{<esc>`>o}<esc>vi{>
vnoremap [] <esc>`<O[<esc>`>o]<esc>vi[>
nnoremap H ^
nnoremap L $

" nnoremap <expr> stb "yy :call SendToBuffer(" . (nr2char(getchar())) . ")<cr>"
" vnoremap <expr> stb "y :call SendToBuffer(" . (nr2char(getchar())) . ")<cr>"

" Vim terminal commands
let g:bufferNo = 0

function SendToBuffer()
  call term_sendkeys(eval(g:bufferNo), @")
endfunction

function Term()
  execute ':vert term'
  let g:bufferNo = bufnr('%')
  echom g:bufferNo
endfunction

nnoremap <c-v>t :call Term()<cr>
nnoremap sltb yy:call SendToBuffer()<cr>
nnoremap stb yip:call SendToBuffer()<cr>
vnoremap stb y:call SendToBuffer()<cr>

tnoremap <esc><esc> <c-w>:q!
