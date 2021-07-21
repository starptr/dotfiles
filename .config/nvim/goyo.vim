" Options for junegunn/goyo.vim

function s:goyo_enter()
	nnoremap j gj
	nnoremap k gk
	set nobreakindent
endfunction

function s:goyo_leave()
	nunmap j
	nunmap k
	set breakindent
	call g:ResetColorscheme()
endfunction

augroup goyo_autos
	autocmd!
	autocmd user GoyoEnter nested call <SID>goyo_enter()
	autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END
