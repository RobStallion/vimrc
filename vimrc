filetype plugin indent on " allow filetype plugins

let s:pairedPunctuation = ['(', ')', '[', ']', '{', '}', '\', '''']

function InNext(str) abort
  execute 'onoremap <buffer> in'.a:str.' :<c-u>execute "normal! /'.a:str.'\r:noh\rvi'.a:str.'"<cr>'
endfunction

function InLast(str) abort
  execute 'onoremap <buffer> il'.a:str.' :<c-u>execute "normal! ?'.a:str.'\r:noh\rvi'.a:str.'"<cr>'
endfunction

function CreateOperatorPendingMappings()
  for i in s:pairedPunctuation
    call InNext(i)
    call InLast(i)
  endfor
endfunction

" Mappings {{{
let mapleader=" "

" map ; to : in normal mode
nnoremap ; :

" edit & source vimrc
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:nohlsearch<cr>

" copy to clipboard
vnoremap <c-c> "+y

" remove highlighted search
nnoremap H :nohlsearch<cr>

" error match for trailing whitespace
nnoremap <leader>w :match Error /\v\s+$/<cr>

" clear error match
nnoremap <leader>W :match none<cr>

" remove trailing whitespace and remove highlighted search
nnoremap <leader>rtw :%s/\v\s+$//g<cr>:nohlsearch<cr>:w<cr>

" automatically make vim search use 'regular' regex
" nnoremap / /\v

" toggle relative number
nnoremap <leader>R :setlocal relativenumber!<cr>

" toggle spellcheck
nnoremap <leader>sc :set spell!<cr>

" Create terminal
nnoremap <leader>t :call CreateTerm()<cr>

" paste new word on line below or above
nnoremap <leader>p o<esc>p
nnoremap <leader>P O<esc>p

" yank till the end of the line
nnoremap Y Du

" create next in operator pendings
call CreateOperatorPendingMappings()
onoremap <buffer> in" :<c-u>execute "normal! /\"\r:noh\rvi\""<cr>
onoremap <buffer> il" :<c-u>execute "normal! ?\"\r:noh\rvi\""<cr>
" }}}

" Terminal Mode Mappings {{{

" quickly scroll through terminal logs
tnoremap kk <c-w>N

" quick exit
" tnoremap <c-c><c-c> exit<cr>
" }}}

" Basic Settings {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END

set backspace=indent,eol,start " ensure backspace works in insert mode
set belloff=all " no err sounds
set tabstop=2 softtabstop=2 " tab is 2 spaces long set
set shiftwidth=2 " shift with < > does 2 spaces
set expandtab " converts tab to spaces
set smartindent " does best to not be bad at indenting
set number " set line numbers
set ignorecase " ignore case in search patterns
set smartcase " override ignorecase if search contains upper case char
set noswapfile " no swp files :D
set incsearch " shows matched string as you are typing it
set hlsearch " hightlight search results
set wildmenu " shows menu when using tab complete
set path+=** " search down into subfolders
set cursorline " highlight the text line of the cursor
" set relativenumber " set relative number by default

set laststatus=2 " adds status bar to bottom of screen (2 is always, see :help)
set statusline=%f " Path to the file
set statusline+=%= " Switch to the right side
set statusline+=%l " Current line
set statusline+=/ " Separator
set statusline+=%L " Total lines

set iskeyword+=- " allows hypenated words to be treated as a vim word text object
set history=1000 " keep 1000 items in the history
set scrolloff=7 " keeps lines above and below the cursor
set linebreak " stops vim from wrapping mid word"
" }}}

" Colour Settings {{{
syntax on " enable syntax

set termguicolors " uses highlight-guifg and highlight-guibg attributes
colorscheme onehalfdark

highlight ColorColumn ctermbg=none guibg=lightgrey
highlight CursorLine ctermbg=none gui=underline guibg=NONE

highlight ALEError ctermbg=none cterm=none gui=undercurl,bold guisp=red
highlight ALEWarning ctermbg=none cterm=none gui=undercurl,bold guifg=cyan
highlight MatchParen ctermbg=none guifg=red guibg=NONE gui=bold
" }}}

let g:go_fmt_command = "goimports" " Run goimports along gofmt on each save
let g:go_auto_type_info = 1 " Automatically get signature/type info for object under cursor

" function to create a terminal window at the bottom of the screen with a
" fixed height
function CreateTerm()
  botright terminal
  resize 15
endfunction
