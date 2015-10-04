if exists("g:loaded_automkdir")
  finish
endif
let g:loaded_automkdir = 1

let s:save_cpo = &cpo
set cpo&vim

augroup autoMakedir
    autocmd!
    autocmd BufWritePre * :call automkdir#save()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo

