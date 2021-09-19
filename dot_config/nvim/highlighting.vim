highlight Visual cterm=reverse

syntax match TrailingWhitespace "\s+$"
highlight TrailingWhitespace ctermbg=14

highlight SpellBad ctermbg=223 ctermfg=14 cterm=none
highlight SpellLocal ctermbg=10 ctermfg=14 cterm=none
highlight SpellRare ctermbg=10 ctermfg=14 cterm=none
highlight SpellCap ctermbg=10 ctermfg=14 cterm=none

highlight BufTabLineCurrent ctermbg=0

if exists('g:colors_name') && g:colors_name == 'base16-gruvbox-light-soft'
  highlight Search ctermbg=190 ctermfg=7

  highlight SignifySignAdd    ctermfg=6
  highlight SignifySignDelete ctermfg=14
  highlight SignifySignChange ctermfg=3

  highlight DiffAdd           ctermfg=6
  highlight DiffDelete        ctermfg=14
  highlight DiffChange        ctermfg=3

  highlight BufTabLineActive ctermbg=11
  highlight BufTabLineHidden ctermbg=11
  highlight BufTabLineFill ctermbg=10

  " doesn't work if error is on starting vim since colorscheme not loaded
  highlight MoreMsg ctermbg=10 ctermfg=6
endif

if exists('g:colors_name') && g:colors_name == 'base16-tube'
  highlight SignifySignAdd    ctermfg=119
  highlight SignifySignDelete ctermfg=167
  highlight SignifySignChange ctermfg=227

  highlight DiffAdd           ctermfg=119
  highlight DiffDelete        ctermfg=167
  highlight DiffChange        ctermfg=227

  highlight BufTabLineActive ctermbg=242
  highlight BufTabLineHidden ctermbg=242
  highlight BufTabLineFill ctermbg=240
endif
