" .vimrc File
" 2006-04-23 Marius Kleiner

"""""""""""""""""""""""""""""
" Default options
"""""""""""""""""""""""""""""

" Enable reading of first line for modelines
set modeline
set modelines=1

" Always display row and column number
set ruler

" Set background to dark
set background=dark

" Default textwidth: 80 cols
set textwidth=80

" Always show status line
set laststatus=2

" Enable all backspace options
set backspace=2

" Enable automatic save upon :make
set autowrite

" Set wildcard mode to bash-like
set wildmode=longest,full

" Enable colors
syntax enable

" REQUIRED. This makes vim invoke latex-suite when you open a tex file.
filetype plugin on

" Activate incremental search
set incsearch

" When editing a file, always jump to the last cursor position
" (Suggestion: improve this so that svn-commit*.tmp files always open with the
" cursor on the first line.)
autocmd BufReadPost *
      \ if ! exists("g:leave_my_cursor_position_alone") |
      \     if line("'\"") > 0 && line ("'\"") <= line("$") |
      \         exe "normal g'\"" |
      \     endif |
      \ endif

"""""""""""""""""""""""""""""
" Filetype specific options
"""""""""""""""""""""""""""""

"" LaTeX Files

" Set default "flavor" for tex files to tex (as opposed to plain tex)
let g:tex_flavor = 'latex'

" Set default LaTeX target to pdf, and set xpdf
au FileType tex let g:Tex_ViewRuleComplete = 'open $*'
au FileType tex let g:Tex_ViewRule_pdf = 'open $*'
"au FileType tex let g:Tex_ViewRuleComplete = 'open -a PDFView $*'
"au FileType tex let g:Tex_ViewRule_pdf = 'open -a PDFView $*'
"au FileType tex let g:Tex_ViewRuleComplete = 'open -a Skim $*'
"au FileType tex let g:Tex_ViewRule_pdf = 'open -a Skim $*'
au FileType tex let g:Tex_MultipleCompileFormats = 'dvi,pdf'
" It is important to call TTarget here, since otherwise the variables
" (re-)defined above won't be used!
au FileType tex TTarget pdf
au FileType tex set tabstop=2
au FileType tex set shiftwidth=2
au FileType tex set expandtab

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

"" HTML Files

" Insert skeleton
autocmd BufNewFile *.php 0r ~/.vim/templates/skeleton.php
autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
autocmd BufNewFile *.mp 0r ~/.vim/templates/skeleton.mp
autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
autocmd BufNewFile *.rb 0r ~/.vim/templates/skeleton.rb
