" coc tab autocomplete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Trigger autocomplete
inoremap <silent><expr> <c-space> coc#refresh()

" coc status info
set statusline^=%{coc#status()}
