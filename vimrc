" .vimrc File
" Marius Kleiner
" <kleiner@gmail.com>

"""""""""""""""""""""""""""""
" Default options
"""""""""""""""""""""""""""""
" We start by sourcing defaults.vim, this way there is no need to reinvent the
" wheel. Afterwards we only need to change that which isn't already set in the
" defaults.
runtime defaults.vim

" Disable mouse options - I prefer to use the mouse for OS specific things like
" OS level copy/paste.
set mouse=

" Default textwidth: 80 cols (this can be overwritten by filetype-specific
" ftplugin files).
set textwidth=80

" Always show status line (alternatives: 0 = never, 1 = only if >= 2 windows)
set laststatus=2

" Enable automatic save upon :make
set autowrite

" Set wildcard mode to bash-like and show options in menu
set wildmode=longest,full

"""""""""""""""""""""""""""""""
" Display of special characters
"""""""""""""""""""""""""""""""

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Source: http://vimcasts.org/episodes/show-invisibles/

""""""""""""""""""""""""""""""
" Various keyboard shortcuts
""""""""""""""""""""""""""""""

" Line numbering
nmap <leader>n :set nu!<CR>

""""""""""""""""""""""""""""""
" Color options
""""""""""""""""""""""""""""""

" Start with defaults
colorscheme default

" I prefer light colors
set background=dark

" And apply my own modifications (see colors/marius.vim)
colorscheme marius

"""""""""""""""""""""""""""""
" Filetype specific options
"""""""""""""""""""""""""""""

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

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
autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin section; see
" https://github.com/junegunn/vim-plug/blob/master/README.md
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" latex-suite
Plug 'vim-latex/vim-latex', { 'for' : 'tex' }
Plug 'JamshedVesuna/vim-markdown-preview', { 'for' : 'markdown' }
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Options for vim-markdown-preview
" See https://github.com/JamshedVesuna/vim-markdown-preview#options
let vim_markdown_preview_github=1   " use grip to use github-type markdown
let vim_markdown_preview_browser='Google Chrome'
