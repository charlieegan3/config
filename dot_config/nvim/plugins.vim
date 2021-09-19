let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!vendor*' --glob '!.git/*'"

let g:UltiSnipsSnippetDirectories=["my-snippets"]
let g:UltiSnipsExpandTrigger="<leader><Tab>"

let g:ackprg = 'rg --vimgrep'

call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  Plug 'chriskempson/base16-vim'

  Plug 'Shougo/deoplete.nvim'
  Plug 'Shougo/context_filetype.vim'
  Plug 'Shougo/neco-syntax'
  Plug 'wellle/tmux-complete.vim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'

  Plug 'mileszs/ack.vim'
  Plug 'chrisbra/unicode.vim'   " unicode chars

  Plug 'ap/vim-buftabline'      " tabs for open buffers
  Plug 'qpkorr/vim-renamer'     " bulk renaming
  Plug 'danro/rename.vim'       " adds the :Rename file command

  Plug 'tpope/vim-fugitive'     " git commands, Gread
  Plug 'mhinz/vim-signify'      " gutter diff

  Plug 'tpope/vim-surround'     " brackets etc

  Plug 'dietsche/vim-lastplace' " remember last cursor position in file
  Plug 'wellle/targets.vim'     " additional change-inside targets (', \, <>)

  Plug 'SirVer/ultisnips'       " snippet engine

  Plug 'sedm0784/vim-you-autocorrect' " smartphone-like lazy correction

  Plug 'dense-analysis/ale'

  " language plugins
  Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoUpdateBinaries' }

  Plug 'rust-lang/rust.vim'

  Plug 'pangloss/vim-javascript'
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  Plug 'Chiel92/vim-autoformat' " opa autoformat

  Plug 'avakhov/vim-yaml', { 'for': 'yaml' }
  Plug 'pearofducks/ansible-vim', { 'for': 'yaml' }
  Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
  Plug 'tmux-plugins/vim-tmux', { 'for': 'tmux' }

  Plug 'tpope/vim-endwise', { 'for': 'ruby' }
  Plug 'tpope/vim-haml', { 'for': 'haml' }
  Plug 'slim-template/vim-slim', { 'for': 'slim' }
  Plug 'alvan/vim-closetag', { 'for': ['html', 'eruby'] }
  Plug 'kchmck/vim-coffee-script', { 'for': 'coffeescript' }

  Plug 'posva/vim-vue', { 'for': 'vue' }
  Plug 'leafgarland/typescript-vim', { 'for': ['ts', 'tsx'] }
  Plug 'peitalin/vim-jsx-typescript', { 'for': ['jsx', 'tsx'] }

  Plug 'idris-hackers/idris-vim', { 'for': ['idris'] }

  Plug 'rodjek/vim-puppet', { 'for': 'puppet' }

  Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }

  Plug 'lervag/vimtex', { 'for': 'latex' }

  Plug 'martinda/Jenkinsfile-vim-syntax', { 'for': 'jenkins' }

  Plug 'lepture/vim-jinja', { 'for': 'jinja' }

  Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }

  Plug 'tsandall/vim-rego', { 'for': 'rego' }

  Plug 'google/vim-jsonnet', { 'for': 'jsonnet' }
call plug#end()
