" Echoes longest line number and lenght.

function! LongestLineLength ( )
    let maxlength = 0
    let linenumber= 1
    while linenumber <= line("$")
        exe ":".linenumber
        let linelength = virtcol("$")
        if maxlength < linelength
            let maxlength = linelength
            let maxlinenumber = linenumber
        endif
        let linenumber = linenumber+1
    endwhile

"exe ':0'
"exe 'normal O'
"exe 'normal 0C'.maxlength
    exe "normal" . maxlinenumber . "G"
    exe ":echo \"" . maxlinenumber . ": " . maxlength . "\""
endfunction

command LongestLineLength call LongestLineLength() 


" Save markdown document and export to pdf using pandoc.
"
" It would be nicer if a default document would be used but I coulnd't made it
" to work even after reading that manual section like 2 times.  Also, there are
" variables that are lists of other variables that I don't know how to make them
" work (e.g. geometry=[top=1in, bottom=1in, heightrounded])

function! Md2Pdf ( )
    exe ":w"
    exe ":! pandoc -o " . expand("%:r") . ".pdf -t latex -N --variable classoption=twosides --variable papersize=a4 --variable margin-left=1in --variable margin-right=1in --variable margin-top=1in --variable margin-bottom=1in --variable links-as-notes --variable colorlinks --variable pagestyle=plain --variable documentclass=article " . expand("%")
    echo "pdf saved as " . expand("%:p:r") . ".pdf"
endfunction

function! Md2Pdfms ( )
    exe ":w"
    exe ":! pandoc -o " . expand("%:r") . ".pdf" . " -t ms -N " . expand("%")
    echo "pdf saved as " . expand("%:p:r") . ".pdf"
endfunction

command Md2Pdf call Md2Pdf() 
command Md2Pdfms call Md2Pdfms() 


" Save markdown document and export to html using pandoc

function! Md2Html ( )
    exe ":w"
    exe ":! pandoc -o " . expand("%:r") . ".html" . " -s -N " . expand("%")
    echo "html saved as " . expand("%:p:r") . ".html"
endfunction

command Md2Html call Md2Html() 

" Compiles and Runs a C++ project

" TODO: how to add program's arguments or file redirectioning  from command.
function! CompRunProj ( )
    exe ":w"
    exe ":! g++ -o " . expand("%:r") . "-g *.cpp"
    exe ":! ./" . expand("%:r")
endfunction

command CompRunProj call CompRunProj()
