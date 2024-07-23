let b:ale_linters = ['eslint']

nnoremap <leader>f :! eslint % --fix<cr>

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
