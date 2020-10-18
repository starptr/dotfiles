" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
"Plug 'junegunn/seoul256.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
"Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Enable truecolors
set termguicolors

" Keybind NERDTree
nmap <C-t> :NERDTreeToggle<CR>

" Enable syntax
syntax on

" Line numbers
set number

" Onedark config
"let g:lightline = {
"	\ 'colorscheme': 'onedark',
"	\ }
"colorscheme onedark

" Vim-code-dark config
"let g:lightline = {
"	\ 'colorscheme': 'codedark',
"	\ }
set t_Co=256
colorscheme codedark

" Vim-airline config
"let g:airline_powerline_fonts = 1
"let g:airline_skip_empty_sections = 1
" Powerline-like
let g:airline_section_z = airline#section#create(['windowswap', '%3p%% ', 'linenr', ':%3v'])
" Default Vim-airline theme
let g:airline_theme='powerlineish'

" Tmuxline config
let g:tmuxline_preset = 'powerline'
"let g:tmuxline_preset = {
"    \'a'    : '#{prefix_highlight}',
"    \'b'    : '#W',
"    \'c'    : '#H',
"    \'win'  : '#I #W',
"    \'cwin' : '#I #W',
"    \'x'    : '%a',
"    \'y'    : '#W %R',
"    \'z'    : '#H'}
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'powerline'

" coc tab autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" coc status info
set statusline^=%{coc#status()}
