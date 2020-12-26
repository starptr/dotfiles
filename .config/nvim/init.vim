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

Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'kevinoid/vim-jsonc'

Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'itchyny/lightline.vim'
"Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-fugitive'
Plug 'edkolev/tmuxline.vim'
Plug 'luochen1990/rainbow'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Use Windows clipboard
set clipboard=unnamedplus

" Hide buffers on switch
set hidden

" More space for messages
set cmdheight=2

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

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

" Show whitespace chars
set listchars=eol:¬,tab:>\ ,trail:!
set list

" Keybind NERDTree
nmap <C-t> :NERDTreeToggle<CR>

" Enable syntax
syntax enable

" Fixed gutter

" if has("patch-8.1.1564")
" 	" Recently vim can merge signcolumn and number column into one
" 	set signcolumn=number
" else
" 	set signcolumn=yes
" endif
set signcolumn=yes

" Detect FileType for special file extensions
augroup file_special_ext_detect
	autocmd!
	autocmd BufNewFile,BufRead .prettierrc setfiletype json
augroup END

" Trigger completion shortcut
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
	nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
	inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
	inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
	vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
	vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Line numbers, relative
set number
set relativenumber

" Search case
set smartcase

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

" NERDTree options
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1

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

" Activate rainbow
let g:rainbow_active = 1
" Set rainbow colors
let g:rainbow_conf = {
			\	'guifgs': ['#A070FF', '#D81E5B', '#E0D100', '#82FF9E', '#57B8FF'],
			\}

let rainbow_preview_test = {
			\ 'test': ['hi', ['yes', ['id like more', ['here', ['you', ['go']]]]]],
			\}

" Vim-airline config
"let g:airline_powerline_fonts = 1
"let g:airline_skip_empty_sections = 1
" Show buffers at top
let g:airline#extensions#tabline#enabled = 1
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

" coc updatetime
set updatetime=300

" coc config
runtime ./coc-nvim.vim
