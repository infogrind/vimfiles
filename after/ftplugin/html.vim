" Insert template for new text files
" As this is an ftplugin file, it is always executed when the filetype is
" detected to be html. Therefore we need to manually check whether it is
" actually a new file or an existing one. (See this SO answer for an
" explanation: https://stackoverflow.com/a/23496504/319282.)
"
if !filereadable(expand('%'))
    0r ~/.vim/skeleton.html
endif
