" Miscellaneous global and common vim options

" Hide buffers on switch
set hidden

" More space for messages
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Show keystrokes
set showcmd

" Open splits naturally
set splitright
set splitbelow

" Enable truecolors
set termguicolors

" Tab size to 4
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Proper linebreak
set linebreak
set breakindent
set breakindentopt=shift:2

" Open Gdiff with vsplits
set diffopt+=vertical

" Enable syntax
"syntax enable

" Show line numbers and symbols
set signcolumn=yes

" Line numbers, relative
set number
set relativenumber

" Search case
set smartcase

" Use 256 colors
set t_Co=256

" Show whitespace chars
set listchars=eol:¬,tab:⎸\ ,trail:!
set list

" updatetime
set updatetime=750
