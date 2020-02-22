" MY CONFIG
syntax on
hi MatchParen cterm=bold ctermbg=none ctermfg=blue

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

" wrap single word in quotes in normal mode
nnoremap <leader>' viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel

" wrap visual block in quotes
vnoremap ' <esc>`>a'<esc>`<i'<esc>
vnoremap " <esc>`>a"<esc>`<i"<esc>

" wrap visual block in brackets
vnoremap () <esc>`>a)<esc>`<i(<esc>f)
vnoremap <leader>{} <esc>`>a}<esc>`<i{<esc>
vnoremap <leader>[] <esc>`>a]<esc>`<i[<esc>

" place brackets above and below block and indent block
vnoremap <leader>b{} <esc>`<O{<esc>`>o}<esc>vi{>
vnoremap <leader>b[] <esc>`<O[<esc>`>o]<esc>vi[>
vnoremap b() <esc>`<O(<esc>`>o)<esc>vi(>

" shift to start or end of line
nnoremap H ^
nnoremap L $

" nnoremap <expr> stb "yy :call SendToBuffer(" . (nr2char(getchar())) . ")<cr>"
" vnoremap <expr> stb "y :call SendToBuffer(" . (nr2char(getchar())) . ")<cr>"

" Vim terminal commands
let g:bufferNo = 0
let g:termCmd = "mit-scheme --quiet < " . eval('@%') . "\<cr>"

function Term()
  execute ':vert term'
  let g:bufferNo = bufnr('%')
  echom g:bufferNo
endfunction

function SendToBuffer()
  call term_sendkeys(eval(g:bufferNo), @")
endfunction

function SendFileToBuffer()
  call Term()
  call term_sendkeys(eval(g:bufferNo), g:termCmd)
endfunction

nnoremap <c-v>t :call Term()<cr>
nnoremap <leader>lb yy:call SendToBuffer()<cr>
nnoremap <leader>sb yip:call SendToBuffer()<cr>
vnoremap <leader>sb y:call SendToBuffer()<cr>
nnoremap <leader>fb :call SendFileToBuffer()<cr>

tnoremap <esc><esc> <c-w>:q!
" Vim terminal commands end

nnoremap <leader>ft :echom &filetype<cr>


if &filetype ==# 'scheme'
  nnoremap <leader>/ I;;; <esc>
  " inoremap ( ()<esc>i
endif
