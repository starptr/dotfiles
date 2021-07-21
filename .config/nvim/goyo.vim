" Options for junegunn/goyo.vim

function s:goyo_leave()
	call g:ResetColorscheme()
endfunction

augroup goyo_autos
	autocmd!
	autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END
