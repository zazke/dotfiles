" Echoes longest line number and lenght.

function! LongestLineLength ( )
  let maxlength   = 0
  let linenumber  = 1
  while linenumber <= line("$")
    exe ":".linenumber
    let linelength  = virtcol("$")
    if maxlength < linelength
      let maxlength = linelength
      let maxlinenumber = linenumber
    endif
    let linenumber  = linenumber+1
  endwhile

"  exe ':0'
"  exe 'normal O'
"  exe 'normal 0C'.maxlength
  exe "normal" . maxlinenumber . "G"
  exe ":echo \"" . maxlinenumber . ": " . maxlength . "\""
endfunction

command LongestLineLength call LongestLineLength() 