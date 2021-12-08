" Options to simulate nvim experience in vim
" Only load this file in vim (i.e. use `if !has('nvim')` before loading)

" Cursor (default behavior in nvim)
let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

" Fix truecolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Fix tab, trailing space char colors
" Must be set after calling :colorscheme
highlight SpecialKey ctermfg=240 guifg=#5a5a5a
