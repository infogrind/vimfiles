" Adopted from:
" http://vim.wikia.com/wiki/Create_a_color_scheme_based_on_another

"these lines are suggested to be at the top of every colorscheme
hi clear
if exists("syntax_on")
  syntax reset
endif

"Load the 'default' colorscheme - the one you want to alter

"Clear the colors for any items that you don't like
hi clear SpecialKey
hi clear NonText

" Set up new & improved colors
" To figure out how to determine the color numbers, see
" https://askubuntu.com/a/821163
hi SpecialKey ctermfg=darkgrey
hi NonText ctermfg=darkgrey
