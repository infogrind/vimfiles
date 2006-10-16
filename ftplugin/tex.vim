if has('gui_running')
  imap <buffer> <silent> <F8> <Plug>Tex_Completion
else
  imap <buffer> <F8> <Plug>Tex_Completion
endif

