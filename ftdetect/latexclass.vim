" Override the default vim behavior (which is to assume tex for .cls files only
" if the first line starts with a '%' and otherwise sets it to rexx or
" smalltalk; see filetype.vim in your local vim installation's share/vim/vim..
" directory). I don't use Smalltalk or rexx, so I just always assume it's a tex
" file.
au BufRead,BufNewFile *.cls setf tex
