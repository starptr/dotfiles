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
	"Plug 'dense-analysis/ale'

	Plug 'MarcWeber/vim-addon-local-vimrc'
	" Plug 'embear/vim-localvimrc'

	" Language-specific support
	if has('nvim')
		Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
	endif

	"Plug 'sheerun/vim-polyglot'
	"Plug 'leafOfTree/vim-svelte-plugin'
	
	"Plug 'leafgarland/typescript-vim'
	"Plug 'bfrg/vim-cpp-modern'
	"Plug 'octol/vim-cpp-enhanced-highlight'
	Plug 'jiangmiao/auto-pairs'
	"Plug 'rstacruz/vim-closer'

	let g:vimspector_enable_mappings = 'HUMAN'
	Plug 'puremourning/vimspector'
	"packadd! vimspector
	
	Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'ryanoasis/vim-devicons'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	Plug 'francoiscabrol/ranger.vim'
	if has('nvim')
		Plug 'rbgrouleff/bclose.vim'
	endif
	"Plug 'vim-airline/vim-airline'
	"Plug 'vim-airline/vim-airline-themes'
	Plug 'itchyny/lightline.vim'
	Plug 'voldikss/vim-floaterm'

	Plug 'rakr/vim-one'
	Plug 'joshdick/onedark.vim'
	Plug 'tomasiser/vim-code-dark'
	Plug 'sonph/onehalf', {'rtp': 'vim'}
	
	Plug 'tmux-plugins/vim-tmux'
	Plug 'tpope/vim-fugitive'
	"Plug 'edkolev/tmuxline.vim'
	Plug 'luochen1990/rainbow'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Add a neovim runtimepath to vim and windows
" nvimify called at the end
if has('win32')
	let &runtimepath.=',~/dotfiles-linux/.config/nvim'
else
	if !has('nvim')
		let &runtimepath.=',~/.config/nvim'
	endif
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
map <leader>b :!g++ main.cpp -ggdb -fsanitize=address -fno-omit-frame-pointer -o main <enter>

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

" Statusline Theming
"runtime ./airline.vim
"runtime ./onedark.vim
runtime ./lightline.vim

" Reload statusline
function! g:LightlineReload()
	call lightline#init()
	call lightline#colorscheme()
	call lightline#update()
endfunction

" Automatic theme changing
function! SetDayNNite()
	let l:mode_config_filepath = expand("~/.config/day-n-nite/mode_config")
	if !filereadable(l:mode_config_filepath)
		set background=dark
	else
		let l:mode = readfile(l:mode_config_filepath)[0]

		"if &background ==# "light"
		if l:mode ==# "Night"
			set background=dark
		else
			set background=light
		endif
	endif

	" Apply theme
	"runtime ./use_theme_onehalf.vim
	runtime ./use_theme_one.vim

	call g:LightlineReload()
endfunction

augroup daynnite
	autocmd!
	if has('nvim')
		au Signal SIGUSR1 call SetDayNNite() | redraw! | normal! <c-L>
	else
		au SigUSR1 * call SetDayNNite() | redraw! | normal! <c-L>
	endif
augroup END

" Choose theme
call SetDayNNite()

" Language-specific configs
runtime ./languages.vim

" Rainbow config
runtime ./rainbow.vim

" NERDTree config
runtime ./nerdtree.vim

" coc config
runtime ./coc-nvim.vim
" ale config
"runtime ./ale.vim


if has('nvim')
" nvim-treesitter config
lua << EOF
	require'nvim-treesitter.configs'.setup {
		ensure_installed = { "c", "cpp", "css", "svelte", "regex", "lua", "rust", "toml", "yaml", "typescript", "javascript", "scss", "json", "java", "html", "bash","python", "latex", "tsx", "graphql", "dockerfile" },
		highlight = {
			enable = true,
		},
		incremental_selection = {
			enable = true,
		},
		indent = {
			enable = true,
		},
	}
EOF
endif

" vim-devicons config
if exists("g:loaded_webdevicons")
	call webdevicons#refresh()
endif
" NERDTrees File highlighting
"function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"	exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
"	exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
"endfunction
"augroup my_nerdtree_devicons_color
"	autocmd!
"	call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"	call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"	call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"	call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"	call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"	call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"	call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"	call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"	call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"	call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"	call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"	call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"	call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
"	call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', '#151515')
"	call NERDTreeHighlightFile('gitconfig', 'Gray', 'none', '#686868', '#151515')
"	call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#686868', '#151515')
"	call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', '#151515')
"	call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', '#151515')
"augroup END

" Nvimify vim
if !has('nvim')
	runtime ./nvimify.vim
endif
