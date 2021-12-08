" Full config for theme sonph/onehalf
"syntax on
" onehalflight or onehalfdark
if &background ==# "dark"
	colorscheme onehalfdark
	highlight Normal guifg=white guibg=black ctermfg=white ctermbg=black
else
	colorscheme onehalflight
	highlight Normal guibg=#fafafa ctermbg=231
endif

" Comment out for light theme
"highlight Normal guibg=NONE
