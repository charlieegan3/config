syntax enable " turn on syntax highlighting
set path=$PWD/** " use the current working directory as the path
set nocompatible " disable compatibility features
set wildmenu " show command suggestions
set showmatch " highlight matching parenthesis
set incsearch " search while typing
set hlsearch " mark matches to searches
set ignorecase " Make searches case insensitive
set smartcase " (Unless they contain a capital letter)
set scrolloff=5 " keep 5 lines between top/bottom of screen and cursor
set noerrorbells " i don't make mistakes, so I don't need the bells
set colorcolumn=80 " draw a column to guide line length
set nowrap " don't wrap lines
set lazyredraw " only redraw vim when required
set laststatus=0 " don't show the filename at the bottom of window (because it's at the top)
set ff=unix
set complete-=i
set autowrite " write when closing files, and running build commands
set completeopt=longest,menuone
set encoding=utf-8
set cursorline " show underline for current cursor line

set undofile " maintain undo history
set undodir=~/.config/nvim/.undo/
set backupdir=~/.config/nvim/.backup/
set directory=~/.config/nvim/.swp/

set number numberwidth=3 " show numbers column

set shiftwidth=4 " the default is 8?

set smarttab smartindent
set tabstop=4
set list listchars=tab:>-

set backspace=indent,eol,start " backspace behavior

" must be in .vimrc :(
let g:deoplete#enable_at_startup = 1
let g:terraform_fmt_on_save = 1

source ~/.config/nvim/plugins.vim
call deoplete#custom#option('omni_patterns', {
\ 'go': '[^. *\t]\.\w*',
\})
source ~/.config/nvim/ft_overrides.vim
source ~/.config/nvim/mappings.vim
source ~/.config/nvim/autocommands.vim

colorscheme base16-gruvbox-light-soft
source ~/.config/nvim/highlighting.vim

function! SynStack ()
    for i1 in synstack(line("."), col("."))
        let i2 = synIDtrans(i1)
        let n1 = synIDattr(i1, "name")
        let n2 = synIDattr(i2, "name")
        echo n1 "->" n2
    endfor
endfunction
map gm :call SynStack()<CR>

autocmd BufWritePost ~/.local/share/chezmoi/* ! chezmoi apply --source-path %
