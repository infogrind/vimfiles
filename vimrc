" .vimrc File
" Marius Kleiner
" <kleiner@gmail.com>

" Make sure vim understands the non-ASCII characters that follow below.
set encoding=utf-8
scriptencoding utf-8

"""""""""""""""""""""""""""""
" Helper Functions used below
"""""""""""""""""""""""""""""

" Function to source only if file exists {
" Source: https://devel.tech/snippets/n/vIIMz8vZ/load-vim-source-files-only-if-they-exist/
function! SourceIfExists(file)
  if filereadable(expand(a:file))
    exe 'source' a:file
  endif
endfunction
" }


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

" As we use the lightline plugin (see below), there is no need to show the mode
" again in the last line (see also https://github.com/itchyny/lightline.vim).
set noshowmode

"""""""""""""""""""""""""""""""
" Display of special characters
"""""""""""""""""""""""""""""""

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" Source: http://vimcasts.org/episodes/show-invisibles/

"""""""""""""""""""""""""""""""
" Custom key mappings
"""""""""""""""""""""""""""""""
" Easy editing of vimrc
nnoremap <leader>ev :split $HOME/.vim/vimrc<cr>

" Show whitespace as error (turn off again with ':match' without args)
nnoremap <leader>w :match Error /\v[ \t]+$/<cr>

" Turn off matches (see previous map)
nnoremap <leader>W :match none<cr>

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
augroup au_marius
	autocmd!
	autocmd BufNewFile *.php 0r ~/.vim/templates/skeleton.php
	autocmd BufNewFile *.pl 0r ~/.vim/templates/skeleton.pl
	autocmd BufNewFile *.mp 0r ~/.vim/templates/skeleton.mp
	autocmd BufNewFile *.py 0r ~/.vim/templates/skeleton.py
	autocmd BufNewFile *.rb 0r ~/.vim/templates/skeleton.rb
	autocmd BufNewFile *.html 0r ~/.vim/templates/skeleton.html
augroup end

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run local file if present
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call SourceIfExists("~/.vimrc.local")

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
" 2019/08/25 Disabling the following, as it is more annoying than helpful.
"Plug 'w0rp/ale', { 'for' : 'python' }
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
" 2019/12/14: toml (Rust Cargo) plugin
Plug 'cespare/vim-toml'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin specific configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Options for vim-markdown-preview
" See https://github.com/JamshedVesuna/vim-markdown-preview#options
let vim_markdown_preview_github=1   " use grip to use github-type markdown
let vim_markdown_preview_browser='Google Chrome'

" Options for lightline (displaying the git branch requires also the fugitive
" plugin)
let g:lightline = {
			\ 'colorscheme': 'wombat',
			\ 'active': {
			\   'left': [ [ 'mode', 'paste' ],
			\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
			\ },
			\ 'component_function': {
			\   'gitbranch': 'fugitive#head'
			\ },
			\}
