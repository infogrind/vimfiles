" .vimrc File
" Marius Kleiner
" <kleiner@gmail.com>

"""""""""""""""""""""""""""""
" Default options
"""""""""""""""""""""""""""""

" Always display row and column number
set ruler

" Set background to dark
set background=dark

" Default textwidth: 80 cols (this can be overwritten by filetype-specific
" ftplugin files).
set textwidth=80

" Always show status line (alternatives: 0 = never, 1 = only if >= 2 windows)
set laststatus=2

" Enable all backspace options
set backspace=indent,eol,start

" Enable automatic save upon :make
set autowrite

" Set wildcard mode to bash-like and show options in menu
set wildmode=longest,full
set wildmenu

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

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
filetype indent on

" This tells vim's detection algorithm for *.tex files to default to latex (see
" the function dist#ft#FTtex() in autoload/dist/ft.vim under share/vim/...).
let g:tex_flavor = 'latex'

"" HTML Files

" Insert skeleton
autocmd BufNewFile *.php 0r ~/.vim/templates/skeleton.php
autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
autocmd BufNewFile *.mp 0r ~/.vim/templates/skeleton.mp
autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
autocmd BufNewFile *.rb 0r ~/.vim/templates/skeleton.rb
