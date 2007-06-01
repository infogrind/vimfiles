" Function to make PDFView display the correct line
function! Tex_ForwardSearchLaTeX()
  if &ft != 'tex'
    echo "calling Tex_ViewLaTeX from a non-tex file"
    return
  end

  let mainfnameRoot = fnamemodify(Tex_GetMainFileName(), ':p:r')


  let execString = 'silent! !/Applications/PDFView.app/Contents/MacOS/gotoline.sh '.line('.').' "'.mainfnameRoot.'.pdf"'

  echo "Calling Tex_ViewLaTeX"
  call Tex_Debug("Tex_ForwardSearchLaTeX: execString = ".execString, "comp")
  execute execString
  if !has('gui_running')
    redraw!
  endif
endfunction
