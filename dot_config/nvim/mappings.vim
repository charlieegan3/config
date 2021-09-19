let mapleader=";"

" movement
noremap j gj
noremap k gk
noremap B 0
noremap E $

" buffer navigation
nnoremap L :only\|up\|bn<cr>
nnoremap H :only\|up\|bp<cr>

" open file finder
nnoremap <SPACE> :up \| :FZF<cr>

" quit vim
nnoremap <leader>q :silent exec "wa" \| silent exec "qall"<cr>

" delete current file
nnoremap <leader>dd :call delete(expand('%')) \| bdelete!<cr>

" rename file
nnoremap <expr> <leader>r ":Rename " . expand('%:t')

" generate ctags for repo
nnoremap <leader>T :!ctags -R .<cr>

" go to definition
nnoremap <tab> <C-]>

" open file text replace
nnoremap <Down> :%s /

" copy to system clipboard
vnoremap <cr> "+y<cr>

" paste from system clipboard
vnoremap <BS> "+p<cr>

" spelling
nnoremap <BS> 1z=

" exit insert mode
inoremap jj <esc>

" completion
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
