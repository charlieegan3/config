let g:go_imports_autosave = 1
let g:ale_linters = { 'go': ['golint', 'gopls'] }

let g:go_def_mode = "gopls"

let g:go_doc_keywordprg_enabled = "0"

let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
highlight Type        ctermfg=57
highlight Statement   ctermfg=130
highlight Keyword     ctermfg=88
highlight Conditional ctermfg=33
highlight Label       ctermfg=33
highlight Repeat      ctermfg=33
highlight Number      ctermfg=28
highlight Integer     ctermfg=28
highlight String      ctermfg=28
highlight Operator    ctermfg=196
highlight Function    ctermfg=166
highlight Identifier  ctermfg=70


setlocal nolist
setlocal syntax=on
setlocal noexpandtab tabstop=4 softtabstop=4
nnoremap tt :! clear; go test<cr>
nnoremap tr :GoAlternate<cr>
nnoremap <tab> :GoDef<cr>
nnoremap <leader>g :GoDeclsDir<cr>
nnoremap <leader>d :GoDoc<cr>

set nospell
