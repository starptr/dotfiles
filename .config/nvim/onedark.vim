" Options for joshdick/onedark.vim

" Enable italics
let g:onedark_terminal_italics=1

" Enable true color outside tmux
if (has("nvim"))
	"For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
	let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
	augroup colorset
		autocmd!
		let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
		autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
	augroup END
endif

" Customize highlight groups
if (has("autocmd"))
	augroup colorextend
		autocmd!
		" Make comments green
"		autocmd ColorScheme * call onedark#extend_highlight("Comment", { "fg": { "cterm": 107, "gui": "#7b9e62" } })
		" Make whitespace brighter
		autocmd ColorScheme * call onedark#extend_highlight("SpecialKey", { "fg": { "gui": "#505050" } })
	augroup END
endif
