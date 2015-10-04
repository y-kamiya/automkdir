let s:save_cpo = &cpo
set cpo&vim

function! automkdir#save()
    let dir = expand("%:h")
    if (!isdirectory(dir))
        call s:askQuit("Directory " . dir . " does not exist.", "&Create?")
        try
            call mkdir(dir, 'p')
        catch 
            call s:askQuit("Failed to mkdir: " . dir, "&Edit anyway?")
        endtry
    endif
endfunction
function! s:askQuit(msg, action)
    if (confirm(a:msg, "&Quit?\n" . a:action) == 1)
        exit
    endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
