syntax on

nmap ; :

set backspace=indent,eol,start " ensure backspace works in insert mode

set termguicolors " uses highlight-guifg and highlight-guibg attributes

set belloff=all " no err sounds
set tabstop=2 softtabstop=2 " tab is 2 spaces long set
set shiftwidth=2 " shift with < > does 2 spaces 
set expandtab " converts tab to spaces
set smartindent " does best to not be bad at indenting
set number " set line numbers
set nowrap " no wrapping lines
set ignorecase " ignore case in search patterns
set smartcase " override ignorecase if search contains upper case char
set noswapfile " no swp files :D
set incsearch " get results while searching :D

set colorcolumn=100 " set a column off 100 length
highlight ColorColumn ctermbg=0 guibg=lightgrey
