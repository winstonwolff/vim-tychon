" Language:    Tychon
" License:     WTFPL

autocmd BufNewFile,BufRead *.ty set filetype=tychon

function! s:DetectTychon()
    if getline(1) =~ '^#!.*\<tychon\>'
        set filetype=tychon
    endif
endfunction

autocmd BufNewFile,BufRead * call s:DetectTychon()
