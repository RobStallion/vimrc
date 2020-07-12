syntax on " enable syntax

filetype plugin on " allow filetype plugins

" Mappings {{{
let mapleader=" "

nnoremap ; :

" edit & source vimrc
nnoremap <leader>ev :vsp $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" copy to clipboard
vnoremap Y "+y

" remove highlighted search
nnoremap H :nohlsearch<cr>

" error match for trailing whitespace
nnoremap <leader>w :match Error /\v\s+$/<cr>

" clear error match
nnoremap <leader>W :match none<cr>

" remove trailing whitespace and remove highlighted search
nnoremap <leader>rtw :%s/\v\s+$//g<cr>:nohlsearch<cr>

" automatically make vim search use 'regular' regex
nnoremap / /\v

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
" set colorcolumn=100 " set a column off 100 length
set wildmenu " display all matching files when using tab complete
set path+=** " search down into subfolders
set cursorline " highlight the text line of the cursor
" set relativenumber

set laststatus=2 " adds status bar to bottom of screen (2 is always, see help)
set statusline=%f " Path to the file
set statusline+=%= " Switch to the right side
set statusline+=%l " Current line
set statusline+=/ " Separator
set statusline+=%L " Total lines
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

augroup filetype_javascript
  autocmd! filetype_javascript
  autocmd FileType javascript call CreateOperatorPendingMappings()
  autocmd FileType javascript onoremap <buffer> in" :<c-u>execute "normal! /\"\r:noh\rvi\""<cr>
  autocmd FileType javascript onoremap <buffer> il" :<c-u>execute "normal! ?\"\r:noh\rvi\""<cr>
augroup END

" This marks (m) the current cursor position to q
" goes to end of line and adds a semi-colon
" go back to marked cursor position (`) q
" :execute "normal! mqA;\<esc>`q"
" Don't see myself using this particular command but keeping as a reminder.
" Feel like this could be helpful in future
