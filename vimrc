" .vimrc File
" 2006-04-23 Marius Kleiner

"""""""""""""""""""""""""""""
" Default options
"""""""""""""""""""""""""""""

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

" Default indenting options
"set tabstop=2
"set shiftwidth=2
"set expandtab

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

"""""""""""""""""""""""""""""
" Filetype specific options
"""""""""""""""""""""""""""""

"" LaTeX Files

" Set default "flavor" for tex files to tex (as opposed to plain tex)
let g:tex_flavor = 'latex'

" Set default LaTeX target to pdf, and set xpdf
au FileType tex TTarget pdf
"au FileType tex let g:Tex_ViewRuleComplete = '/sw/bin/xpdf $* &'
au FileType tex let g:Tex_ViewRuleComplete = 'open -a TeXniscope $*'
au FileType tex let g:Tex_ViewRule_pdf = 'open -a TeXniscope $*'
au FileType tex let g:Tex_MultipleCompileFormats = 'dvi,pdf'

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

"" HTML Files

" Insert skeleton
autocmd BufNewFile *.html 0r ~/.vim/skeleton.html
autocmd BufNewFile *.php 0r ~/.vim/skeleton.php


"" C Files
au FileType c set tabstop=8
au FileType c set shiftwidth=8
au FileType c set expandtab

"" XML Files
au FileType xml set tabstop=2
au FileType xml set shiftwidth=2
au FileType xml set expandtab
