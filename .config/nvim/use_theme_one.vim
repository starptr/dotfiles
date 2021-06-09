" Full config for theme rakr/vim-one
let g:one_allow_italics = 1

" Enable true color outside tmux
if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

syntax enable
colorscheme one

" Remove background color
if &background ==# "dark"
	highlight Normal guifg=white guibg=black ctermfg=white ctermbg=black
	"highlight Comment guifg=#8787af ctermfg=103
else
	"highlight Normal guifg=black guibg=NONE ctermfg=white ctermbg=NONE
	highlight Normal guibg=#fafafa ctermbg=231
endif
