" Options for language-specific plugins and related

" Detect filetypes for uncommon filename extensions
augroup file_special_ext_detect
	autocmd!
	autocmd BufNewFile,BufRead .prettierrc setfiletype json
augroup END

" vim-cpp-enhanced-highlight
" 
" Highlight class names in declarations
let g:cpp_class_decl_highlight = 1
" Highlight member variables
let g:cpp_member_variable_highlight = 1

" vim-svelte-plugin
let g:vim_svelte_plugin_use_typescript = 1
let g:vim_svelte_plugin_use_sass = 1
