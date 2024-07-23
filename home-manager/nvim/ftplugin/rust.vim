let g:rustfmt_autosave = 1

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/,$RUST_SRC_PATH/rusty-tags.vi
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!
