" No compat
set nocompatible

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

	" Declare the list of plugins.
	Plug 'tpope/vim-sensible'
	"Plug 'junegunn/seoul256.vim'
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	"Plug 'autozimu/LanguageClient-neovim', {
	"	\ 'branch': 'next',
	"	\ 'do': 'bash install.sh',
	"	\ }
	
	" Language-specific support
	Plug 'sheerun/vim-polyglot'
	"Plug 'leafgarland/typescript-vim'
	"Plug 'bfrg/vim-cpp-modern'
	"Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'jiangmiao/auto-pairs'

	let g:vimspector_enable_mappings = 'HUMAN'
	Plug 'puremourning/vimspector'
	"packadd! vimspector
	
	Plug 'preservim/nerdtree'
	Plug 'ryanoasis/vim-devicons'
	"Plug 'vim-airline/vim-airline'
	"Plug 'vim-airline/vim-airline-themes'
	Plug 'itchyny/lightline.vim'
	Plug 'joshdick/onedark.vim'
	Plug 'tomasiser/vim-code-dark'
	Plug 'tmux-plugins/vim-tmux'
	Plug 'tpope/vim-fugitive'
	"Plug 'edkolev/tmuxline.vim'
	Plug 'luochen1990/rainbow'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Add a neovim runtimepath to vim
" nvimify called at the end
if !has('nvim')
	let &runtimepath.=',/home/yuto/.config/nvim'
endif

" Use Windows clipboard
if has('nvim')
	set clipboard=unnamedplus
else
	set clipboard=unnamed

	autocmd TextYankPost * call system('win32yank.exe -i --crlf', @")

	function! Paste(mode)
	    let @" = system('win32yank.exe -o --lf')
	    return a:mode
	endfunction

	map <expr> p Paste('p')
	map <expr> P Paste('P')
endif

" Build c++ file
map <leader>b :!g++ main.cpp -ggdb -o main <enter>

" Prohibit arrowkeys
" in normal mode
nnoremap <Left>  : echoe "Use h" <CR>
nnoremap <Right> : echoe "Use l" <CR>
nnoremap <Up>    : echoe "Use k" <CR>
nnoremap <Down>  : echoe "Use j" <CR>
" in insert mode
inoremap <Left>  : echoe "Use h" <CR>
inoremap <Right> : echoe "Use l" <CR>
inoremap <Up>    : echoe "Use k" <CR>
inoremap <Down>  : echoe "Use j" <CR>

" Tmuxline config
"let g:tmuxline_preset = 'powerline'
"let g:tmuxline_preset = {
"    \'a'    : '#{prefix_highlight}',
"    \'b'    : '#W',
"    \'c'    : '#H',
"    \'win'  : '#I #W',
"    \'cwin' : '#I #W',
"    \'x'    : '%a',
"    \'y'    : '#W %R',
"    \'z'    : '#H'}
"let g:airline#extensions#tmuxline#enabled = 0
"let g:tmuxline_theme = 'powerline'

" Global vim options
runtime ./misc-qol.vim

" Theming
"runtime ./airline.vim
runtime ./onedark.vim
runtime ./lightline.vim
" Theme-related vim options
syntax enable
colorscheme onedark

" Language-specific configs
runtime ./languages.vim

" Rainbow config
runtime ./rainbow.vim

" NERDTree config
runtime ./nerdtree.vim

" coc config
runtime ./coc-nvim.vim

" Nvimify vim
if !has('nvim')
	runtime ./nvimify.vim
endif
