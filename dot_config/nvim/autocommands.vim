" whitespace fixes
autocmd BufWritePre * :%s/\s\+$//e

" clear search
autocmd BufRead,BufEnter * :let @/ = ""
autocmd InsertLeave * :setlocal hlsearch
autocmd InsertEnter * :setlocal nohlsearch

" create paths before save
autocmd BufWritePre * :silent !mkdir -p %:p:h

" filetype help
autocmd BufRead,BufNewFile {Gemfile,Rakefile,Vagrantfile,Thorfile,Procfile,*.ru,*.rake,*.json.jbuilder} set ft=ruby
autocmd BufRead,BufNewFile {*.conf} set ft=c
