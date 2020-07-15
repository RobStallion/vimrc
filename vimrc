syntax on " enable syntax

filetype plugin on " allow filetype plugins

" Mappings {{{
let mapleader=" "

nnoremap ; :

" edit & source vimrc
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:nohlsearch<cr>

" copy to clipboard
vnoremap Y "+y

" remove highlighted search
nnoremap H :nohlsearch<cr>

" error match for trailing whitespace
nnoremap <leader>w :match Error /\v\s+$/<cr>

" clear error match
nnoremap <leader>W :match none<cr>

" remove trailing whitespace and remove highlighted search
nnoremap <leader>rtw :%s/\v\s+$//g<cr>:nohlsearch<cr>:w<cr>

" automatically make vim search use 'regular' regex
nnoremap / /\v

" toggle relative number
nnoremap <leader>R :setlocal relativenumber!<cr>

" toggle spellcheck
nnoremap <leader>SC :set spell!<cr>

" Create terminal
nnoremap <leader>t :call CreateTerm()<cr>

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
set incsearch " get results while searching :D
set hlsearch " hightlight search results
set wildmenu " display all matching files when using tab complete
set path+=** " search down into subfolders
set cursorline " highlight the text line of the cursor

set laststatus=2 " adds status bar to bottom of screen (2 is always, see :help)
let g:currentDirectory = split(getcwd(), '/')[-1]
set statusline=%{g:currentDirectory}/
set statusline=%f " Path to the file
set statusline+=%= " Switch to the right side
set statusline+=%l " Current line
set statusline+=/ " Separator
set statusline+=%L " Total lines

set iskeyword+=- " allows hypenated words to be treated as a vim word text object
" }}}

" Colour Settings {{{
set termguicolors " uses highlight-guifg and highlight-guibg attributes

highlight ColorColumn ctermbg=none guibg=lightgrey
highlight CursorLine ctermbg=none gui=underline guibg=NONE

highlight ALEError ctermbg=none cterm=none gui=undercurl,bold guisp=red
highlight ALEWarning ctermbg=none cterm=none gui=undercurl,bold guifg=cyan
highlight MatchParen ctermbg=none guifg=red guibg=NONE gui=bold
" }}}

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

augroup operator_pending
  autocmd! operator_pending
  call CreateOperatorPendingMappings()
  onoremap <buffer> in" :<c-u>execute "normal! /\"\r:noh\rvi\""<cr>
  onoremap <buffer> il" :<c-u>execute "normal! ?\"\r:noh\rvi\""<cr>
augroup END

" function to create a terminal window at the bottom of the screen with a
" fixed height
function CreateTerm()
  set splitbelow
  term
  set nosplitbelow
  resize 15
  set winfixheight
endfunction
